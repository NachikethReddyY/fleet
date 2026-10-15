---
name: file-upload
description: Upload supported files to GitHub issues and pull requests using GitHub CLI instead of an external file host.
metadata:
  requires: "GitHub CLI authenticated with repository access"
---

# File upload

Use GitHub's built-in attachments when an agent needs to put a file in an issue, PR description, or comment.

## Upload

```bash
gh pr create ... --attach './login.png#The login error state'
gh pr edit <number> --attach ./before.png --attach ./after.png
gh pr comment <number> --attach ./trace.log
```

## Multiple files

```bash
gh pr create --body-file pr-body.md --attach ./before.png --attach ./after.png
```

Place an image exactly in the PR body by referencing the local file first:

```md
Before:
![Login failure](before.png)

After:
![Fixed redirect](after.png)
```

GitHub CLI rewrites those references to uploaded asset URLs. Up to 50 files per command.


## Rules

- Prefer `gh ... --attach` over custom storage.
- Attach up to 50 supported files per command.
- Use alt text after `#`, as in `./login.png#Login error state`.
- If an attachment fails, the action can still succeed partially; report the nonzero status.
- Only supported image/video/document/code/archive/text/audio types and size limits apply.
- Private or internal repository uploads are visible only to people with repository access.
- Do not upload secrets, credentials, or sensitive dumps.
- For unsupported formats, commit the file to the repository or use an approved external host instead.
## Media guidance

- Embed images as PNG, JPEG, or WebP, with a short description and link.
- Link videos as MP4, MOV, or WebM and tag them as `screen recording`.
- Inline previews usually help. If a clip is about 30 seconds or shorter, also create a GIF preview.
- Create the GIF preview with:

```bash
ffmpeg -i input.mp4 -vf "fps=10,scale=720:-2:flags=lanczos" -loop 0 preview.gif
```

- Embed the GIF and link the high-quality video below it or attach it.
- Until a cloud storage solution exists, keep previews short enough for GitHub's attachment limits.
