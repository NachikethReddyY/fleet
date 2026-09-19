#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
checker="$repo_root/scripts/check-symlink-health.sh"
fixture=$(mktemp -d)
trap 'rm -rf "$fixture"' EXIT HUP INT TERM

fixture_root="$fixture/Fleet"
fixture_home="$fixture/home"
mkdir -p "$fixture_root/core-files" "$fixture_root/skills/alpha" "$fixture_root/.agents/skills/local-only"
mkdir -p "$fixture_home/.codex/skills" "$fixture_home/.claude/skills" "$fixture_home/.gemini/skills"
mkdir -p "$fixture_home/.config/opencode/skills"
mkdir -p "$fixture_home/.copilot/skills" "$fixture_home/.pi/agent/skills"
: > "$fixture_root/core-files/AGENTS.md"
: > "$fixture_root/core-files/CLAUDE.md"
: > "$fixture_root/core-files/FLEET.md"

ln -s "$fixture_root/core-files/FLEET.md" "$fixture_root/AGENTS.md"
ln -s "$fixture_root/core-files/AGENTS.md" "$fixture_home/.codex/AGENTS.md"
ln -s "$fixture_root/core-files/CLAUDE.md" "$fixture_home/.claude/CLAUDE.md"
ln -s "$fixture_root/core-files/AGENTS.md" "$fixture_home/.gemini/GEMINI.md"
ln -s "$fixture_root/core-files/AGENTS.md" "$fixture_home/.config/opencode/AGENTS.md"
ln -s "$fixture_root/core-files/AGENTS.md" "$fixture_home/.pi/agent/AGENTS.md"
ln -s "$fixture_root/core-files/AGENTS.md" "$fixture_home/.pi/AGENTS.md"
for skills_root in \
  "$fixture_home/.codex/skills" \
  "$fixture_home/.claude/skills" \
  "$fixture_home/.gemini/skills" \
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
printf '%s\n' "$healthy_output" | grep -F '13 linked healthy, 1 Fleet-local, 0 unhealthy' >/dev/null
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
printf '%s\n' "$sync_output" | grep -F '19 linked healthy, 1 Fleet-local, 0 unhealthy' >/dev/null
for skills_root in \
  "$fixture_home/.codex/skills" \
  "$fixture_home/.claude/skills" \
  "$fixture_home/.gemini/skills" \
  "$fixture_home/.config/opencode/skills" \
  "$fixture_home/.copilot/skills" \
  "$fixture_home/.pi/agent/skills"
do
  [ -e "$skills_root/beta" ]
  [ ! -e "$skills_root/local-only" ]
done

# A removed Fleet source is reported, never silently pruned; foreign skills are ignored.
ln -s "$fixture_root/skills/retired" "$fixture_home/.codex/skills/retired"
ln -s "../../../Fleet/skills/retired-relative" "$fixture_home/.copilot/skills/retired-relative"
ln -s "$fixture/unrelated" "$fixture_home/.codex/skills/foreign"
if stale_output=$(run_checker 2>&1); then
  echo "Expected stale Fleet links to fail" >&2
  exit 1
fi
printf '%s\n' "$stale_output" | grep -E '│ STALE +│ global-skill' >/dev/null
[ -L "$fixture_home/.codex/skills/retired" ]
[ -L "$fixture_home/.copilot/skills/retired-relative" ]
unlink "$fixture_home/.codex/skills/retired"
unlink "$fixture_home/.copilot/skills/retired-relative"
run_checker >/dev/null
ln -s "$fixture_root/skills/alpha" "$fixture_home/.codex/skills/old-alpha-name"
if stale_alias_output=$(run_checker 2>&1); then
  echo "Expected a stale extra Fleet alias to fail" >&2
  exit 1
fi
printf '%s\n' "$stale_alias_output" | grep -E '│ STALE +│ global-skill' >/dev/null
[ -L "$fixture_home/.codex/skills/old-alpha-name" ]
unlink "$fixture_home/.codex/skills/old-alpha-name"
# The source split survives sync; a real user file must not be overwritten.
[ "$(readlink "$fixture_root/AGENTS.md")" = "$fixture_root/core-files/FLEET.md" ]
unlink "$fixture_home/.codex/skills/beta"
printf 'user-owned' > "$fixture_home/.codex/skills/beta"
if run_checker --sync >/dev/null 2>&1; then
  echo "Expected sync to refuse a real file" >&2
  exit 1
fi
[ "$(cat "$fixture_home/.codex/skills/beta")" = user-owned ]
rm "$fixture_home/.codex/skills/beta"
run_checker --sync >/dev/null

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
