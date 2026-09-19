#!/bin/sh
set -eu

skill_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
skill="$skill_dir/SKILL.md"

[ -f "$skill" ]
grep -F 'name: source-notes' "$skill" >/dev/null
grep -F 'description:' "$skill" >/dev/null

# The workflow must preserve evidence, follow the requested focus, and distinguish
# source claims from analysis rather than becoming a generic summarizer.
grep -F 'Preserve the source' "$skill" >/dev/null
grep -F "user's requested focus" "$skill" >/dev/null
grep -F 'Source-backed claims' "$skill" >/dev/null
grep -F 'Interpretation' "$skill" >/dev/null
grep -F 'YouTube' "$skill" >/dev/null
grep -F 'youtube-transcript' "$skill" >/dev/null
grep -F 'Do not invent' "$skill" >/dev/null
grep -F 'Stop when' "$skill" >/dev/null

echo 'source-notes skill checks passed'
