---
name: pr-comments
description: format && post the agent-authored GitHub PR comments on Nachiketh's behalf With the preferred compact attribution callout, use whenever an agent drafts, posts, replies to, or resolves a PR or review comment for Nachiketh including comments made by other PR skills.
metadata: 
  requires: "an authenticated GithubCLI or equivalant Github comment tool"  
---

# Leaving PR comments

Prefix every agent-authored comment with:

> [!NOTE]
> 🤖 **[ModelName] is responding on behalf of Nachiketh**

Write like a person: plain words, short sentences, 2-4 lines. Open with the point, answer directly, and cut filler. Lists only if they make the comment easier to scan. Avoid anything that sounds impressive but does not help act or decide.

Don't: post as Nachiketh for comments he asked to write himself; add praise, apologies, framing, or a second attribution; post an empty callout; rewrite a PR description unless asked; paste a sample comment.

Post through the authenticated GitHub CLI or API, keep the body in a file or quoted string, and verify it was posted.
