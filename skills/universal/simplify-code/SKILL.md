---
name: simplify-code
description: After code changes are working, run a concise cleanup pass for duplication, needless complexity, waste, and wrong-depth fixes. This is cleanup, not a correctness bug hunt.
---

# Simplify Code

Review recent changes with four narrow lenses, then apply only fixes that are worth applying. This is a cleanup pass for code that already works. Correctness bugs belong in `code-review`.

## When to Use

Use when the user asks to simplify, clean up recent changes, review recent changes, or run a cleanup pass.

Optional modifiers:
- **Focus:** `reuse`, `quality` (`simplification`), `efficiency`, or `altitude`. Run only that lens, or lean aggregation toward it.
- **Dry run:** report only and change nothing.
- **Scope:** staged changes, last commit, current branch, named file or directory, or uncommitted tracked changes.

Do not run this automatically after every edit. It is expensive and should be explicit.

## Process

### 1. Identify the change

Use this order:

```sh
git diff
git diff HEAD
git diff --staged
git diff HEAD~1
git diff main...HEAD
git diff -- path/to/file
```

If the diff is very large, suggest narrowing it before reviewing. If there is no git diff and no named files, ask instead of guessing. Capture the complete diff for every reviewer.

### 2. Run at most four reviewers

Use native subagents (`explore` or `general`) or T3 `delegate_task` when available. If delegation is unavailable, run the same four lenses inline and say so.

Give every reviewer:
- The complete diff.
- The repository root.
- Search access.
- `file:line`, problem, cost, suggested fix, confidence, and risk for each finding.

Risk levels:
- `SAFE`: proven not to change behavior. Auto-apply if tests pass.
- `CAREFUL`: semantic equivalent cleanup. Apply one file at a time with targeted tests.
- `RISKY`: behavior, API, concurrency, or error-handling changes. Report only, do not auto-apply.

Search before flagging. If a finding cannot show the existing thing to use, drop it. Before flagging removal, use `git blame` and record `confidence: low` when purpose is unclear.

Reviewer goals:
- **Reuse:** duplicated functions, constants, or hand-rolled logic that an existing utility already handles.
- **Quality:** redundant state, parameter sprawl, copy-paste variation, leaky abstractions, stringly typed values, deep nesting, and obvious generated clutter.
- **Efficiency:** repeated work, missing concurrency, hot-path bloat, broad reads, TOCTOU pre-checks, leaks, and silently swallowed errors.
- **Altitude:** fixes layered on generic code to avoid fixing the shared mechanism itself.

Skip nits and style-only churn unless directly tied to maintainability.

### 3. Aggregate and apply

Wait for all reviewers before editing.

1. Merge overlap. Collapse findings that share the same target or underlying cause.
2. Drop weak or unsupported findings.
3. Resolve conflicts in this order: correctness, stated focus, readability and reuse, then micro-performance.
4. Apply `SAFE` findings first.
5. Apply `CAREFUL` findings one file at a time, then run targeted tests.
6. Report `RISKY` findings without applying them. Altitude findings usually belong here.
7. Revert any one fix that breaks behavior and report it.

### 4. Verify

Run tests relevant to the touched files, plus the repo's normal lint or type checks. Do not depend on the full suite unless the user asks.

### 5. Summarize

Report applied fixes by lens and risk level. Report skipped findings and why. State whether the work was parallel or inline.

## Models and Subscriptions

Treat model cost as part of design. Four full reviewers are unnecessary for most small changes.

**Claude-only:**
- Haiku: reuse scanning, command output summarization, and evidence collection.
- Sonnet: quality, efficiency, and initial risk sorting.
- Opus: altitude review, conflicts, public-contract risk, and final stop-or-go judgment.

**ChatGPT-only:**
- Use the cheaper available lane for reuse and file discovery.
- Use Luna at medium for quality and efficiency review.
- Use Luna at high only for altitude, architecture, and unresolved conflicts.

Rules that keep quality high:
- Cheap lanes gather evidence; strong lanes make judgment calls.
- Never ask all four inexpensive lanes to also design a deeper fix.
- Keep outputs compact and structured.
- Raise the stronger model before accepting risky changes.
- If a finding lacks evidence, discard it instead of spending another round on it.

## Boundaries

- This is not a bug hunt. Report genuine correctness issues separately and clearly.
- Do not refactor code that the diff did not touch, except for the small change needed to make a cleanup safe.
- Respect repo conventions from `AGENTS.md` or equivalent files.
- Treat over-trusting dead-code detection, public contract renames, and intentional error handling as risky.
- Keep edits scoped to previous recent changes, unless the user explicitly asks for a broader pass.