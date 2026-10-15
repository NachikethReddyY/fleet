---
name: github-issue-triage
description: Use when listing, viewing, creating, triaging, labeling, assigning, commenting on, closing, or bulk-updating GitHub issues. Start with read-only inspection; resolve repository details from the remote; prefer gh and fall back to curl when needed.
---

# GitHub Issue Triage

Use `OWNER` and `REPO` from `git remote get-url origin`. List and inspect before mutating; default to read-only when the request is ambiguous. Do not print credentials or tokens.

## Read and Filter

- `gh issue list`
- `gh issue list --state open --label "needs-triage"`
- `gh issue list --assignee @me`
- `gh issue list --search "authentication error" --state all`
- `gh issue view 42`
- `gh issue list --limit 100 --json number,title,state,labels,assignees`

With curl, treat GitHub's issue endpoint as mixed:
- `GET /repos/{OWNER}/{REPO}/issues?state=open&...`
- Skip records where `pull_request` exists.

## Create

Use templates with concrete reproduction and expected behavior:

```md
## Bug Description

## Steps to Reproduce
1.

## Expected Behavior

## Actual Behavior

## Environment
- OS:
- Version:
```

```md
## Feature Description

## Motivation

## Proposed Solution

## Alternatives Considered
```

- `gh issue create --title "..." --body "..." --label "bug" --assignee "..."`

## Triage Workflow

1. List untriaged issues: `gh issue list --label "needs-triage" --state open`.
2. Read the issue and relevant comments.
3. Categorize: bug, enhancement, question, docs, refactor.
4. Assign severity: critical, high, medium, low.
5. Apply labels and remove `needs-triage`.
6. Assign when owner is clear.
7. Comment concise triage notes.
8. Link work: `Closes #42`, `Fixes #42`, or `Resolves #42` in the PR body.
9. Create a branch from the issue when implementation starts.

## Manage

- `gh issue edit 42 --add-label "priority:high,bug"`
- `gh issue edit 42 --remove-label "needs-triage"`
- `gh issue edit 42 --add-assignee username`
- `gh issue comment 42 --body "Investigated; root cause is in auth middleware. Working on a fix."`
- `gh issue close 42`
- `gh issue close 42 --reason "not planned"`
- `gh issue reopen 42`

## Bulk Changes

Use conservative batches and report each affected issue:
- `gh issue list --label "wontfix" --json number --jq '.[].number'`
- `gh issue close <number>`
- `gh issue edit <number> --add-label "..."`

## Output Format

```text
## GitHub Issue Triage

### #N - title
- State: open/closed
- Labels: ...
- Priority: critical/high/medium/low (when determined)
- Assignee: ...
- Disposition: fix, backlog, needs more info, duplicate, or won't do
- Next step: owner or PR reference
```

For a single issue, include this summary after viewing its details. When creating or working a pull request, use `file-pr` for branch, commit, and PR workflow.