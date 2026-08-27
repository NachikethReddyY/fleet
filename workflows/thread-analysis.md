---
version: 1
name: thread-analysis
description: Review the current conversation after a manual skill run and save an evidence-backed retrospective.
trigger:
  type: manual
  suggestedCadence: after a manually completed skill run
inputs:
  - current_thread
steps:
  - id: analyze-thread
    kind: analysis
    target: current-thread
    purpose: Identify evidence-backed strengths, misses, corrections, and next-round recommendations.
    readOnly: true
  - id: write-report
    kind: write
    target: .analy/thread-analysis/
    purpose: Save the retrospective as an ignored Markdown artifact.
    readOnly: false
capabilities:
  - read the current conversation
  - summarize tool evidence without copying raw logs
  - write Markdown under .analy/thread-analysis/
checkpoint:
  required: false
  reason: The report is local and non-destructive.
proof:
  - The report contains the required retrospective sections and its path is returned.
failurePolicy:
  maxRetries: 0
  onFailure: stop
stopCondition: Stop after the report is saved, or record a concrete blocker.
---

# Thread analysis

Use the current conversation as the input. Run this workflow through [thread-analysis](../.agents/skills/thread-analysis/SKILL.md) and follow its linked report contract.
