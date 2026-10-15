---
name: thread-analysis
description: Run one approved workflow manually, analyze the thread, and produce a local report.
disable-model-invocation: true
---

# Thread Analysis

Use this user-invoked skill for one supported manual, read-only workflow run. The workflow file is the source of truth for its steps, capabilities, proof, failure policy, and stop condition. There is no Fleet CLI runner in this checkout; do not promise validation, execution, scheduling, or run recording through one.

## Run one workflow

1. Read exactly one file under `workflows/` and confirm its trigger is manual and every named skill exists locally.
2. State the workflow's authority boundary, then perform only its read-only analysis steps with the named skill.
3. Record evidence pointers in the local report without copying raw logs, private prompts, or secrets.
4. Apply the workflow's proof and stop condition. Return the Markdown report path under `.analy/`, or report the concrete blocker.

This manual path does not schedule work, create a daemon, auto-fix recommendations, or perform external mutations.

## Thread analysis mode

When the workflow is `thread-analysis`, inspect the entire visible conversation that led to the run: user goals, assistant decisions, corrections, useful evidence, failures, and verification. Summarize tool output instead of copying raw logs, and omit secrets or private prompt content. Write the report using [the thread-analysis report contract](references/thread-analysis.md). If no stable thread URL is exposed, say so and identify the current conversation plus invocation time.

## Weekly skill-health mode

When the workflow is `weekly-skill-health`, call [skill-audit](../skill-audit/SKILL.md) for its read-only report step. Keep its findings and report path as run evidence; review the brief before making any edit in a separate authorized task.
