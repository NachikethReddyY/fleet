---
name: babysit-pr
description: use when babysitting prs
---

# Babysit PR

Monitor a pull request until checks are green or a blocker needs attention.

1. Check CI status once with `gh pr checks` or the commit status/check-runs endpoints.
2. If still pending, poll every 30 seconds for up to 10 minutes.
3. If a check fails, read its logs with `gh run view <RUN_ID> --log-failed` when available.
4. Apply one focused fix, commit, push, and rerun checks.
5. Retry at most 3 times; then ask for a decision.
6. Report what passed, what changed, and what remains blocked.
7. Clean up the local branch after merge, or when explicitly asked.

## Logs

With `curl`, download and extract run logs when `gh` is unavailable:

```sh
curl -s -L \
  -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/$OWNER/$REPO/actions/runs/<RUN_ID>/logs \
  -o ~/.hermes/cache/scratch/ci-logs.zip && \
unzip -o ~/.hermes/cache/scratch/ci-logs.zip -d ~/.hermes/cache/scratch/ci-logs
```

## Failure Patterns

- Test failure: read the traceback and test. Fix the logic, update a stale assertion, or add a missing dependency.
- Lint/format failure: fix the reported `file:line`; then run the repo's formatter/linter.
- Type-check failure: fix the argument, signature, missing return, or add a justified conversion.
- Build/dependency failure: add, pin, or update dependencies and lockfiles; compare CI and local runtime versions.
- Permission/auth failure: update workflow `permissions`, verify required secrets, or confirm fork restrictions. This usually needs user input.
- Timeout: inspect slow or hung steps, add `timeout-minutes`, or split work into jobs.
- Docker/container failure: check COPY paths, build context, base image tags, and missing files.

## Auto-Fix Decision Tree

- Test failure → fix logic or update the stale assertion; import/module error → add dependency.
- Lint or format failure → run the formatter/linter, then fix remaining style issues.
- Type failure → fix signatures, arguments, missing returns, or conversions.
- Build/dependency failure → add, pin, or update dependencies and lockfiles.
- Permission/auth failure → ask before changing workflow permissions or secrets.
- Timeout → inspect slow/hung steps, then add `timeout-minutes` or split jobs.

## Auto-Fix Rules

- Keep fixes minimal and targeted. Do not refactor broadly while fixing CI.
- Stop after 3 failed attempts and report the remaining blocker.
- Rerun checks after each push before saying they are green.
- For auth or permission failures, report the workflow or secret change needed before changing it.
- Do not claim success before checks reach a non-pending state.

## Rerun

After a fix:

```sh
git add <fixed_files>
git commit -m "fix: resolve CI failure"
git push
gh pr checks --watch 2>/dev/null || curl -s -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/$OWNER/$REPO/commits/$(git rev-parse HEAD)/status
```