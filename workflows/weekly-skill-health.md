---
version: 1
name: weekly-skill-health
description: Inspect Fleet skill health and scope boundaries without changing them.
trigger:
  type: manual
  suggestedCadence: weekly
inputs:
  - repository
  - local-and-global-skill-trees
steps:
  - id: audit-skills
    kind: skill
    target: skill-audit
    purpose: Produce a read-only skill health report with path-based evidence.
    readOnly: true
capabilities:
  - read skill and instruction files
  - run scripts/check-symlink-health.sh
  - write Markdown under .analy/skill-health/
checkpoint:
  required: true
  reason: A human must review recommendations before any skill or instruction edit.
proof:
  - The report includes scope counts, findings with evidence, verification, confidence, and limits.
failurePolicy:
  maxRetries: 1
  onFailure: stop
stopCondition: Stop after the report is saved and reviewed, or record a concrete blocker.
---

# Weekly skill health

Run this workflow manually through [skill-audit](../skills/skill-audit/SKILL.md); it has no scheduler or Fleet CLI runner.
