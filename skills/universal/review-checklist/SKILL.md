---
name: review-checklist
description: Shared code review checklist, common-issue scans, and output format. Use when another review skill or user needs the standard finding structure.
---

# Review Checklist

Use this as the standard for every review.

## Common Issue Scans

Run these against `git diff main...HEAD` when applicable:

```sh
git diff main...HEAD | grep -n "print(\|console\.log\|TODO\|FIXME\|HACK\|XXX\|debugger"
git diff main...HEAD --stat | sort -t'|' -k2 -rn | head -10
git diff main...HEAD | grep -in "password\|secret\|api_key\|token.*=\|private_key"
git diff main...HEAD | grep -n "<<<<<<\|>>>>>>\|======="
```

## Finding Categories

- Correctness
- Security
- Performance
- Maintainability
- Tests

## Output Format

Use this structure for review summary comments:

```markdown
## Code Review Summary

**Verdict: [Approved | Changes Requested | Reviewed]** ([N] issues, [N] suggestions)

**PR:** #[number] — [title]
**Author:** @[username]
**Files changed:** [N] (+[additions] -[deletions])

### Critical
- **path:line** — finding. Suggestion: fix.

### Warnings
- **path:line** — finding. Suggested fix.

### Suggestions
- **path:line** — improvement. Rationale.

### Looks Good
- discovery worth calling out.
```

For local reviews, omit PR metadata and start with the severity sections.

## Severity Guide

| Level | When to use | Blocks review? |
|-------|-------------|----------------|
| Critical | Security, data loss, crashes, broken core functionality | Yes |
| Warning | Bugs in non-critical paths, missing handling, missing tests | Usually |
| Suggestion | Style, refactor, performance hints, docs | No |
| Looks Good | Clean patterns, good tests, clear design | N/A |

## Verdict Decision

- Approved: zero Critical/Warning items.
- Changes Requested: any Critical or Warning item.
- Reviewed: observations only, draft PRs, uncertain findings.

## Inline Comments

Prefix inline comments with severity:
- `Critical: ...`
- `Warning: ...`
- `Suggestion: ...`
- `Looks Good: ...`