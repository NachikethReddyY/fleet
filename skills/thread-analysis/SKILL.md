---
name: thread-analysis
description: Run one approved workflow manually, analyze the thread, and produce a local report.
disable-model-invocation: true
---

# Thread Analysis

Use this user-invoked skill after [loop-me](../loop-me/SKILL.md) has produced an approved workflow with an executable handoff. It coordinates one manual run; the workflow file is the source of truth for its steps, capabilities, proof, failure policy, and stop condition.

## Run one workflow

1. Read exactly one file under `workflows/` and validate it with `pnpm --filter @fleet/fleet-cli exec node src/index.js validate <absolute-workflow.md> --root <repo>`. The V1 runner accepts manual triggers only.
2. Start the run with `pnpm --filter @fleet/fleet-cli exec node src/index.js run <absolute-workflow.md> --root <repo>`. Show the authority boundary before any action and use only the named skills/capabilities.
3. Execute one step at a time. Record each tool/action, evidence pointer, and available cost with the CLI; use the workflow's checkpoint before any externally visible or destructive action.
4. Run the workflow's independent check. Follow its failure policy, allow at most its configured retry count, and stop with a concrete reason when proof is missing.
5. Finish only when the stop condition and proof hold. Return the Markdown report path under `.analy/`; leave the run blocked when they do not.

The runner is manual-only. It does not schedule work, create a daemon, auto-fix recommendations, or perform an external mutation without the workflow's human checkpoint.

## Thread analysis mode

When the workflow is `thread-analysis`, inspect the entire visible conversation that led to the run: user goals, assistant decisions, corrections, useful evidence, failures, and verification. Summarize tool output instead of copying raw logs, and omit secrets or private prompt content. Write the report using [the thread-analysis report contract](references/thread-analysis.md). If no stable thread URL is exposed, say so and identify the current conversation plus invocation time.

## Weekly skill-health mode

When the workflow is `weekly-skill-health`, call [skill-audit](../skill-audit/SKILL.md) for its read-only report step. Keep its findings and report path as run evidence; review the brief before making any edit in a separate authorized task.
