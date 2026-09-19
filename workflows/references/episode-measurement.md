# Manual episode measurement

This opt-in, local-only tool scores a small redacted JSON file that the operator supplies. It never discovers or copies history, prompts, responses, transcripts, credentials, or private source. Store inputs in ignored `.evidence/<audit>/` and use evidence pointers rather than their contents.

Predeclare each comparable task cohort in `comparison_groups`, including its acceptance criterion. Every episode names one group. The output has a separate pass rate per group; it deliberately has no headline rate across incompatible tasks. Records keep optional harness, exact model ID, reasoning effort, response count, and cached/uncached/output usage counts.

Use [`episode.schema.json`](episode.schema.json). For resumed or imported records, give all checkpoints the same `episode_key` and an increasing non-negative `revision`; only the highest revision is scored. Each revision is a cumulative snapshot, so its cost replaces prior-revision cost rather than being added to it. Conflicting records at the same revision fail validation. Metadata and unassigned children are excluded. A missing acceptance, outcome, or proof is `unassessed`; `interrupted` and `tool_blocked` are also reported separately and never counted as failures.

```sh
python3 scripts/score-episodes.py .evidence/<audit>/episodes.json
```

Only evidence-backed pass/fail outcomes enter a group’s `pass / (pass + fail)` rate; partial and unknown remain visible separately. Cost groups include comparison group, kind, currency, and window. `cost_per_accepted_item` is the cost for the assessed pass/fail subset: its numerator includes both passing and failing assessed-attempt cost, while partial, unknown, interrupted, tool-blocked, unassessed, and records without cost are excluded. `cost_coverage` reports the eligible assessed records without cost. Kinds are `billed` and `rate_card_estimate`; estimates also require a source and price date. The tool cannot validate evidence pointers, infer missing assessments, compare groups, establish a model-wide ranking, or claim whole-run savings.
