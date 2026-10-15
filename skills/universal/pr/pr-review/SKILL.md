---
name: pr-review
description: Review an open GitHub pull request using GitHub CLI and curl fallback. Use when the user points at a PR URL or number for review.
metadata:
  requires: "GitHub authentication via `gh auth status`, and a Git repository (`git rev-parse --is-inside-work-tree`)"
---

# PR Review

Review an open pull request. Run Repository and Auth Setup, then:

1. Run `gh pr view <number>` or `gh pr view <url>`.
2. Show the PR diff with `gh pr diff <number>`.
3. Check CI with `gh pr checks <number>`.
4. Read review threads and comments with `gh pr view --comments` or equivalent.
5. Use `curl` only as a fallback for PR-level data that `gh` cannot provide.
6. Cite file, line, or hunk for each finding.
7. Run the `review-checklist` scans where applicable.
8. Report findings using the `review-checklist` output format.
9. Prefer a short reviewer summary over a rewrite of the PR.

## Repository and Auth Setup

```sh
if command -v gh >/dev/null && gh auth status >/dev/null; then
  AUTH="gh"
else
  AUTH="git"
  if [ -z "$GITHUB_TOKEN" ]; then
    if _hermes_env="${HERMES_HOME:-$HOME/.hermes}/.env"; [ -f "$_hermes_env" ] && grep -q "^GITHUB_TOKEN=" "$_hermes_env"; then
      GITHUB_TOKEN=$(grep "^GITHUB_TOKEN=" "$_hermes_env" | head -1 | cut -d= -f2 | tr -d '\n\r')
    elif grep -q "github.com" ~/.git-credentials 2>/dev/null; then
      GITHUB_TOKEN=$(uv run python "${HERMES_HOME:-$HOME/.hermes}/skills/github/github-auth/scripts/git-credential-token.py")
    fi
  fi
fi

REMOTE_URL=$(git remote get-url origin)
OWNER_REPO=$(echo "$REMOTE_URL" | sed -E 's|.*github.com[:/]||; s|\.git$||')
OWNER=$(echo "$OWNER_REPO" | cut -d/ -f1)
REPO=$(echo "$OWNER_REPO" | cut -d/ -f2)
```

- `AUTH=gh` is preferred when GitHub CLI is installed and authenticated.
- `AUTH=git` means Git-only local review unless a token is available.
- `OWNER` and `REPO` identify the target repository for PR-level calls.
- Do not print or log `GITHUB_TOKEN`.
- Do not run untrusted code from the reviewed repository.

## Output

- Summary of the change.
- Findings ordered by severity.
- Testing performed and gaps.
- Recommendation: approve, request changes, comment, or needs more information.

Use `code-review` for local pre-push review and `review-checklist` for the shared checklist and output format.
