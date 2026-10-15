#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fleet_root=${FLEET_SYMLINK_ROOT:-$(CDPATH= cd -- "$script_dir/.." && pwd)}
user_home=${FLEET_SYMLINK_HOME:-$(CDPATH= cd -- ~ && pwd)}

core_agents="$fleet_root/core-files/AGENTS.md"
fleet_agents="$fleet_root/core-files/FLEET.md"
core_claude="$fleet_root/core-files/CLAUDE.md"
source_skills="$fleet_root/skills"
canonical_source_skills=$(CDPATH= cd -- "$source_skills" && pwd -P)
local_skills="$fleet_root/.agents/skills"
healthy=0
unhealthy=0
local_count=0
results_file=$(mktemp "${TMPDIR:-/tmp}/fleet-symlink-health.XXXXXX")
trap 'rm -f "$results_file"' EXIT HUP INT TERM

case ${1:-} in
  '') ;;
  --sync)
    shift
    FLEET_SYMLINK_ROOT="$fleet_root" FLEET_SYMLINK_HOME="$user_home" \
      "$script_dir/sync-agent-configs.sh"
    ;;
  --help)
    echo "Usage: scripts/check-symlink-health.sh [--sync]"
    echo "  --sync  Link every global skill from skills/, then check both skill scopes."
    exit 0
    ;;
  *) echo "Unknown option: $1" >&2; exit 2 ;;
esac
[ "$#" -eq 0 ] || { echo "Too many arguments" >&2; exit 2; }

canonical_path() {
  path=$1
  if [ -d "$path" ]; then
    CDPATH= cd -- "$path" && pwd -P
    return
  fi

  path_parent=$(dirname -- "$path")
  path_name=$(basename -- "$path")
  canonical_parent=$(CDPATH= cd -- "$path_parent" && pwd -P)
  printf '%s/%s\n' "$canonical_parent" "$path_name"
}

report() {
  status=$1
  scope=$2
  link_path=$3
  target_path=$4
  case $link_path in
    "$user_home"/*) display_link="~/${link_path#"$user_home"/}" ;;
    *) display_link=$link_path ;;
  esac
  case $target_path in
    "$user_home"/*) display_target="~/${target_path#"$user_home"/}" ;;
    *) display_target=$target_path ;;
  esac
  printf '%s\t%s\t%s\t%s\n' "$status" "$scope" "$display_link" "$display_target" >> "$results_file"
}

render_table() {
  table_width=${FLEET_TABLE_WIDTH:-}
  if [ -z "$table_width" ]; then
    detected_width=${COLUMNS:-}
    if [ -z "$detected_width" ] && command -v tput >/dev/null 2>&1; then
      detected_width=$(tput cols 2>/dev/null || true)
    fi
    case $detected_width in
      ''|*[!0-9]*) detected_width=80 ;;
    esac
    table_width=$((detected_width - 8))
  fi
  case $table_width in
    ''|*[!0-9]*) table_width=100 ;;
  esac
  [ "$table_width" -ge 60 ] || table_width=60

  color_enabled=0
  case ${FLEET_COLOR:-auto} in
    always) color_enabled=1 ;;
    never) color_enabled=0 ;;
    auto)
      if [ -t 1 ] && [ "${TERM:-dumb}" != "dumb" ] && [ -z "${NO_COLOR:-}" ]; then
        color_enabled=1
      fi
      ;;
    *) echo "FLEET_COLOR must be auto, always, or never" >&2; exit 2 ;;
  esac

  awk -F '\t' -v terminal_width="$table_width" -v color_enabled="$color_enabled" '
    BEGIN {
      heading[1] = "STATUS"
      heading[2] = "SCOPE"
      heading[3] = "LINK"
      heading[4] = "RESOLVED TARGET"
      for (column = 1; column <= 4; column++) width[column] = length(heading[column])
    }
    {
      row_count++
      for (column = 1; column <= 4; column++) {
        cell[row_count, column] = $column
        if (length($column) > width[column]) width[column] = length($column)
      }
    }
    function shorten(text, maximum, left, right) {
      if (length(text) <= maximum) return text
      if (maximum <= 3) return substr(text, 1, maximum)
      left = int((maximum - 3) / 2)
      right = maximum - 3 - left
      return substr(text, 1, left) "..." substr(text, length(text) - right + 1)
    }
    function border(left, join, right, column, dash, separator) {
      printf "%s", left
      for (column = 1; column <= 4; column++) {
        dash = sprintf("%*s", width[column] + 2, "")
        gsub(/ /, "─", dash)
        separator = (column < 4 ? join : right)
        printf "%s%s", dash, separator
      }
      printf "\n"
    }
    function status_color(status) {
      if (status == "OK" || status == "LOCAL") return "\033[38;2;12;238;156m"
      if (status == "MISSING" || status == "NOTLINK") return "\033[38;2;255;234;0m"
      return "\033[38;2;255;92;115m"
    }
    function row(values, row_number, data_row, column, value, padding) {
      printf "│"
      for (column = 1; column <= 4; column++) {
        value = values[row_number, column]
        if (color_enabled && data_row && column == 1) {
          padding = sprintf("%-*s", width[column], value)
          printf " %s%s\033[0m │", status_color(value), padding
        } else {
          printf " %-*s │", width[column], value
        }
      }
      printf "\n"
    }
    END {
      natural_width = width[1] + width[2] + width[3] + width[4] + 13
      if (natural_width > terminal_width) {
        path_space = terminal_width - width[1] - width[2] - 13
        width[3] = int(path_space / 2)
        width[4] = path_space - width[3]
        if (width[3] < 12) width[3] = 12
        if (width[4] < 15) width[4] = 15
        for (record = 1; record <= row_count; record++) {
          cell[record, 3] = shorten(cell[record, 3], width[3])
          cell[record, 4] = shorten(cell[record, 4], width[4])
        }
      }
      border("┌", "┬", "┐")
      for (column = 1; column <= 4; column++) header[1, column] = heading[column]
      row(header, 1, 0)
      border("├", "┼", "┤")
      for (record = 1; record <= row_count; record++) row(cell, record, 1)
      border("└", "┴", "┘")
    }
  ' "$results_file"
}

check_link() {
  scope=$1
  link_path=$2
  expected_path=$3

  if [ ! -L "$link_path" ]; then
    if [ -e "$link_path" ]; then
      report "NOTLINK" "$scope" "$link_path" "$expected_path"
    else
      report "MISSING" "$scope" "$link_path" "$expected_path"
    fi
    unhealthy=$((unhealthy + 1))
    return
  fi

  raw_target=$(readlink "$link_path")
  case $raw_target in
    /*) linked_path=$raw_target ;;
    *) linked_path=$(dirname -- "$link_path")/$raw_target ;;
  esac

  if [ ! -e "$linked_path" ]; then
    report "BROKEN" "$scope" "$link_path" "$raw_target"
    unhealthy=$((unhealthy + 1))
    return
  fi

  actual=$(canonical_path "$linked_path")
  expected=$(canonical_path "$expected_path")
  if [ "$actual" != "$expected" ]; then
    report "WRONG" "$scope" "$link_path" "$actual"
    unhealthy=$((unhealthy + 1))
    return
  fi

  report "OK" "$scope" "$link_path" "$actual"
  healthy=$((healthy + 1))
}

check_local_skill() {
  skill_path=$1
  skill_name=$(basename -- "$skill_path")
  local_target=$(canonical_path "$skill_path")
  leaked=0

  for skills_root in \
    "$user_home/.codex/skills" \
    "$user_home/.claude/skills" \
    "$user_home/.gemini/skills" \
    "$user_home/.config/opencode/skills" \
    "$user_home/.copilot/skills" \
    "$user_home/.pi/agent/skills"
  do
    candidate="$skills_root/$skill_name"
    [ -L "$candidate" ] || continue
    [ -e "$candidate" ] || continue
    if [ "$(canonical_path "$candidate")" = "$local_target" ]; then
      report "LEAKED" "fleet-local" "$candidate" "$skill_path"
      unhealthy=$((unhealthy + 1))
      leaked=1
    fi
  done

  if [ "$leaked" -eq 0 ]; then
    report "LOCAL" "fleet-local" "$skill_path" "not synchronized"
  fi
  local_count=$((local_count + 1))
}

provider_root() {
  case $1 in
    codex) printf '%s' "$user_home/.codex/skills" ;;
    claude) printf '%s' "$user_home/.claude/skills" ;;
    gemini) printf '%s' "$user_home/.gemini/skills" ;;
    opencode) printf '%s' "$user_home/.config/opencode/skills" ;;
    copilot) printf '%s' "$user_home/.copilot/skills" ;;
    pi) printf '%s' "$user_home/.pi/agent/skills" ;;
    *) return 1 ;;
  esac
}

skill_dirs_for_provider() {
  provider=$1

  for bucket in universal command-center all global shared; do
    bucket_path="$source_skills/$bucket"
    [ -d "$bucket_path" ] || continue
    if [ -f "$bucket_path/SKILL.md" ]; then
      printf '%s\n' "$bucket_path"
    else
      for child in "$bucket_path"/*; do
        [ -d "$child" ] || continue
        if [ -f "$child/SKILL.md" ]; then
          printf '%s\n' "$child"
        elif find "$child" -type f -name SKILL.md -print 2>/dev/null | grep -q .; then
          find "$child" -type f -name SKILL.md -print | while IFS= read -r skill_md; do
            [ -n "$skill_md" ] || continue
            skill_path=$(dirname -- "$skill_md")
            printf '%s\n' "$skill_path"
          done
        else
          # Backward-compatible skill directory without SKILL.md.
          printf '%s\n' "$child"
        fi
      done
    fi
  done

  bucket_path="$source_skills/$provider"
  if [ -d "$bucket_path" ]; then
    if [ -f "$bucket_path/SKILL.md" ]; then
      printf '%s\n' "$bucket_path"
    else
      for child in "$bucket_path"/*; do
        [ -d "$child" ] || continue
        if [ -f "$child/SKILL.md" ]; then
          printf '%s\n' "$child"
        elif find "$child" -type f -name SKILL.md -print 2>/dev/null | grep -q .; then
          find "$child" -type f -name SKILL.md -print | while IFS= read -r skill_md; do
            [ -n "$skill_md" ] || continue
            skill_path=$(dirname -- "$skill_md")
            printf '%s\n' "$skill_path"
          done
        else
          printf '%s\n' "$child"
        fi
      done
    fi
  fi

  for skill_path in "$source_skills"/*; do
    [ -d "$skill_path" ] || continue
    skill_name=$(basename -- "$skill_path")
    case $skill_name in
      universal|command-center|all|global|shared|claude|codex|opencode|gemini|copilot|pi) continue ;;
    esac
    printf '%s\n' "$skill_path"
  done
}

is_source_parent() {
  target_parent=$1
  case $target_parent in
    "$canonical_source_skills") return 0 ;;
    "$canonical_source_skills"/*) return 0 ;;
    *) return 1 ;;
  esac
}

if [ ! -f "$fleet_agents" ] || [ ! -f "$core_agents" ] || [ ! -f "$core_claude" ] || [ ! -d "$source_skills" ] || [ ! -d "$local_skills" ]; then
  echo "Fleet symlink sources are incomplete under $fleet_root" >&2
  exit 2
fi

check_link "instruction" "$fleet_root/AGENTS.md" "$fleet_agents"
check_link "instruction" "$user_home/.codex/AGENTS.md" "$core_agents"
check_link "instruction" "$user_home/.claude/CLAUDE.md" "$core_claude"
check_link "instruction" "$user_home/.gemini/GEMINI.md" "$core_agents"
check_link "instruction" "$user_home/.config/opencode/AGENTS.md" "$core_agents"
check_link "instruction" "$user_home/.pi/agent/AGENTS.md" "$core_agents"
check_link "instruction" "$user_home/.pi/AGENTS.md" "$core_agents"

for provider in codex claude gemini opencode copilot pi; do
  skills_root=$(provider_root "$provider")
  mkdir -p "$skills_root"

  if [ -L "$skills_root" ]; then
    check_link "global-root" "$skills_root" "$source_skills"
    continue
  fi

  expected_file=$(mktemp "${TMPDIR:-/tmp}/fleet-expected.XXXXXX")
  names_file=$(mktemp "${TMPDIR:-/tmp}/fleet-names.XXXXXX")
  skill_dirs_for_provider "$provider" > "$expected_file"
  : > "$names_file"
  while IFS= read -r expected_dir; do
    [ -n "$expected_dir" ] || continue
    basename -- "$expected_dir" >> "$names_file"
  done < "$expected_file"

  # Stale Fleet-managed links are reported, never silently pruned.
  for candidate in "$skills_root"/*; do
    [ -L "$candidate" ] || continue
    raw_target=$(readlink "$candidate")
    case $raw_target in
      /*) linked_path=$raw_target ;;
      *) linked_path=$(dirname -- "$candidate")/$raw_target ;;
    esac
    if [ ! -d "$(dirname -- "$linked_path")" ]; then
      continue
    fi
    target_parent=$(CDPATH= cd -- "$(dirname -- "$linked_path")" && pwd -P)
    if ! is_source_parent "$target_parent"; then
      continue
    fi
    candidate_name=$(basename -- "$candidate")
    expected_name=0
    if grep -Fxq -- "$candidate_name" "$names_file"; then
      expected_name=1
    fi
    source_skill_present=0
    if [ -d "$target_parent/$candidate_name" ]; then
      source_skill_present=1
    fi
    if [ "$expected_name" -eq 0 ] || [ "$source_skill_present" -eq 0 ] || [ ! -e "$linked_path" ]; then
      report "STALE" "global-skill" "$candidate" "$linked_path"
      unhealthy=$((unhealthy + 1))
    fi
  done

  while IFS= read -r expected_dir; do
    [ -n "$expected_dir" ] || continue
    [ -d "$expected_dir" ] || continue
    skill_name=$(basename -- "$expected_dir")
    check_link "global-skill" "$skills_root/$skill_name" "$expected_dir"
  done < "$expected_file"

  rm -f "$expected_file" "$names_file"
done

for skill_path in "$local_skills"/*
do
  [ -d "$skill_path" ] || continue
  check_local_skill "$skill_path"
done

render_table
printf '\nSummary: %s linked healthy, %s Fleet-local, %s unhealthy\n' "$healthy" "$local_count" "$unhealthy"
printf 'Scope: %s is global; %s stays Fleet-local and is never expected in global roots.\n' \
  "$source_skills" "$fleet_root/.agents/skills"

[ "$unhealthy" -eq 0 ]
