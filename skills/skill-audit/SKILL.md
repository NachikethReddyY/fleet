---
name: skill-audit
description: Produce a read-only weekly health report for Fleet skills, links, triggers, and scope boundaries.
disable-model-invocation: true
---

# Skill Audit

Use this user-invoked skill for a weekly or requested health pass. It reports observations and writes one Markdown report under `.analy/skill-health/`; it does not edit skills, instructions, symlinks, or product code.

## Audit

1. Inspect repo-local `.agents/skills/*/SKILL.md` and global-source `skills/*/SKILL.md` as separate scopes. Count each scope and preserve the actual skill names.
2. Check frontmatter, invocation metadata, local Markdown pointers, and likely trigger collisions. Report duplicated guidance or missing verification as candidates with path-and-line evidence, not as automatic defects.
3. Run `scripts/check-symlink-health.sh` when present and record its exit status, counts, and scope statement. Treat a missing prerequisite as a finding.
4. Write `.analy/skill-health/<UTC-timestamp>-skill-health.md` with a brief, findings, healthy patterns, prioritized recommendations, verification, confidence, and limits. Point to source files; do not paste skill bodies.

Stop after the report is saved. A recommendation is not an authorization to change anything, and a report with no findings is valid when the checks support it.
