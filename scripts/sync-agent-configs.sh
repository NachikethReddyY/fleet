#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fleet_root=${FLEET_SYMLINK_ROOT:-$(CDPATH= cd -- "$script_dir/.." && pwd)}
user_home=${FLEET_SYMLINK_HOME:-$(CDPATH= cd -- ~ && pwd)}

core_agents="$fleet_root/core-files/AGENTS.md"
core_claude="$fleet_root/core-files/CLAUDE.md"
source_skills="$fleet_root/skills"
# Keep "$fleet_root/.agents/skills" Fleet-local; only this source is global.

if [ ! -f "$core_agents" ] || [ ! -f "$core_claude" ]; then
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

ensure_symlink "$core_agents" "$user_home/.codex/AGENTS.md"
ensure_symlink "$core_claude" "$user_home/.claude/CLAUDE.md"
ensure_symlink "$core_agents" "$user_home/.config/opencode/AGENTS.md"

for skills_root in \
  "$user_home/.codex/skills" \
  "$user_home/.claude/skills" \
  "$user_home/.config/opencode/skills" \
  "$user_home/.copilot/skills" \
  "$user_home/.pi/agent/skills"
do
  if [ -L "$skills_root" ] &&
    [ "$(CDPATH= cd -- "$skills_root" && pwd -P)" = "$(CDPATH= cd -- "$source_skills" && pwd -P)" ]; then
    continue
  fi

  mkdir -p "$skills_root"
  for skill_path in "$source_skills"/*
  do
    [ -d "$skill_path" ] || continue
    skill_name=$(basename -- "$skill_path")
    ensure_symlink "$skill_path" "$skills_root/$skill_name"
  done
done

echo "Fleet instructions and global skills synced to Codex, Claude, OpenCode, and configured agent skill roots."
