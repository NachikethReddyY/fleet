#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
checker="$repo_root/scripts/check-symlink-health.sh"
fixture=$(mktemp -d)
trap 'rm -rf "$fixture"' EXIT HUP INT TERM

fixture_root="$fixture/Fleet"
fixture_home="$fixture/home"
mkdir -p "$fixture_root/core-files" "$fixture_root/skills/alpha" "$fixture_root/.agents/skills/local-only"
mkdir -p "$fixture_home/.codex/skills" "$fixture_home/.claude/skills" "$fixture_home/.config/opencode/skills"
mkdir -p "$fixture_home/.copilot/skills" "$fixture_home/.pi/agent/skills"
: > "$fixture_root/core-files/AGENTS.md"
: > "$fixture_root/core-files/CLAUDE.md"

ln -s "$fixture_root/core-files/AGENTS.md" "$fixture_home/.codex/AGENTS.md"
ln -s "$fixture_root/core-files/CLAUDE.md" "$fixture_home/.claude/CLAUDE.md"
ln -s "$fixture_root/core-files/AGENTS.md" "$fixture_home/.config/opencode/AGENTS.md"
for skills_root in \
  "$fixture_home/.codex/skills" \
  "$fixture_home/.claude/skills" \
  "$fixture_home/.config/opencode/skills" \
  "$fixture_home/.copilot/skills" \
  "$fixture_home/.pi/agent/skills"
do
  ln -s "$fixture_root/skills/alpha" "$skills_root/alpha"
done
unlink "$fixture_home/.copilot/skills/alpha"
ln -s "../../../Fleet/skills/alpha" "$fixture_home/.copilot/skills/alpha"

run_checker() {
  FLEET_SYMLINK_ROOT="$fixture_root" FLEET_SYMLINK_HOME="$fixture_home" "$checker" "$@"
}

healthy_output=$(FLEET_TABLE_WIDTH=72 run_checker)
escape=$(printf '\033')
if printf '%s\n' "$healthy_output" | grep -F "$escape" >/dev/null; then
  echo "Expected redirected output to remain free of color escapes" >&2
  exit 1
fi
printf '%s\n' "$healthy_output" | grep -F '┌' >/dev/null
printf '%s\n' "$healthy_output" | grep -F '│ STATUS' >/dev/null
printf '%s\n' "$healthy_output" | grep -E '│ OK +│ instruction' >/dev/null
printf '%s\n' "$healthy_output" | grep -E '│ OK +│ global-skill' >/dev/null
printf '%s\n' "$healthy_output" | grep -E '│ LOCAL +│ fleet-local' >/dev/null
printf '%s\n' "$healthy_output" | grep -F '...' >/dev/null
printf '%s\n' "$healthy_output" | grep -F '8 linked healthy, 1 Fleet-local, 0 unhealthy' >/dev/null
green=$(printf '\033[38;2;12;238;156m')
colored_output=$(FLEET_COLOR=always FLEET_TABLE_WIDTH=72 run_checker)
printf '%s\n' "$colored_output" | grep -F "${green}OK" >/dev/null

for table_width in 60 80 120
do
  width_output=$(FLEET_TABLE_WIDTH=$table_width run_checker)
  if printf '%s\n' "$width_output" | TABLE_WIDTH=$table_width python3 -c 'import os, sys; limit=int(os.environ["TABLE_WIDTH"]); lines=[line.rstrip("\n") for line in sys.stdin]; table=[line for line in lines if line.startswith(("┌", "│", "├", "└"))]; raise SystemExit(any(len(line) > limit for line in table))'; then :; else
    echo "Expected every table line to fit width $table_width" >&2
    exit 1
  fi
done

mkdir -p "$fixture_root/skills/beta"
sync_output=$(FLEET_SYMLINK_ROOT="$fixture_root" FLEET_SYMLINK_HOME="$fixture_home" "$checker" --sync)
printf '%s\n' "$sync_output" | grep -F '13 linked healthy, 1 Fleet-local, 0 unhealthy' >/dev/null
for skills_root in \
  "$fixture_home/.codex/skills" \
  "$fixture_home/.claude/skills" \
  "$fixture_home/.config/opencode/skills" \
  "$fixture_home/.copilot/skills" \
  "$fixture_home/.pi/agent/skills"
do
  [ -e "$skills_root/beta" ]
  [ ! -e "$skills_root/local-only" ]
done

unlink "$fixture_home/.codex/AGENTS.md"
if missing_output=$(run_checker 2>&1); then
  echo "Expected a missing link to fail" >&2
  exit 1
fi
printf '%s\n' "$missing_output" | grep -E '│ MISSING +│ instruction' >/dev/null
yellow=$(printf '\033[38;2;255;234;0m')
missing_color_output=$(FLEET_COLOR=always run_checker 2>&1 || true)
printf '%s\n' "$missing_color_output" | grep -F "${yellow}MISSING" >/dev/null

ln -s "$fixture_root/core-files/AGENTS.md" "$fixture_home/.codex/AGENTS.md"
unlink "$fixture_home/.codex/skills/alpha"
ln -s "$fixture_root/skills/missing" "$fixture_home/.codex/skills/alpha"
if broken_output=$(run_checker 2>&1); then
  echo "Expected a broken link to fail" >&2
  exit 1
fi
printf '%s\n' "$broken_output" | grep -E '│ BROKEN +│ global-skill' >/dev/null
red=$(printf '\033[38;2;255;92;115m')
broken_color_output=$(FLEET_COLOR=always run_checker 2>&1 || true)
printf '%s\n' "$broken_color_output" | grep -F "${red}BROKEN" >/dev/null

mkdir -p "$fixture/wrong-target"
unlink "$fixture_home/.codex/skills/alpha"
ln -s "$fixture/wrong-target" "$fixture_home/.codex/skills/alpha"
if wrong_output=$(run_checker 2>&1); then
  echo "Expected a wrong target to fail" >&2
  exit 1
fi
printf '%s\n' "$wrong_output" | grep -E '│ WRONG +│ global-skill' >/dev/null
wrong_color_output=$(FLEET_COLOR=always run_checker 2>&1 || true)
printf '%s\n' "$wrong_color_output" | grep -F "${red}WRONG" >/dev/null

unlink "$fixture_home/.claude/skills/alpha"
rm -rf "$fixture_home/.claude/skills"
ln -s "$fixture_root/skills" "$fixture_home/.claude/skills"
unlink "$fixture_home/.codex/skills/alpha"
ln -s "$fixture_root/skills/alpha" "$fixture_home/.codex/skills/alpha"
root_output=$(run_checker)
printf '%s\n' "$root_output" | grep -E '│ OK +│ global-root' >/dev/null

ln -s "$fixture_root/.agents/skills/local-only" "$fixture_home/.codex/skills/local-only"
if leaked_output=$(run_checker 2>&1); then
  echo "Expected a leaked Fleet-local skill to fail" >&2
  exit 1
fi
printf '%s\n' "$leaked_output" | grep -E '│ LEAKED +│ fleet-local' >/dev/null

echo "Symlink health checker tests passed."
