---
name: take-over
description: Use when the user, asks you to take over existing work, such as taking over a PR branch, commit etc, or an agent thread request a takeover. 
---

# Take over

- Finish the original goal while preserving contributor credit.
- Do not defend another agent's implementation by default.
- Read the source PR/thread, including review findings and later corrections.
- Resolve the handoff against actual code, current head, and uncommitted work.
- Treat the handoff as context, not proof.

## Replacement PRs

- Import original comments onto a new branch and add fixes separately.
- Honor an explicit in-place or stacked continuation.
- Do not change unrelated work or the original PR without authorization.
- Preserve Git authorship and co-author trailers.
- Credit contributors in the PR and link the original PR.
- If squashed, preserve human author/co-author credit in the merge commit with verified identities.
- Model attribution does not replace contributor credit.
- Update the continuation against the intended base and current architecture.
- Rework only what is needed for the same goal, not unrelated features.
- Simplify without dropping intended behavior or surfaces.
- Recheck the source PR; it may have improved.
- Independently verify the original failure and realistic workflows per repository guidance and permissions.
- Green mocked tests do not prove UX; state what remains unverified.

## Completion

- When finishing includes a PR, use the `file-pr` skill to file or update it.
- Use the `babysit-pr` skill rather than stopping at PR creation.
- Use the `pr-comments` skill for replies.
- Merge or close the original PR only when authorized.
- Report what you inherited, changed, verified, how credit was preserved, and remaining decisions.

## PR comments during a takeover

```md
> [!NOTE]
> 🤖 **[ModelName] is responding on behalf of Nachiketh**

<short takeover update in plain words>
```
