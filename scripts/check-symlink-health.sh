#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fleet_root=${FLEET_SYMLINK_ROOT:-$(CDPATH= cd -- "$script_dir/.." && pwd)}
user_home=${FLEET_SYMLINK_HOME:-$(CDPATH= cd -- ~ && pwd)}

core_agents="$fleet_root/core-files/AGENTS.md"
core_claude="$fleet_root/core-files/CLAUDE.md"
source_skills="$fleet_root/skills"
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

if [ ! -f "$core_agents" ] || [ ! -f "$core_claude" ] || [ ! -d "$source_skills" ] || [ ! -d "$local_skills" ]; then
  echo "Fleet symlink sources are incomplete under $fleet_root" >&2
  exit 2
fi

check_link "instruction" "$user_home/.codex/AGENTS.md" "$core_agents"
check_link "instruction" "$user_home/.claude/CLAUDE.md" "$core_claude"
check_link "instruction" "$user_home/.config/opencode/AGENTS.md" "$core_agents"

for skills_root in \
  "$user_home/.codex/skills" \
  "$user_home/.claude/skills" \
  "$user_home/.config/opencode/skills" \
  "$user_home/.copilot/skills" \
  "$user_home/.pi/agent/skills"
do
  if [ -L "$skills_root" ]; then
    check_link "global-root" "$skills_root" "$source_skills"
    continue
  fi

  for skill_path in "$source_skills"/*
  do
    [ -d "$skill_path" ] || continue
    skill_name=$(basename -- "$skill_path")
    check_link "global-skill" "$skills_root/$skill_name" "$skill_path"
  done
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
