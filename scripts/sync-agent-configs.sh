#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fleet_root=${FLEET_SYMLINK_ROOT:-$(CDPATH= cd -- "$script_dir/.." && pwd)}
user_home=${FLEET_SYMLINK_HOME:-$(CDPATH= cd -- ~ && pwd)}

core_agents="$fleet_root/core-files/AGENTS.md"
fleet_agents="$fleet_root/core-files/FLEET.md"
core_claude="$fleet_root/core-files/CLAUDE.md"
source_skills="$fleet_root/skills"

if [ ! -f "$fleet_agents" ] || [ ! -f "$core_agents" ] || [ ! -f "$core_claude" ]; then
  echo "Missing canonical instruction files under $fleet_root/core-files" >&2
  exit 1
fi

ensure_symlink() {
  source_path=$1
  target_path=$2
  target_parent=$(dirname -- "$target_path")

  mkdir -p "$target_parent"

  if [ -L "$target_path" ]; then
    if [ "$(readlink "$target_path")" = "$source_path" ]; then
      return
    fi
    unlink "$target_path"
  elif [ -e "$target_path" ]; then
    echo "Refusing to replace non-symlink: $target_path" >&2
    exit 1
  fi

  ln -s "$source_path" "$target_path"
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

is_universal_bucket() {
  case $1 in
    universal|command-center|all|global|shared) return 0 ;;
    *) return 1 ;;
  esac
}

is_known_provider_bucket() {
  case $1 in
    claude|codex|opencode|gemini|copilot|pi) return 0 ;;
    *) return 1 ;;
  esac
}

skill_dirs_for_provider() {
  provider=$1

  # Provider-agnostic buckets (and command-center's extra instructions).
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

  # Provider-specific bucket, only for the matching provider.
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

  # Backward-compatible flat skills at the skills root.
  for skill_path in "$source_skills"/*; do
    [ -d "$skill_path" ] || continue
    skill_name=$(basename -- "$skill_path")
    case $skill_name in
      universal|command-center|all|global|shared|claude|codex|opencode|gemini|copilot|pi) continue ;;
    esac
    printf '%s\n' "$skill_path"
  done
}

ensure_symlink "$fleet_agents" "$fleet_root/AGENTS.md"
ensure_symlink "$core_agents" "$user_home/.codex/AGENTS.md"
ensure_symlink "$core_claude" "$user_home/.claude/CLAUDE.md"
ensure_symlink "$core_agents" "$user_home/.gemini/GEMINI.md"
ensure_symlink "$core_agents" "$user_home/.config/opencode/AGENTS.md"
ensure_symlink "$core_agents" "$user_home/.pi/agent/AGENTS.md"
ensure_symlink "$core_agents" "$user_home/.pi/AGENTS.md"

for provider in codex claude gemini opencode copilot pi; do
  skills_root=$(provider_root "$provider")
  mkdir -p "$skills_root"

  # A provider root that is itself a symlink manages its own contents.
  if [ -L "$skills_root" ]; then
    continue
  fi

  temp_list=$(mktemp "${TMPDIR:-/tmp}/fleet-skills.XXXXXX")
  skill_dirs_for_provider "$provider" > "$temp_list"
  while IFS= read -r skill_path; do
    [ -n "$skill_path" ] || continue
    [ -d "$skill_path" ] || continue
    skill_name=$(basename -- "$skill_path")
    ensure_symlink "$skill_path" "$skills_root/$skill_name"
  done < "$temp_list"
  rm -f "$temp_list"
done

echo "Fleet instructions and scoped skills synced to Codex, Claude, Gemini, OpenCode, Pi, and configured agent skill roots."
