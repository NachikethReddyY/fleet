#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fleet_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
source_dir="$fleet_root/skills/interface-design"

if [ ! -f "$source_dir/SKILL.md" ]; then
  echo "Missing canonical skill: $source_dir/SKILL.md" >&2
  exit 1
fi

link_skill() {
  skills_dir=$1
  link_path="$skills_dir/interface-design"

  if [ -e "$link_path/SKILL.md" ] &&
    [ "$(CDPATH= cd -- "$link_path" && pwd -P)" = "$source_dir" ]; then
    return
  fi

  if [ -L "$link_path" ]; then
    unlink "$link_path"
  elif [ -e "$link_path" ]; then
    echo "Refusing to replace non-symlink: $link_path" >&2
    exit 1
  fi

  mkdir -p "$skills_dir"
  ln -s "$source_dir" "$link_path"
}

link_skill "$HOME/.agents/skills"
link_skill "$HOME/.codex/skills"
link_skill "$HOME/.claude/skills"
link_skill "$HOME/.config/opencode/skills"
link_skill "$HOME/.copilot/skills"
link_skill "$HOME/.pi/agent/skills"

echo "interface-design linked from $source_dir"
