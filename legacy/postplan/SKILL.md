---
name: postplan
description: >
  Manage Postplan HTML drafts by publishing, updating, listing, deleting,
  verifying public availability, interpreting dashboard times, and maintaining
  CLI credential or draft-mapping state. Use when the user mentions Postplan,
  postplan.dev, or a Postplan deployment or draft.
---

# Postplan

Manage Postplan drafts without exposing credentials or overstating deletion.

## Credentials

- Canonical credentials: `~/.auth/postplan/credentials.json`, mode `0600`.
- The current CLI expects `~/.postplan/credentials.json`; keep it as a symlink to the canonical file while that path remains hardcoded.
- Never print, quote, or return `apiKey`. Verify authentication with `pnpm dlx postplan whoami`.

## Publish and inspect

- `pnpm dlx postplan upload <file>` updates the draft mapped to that absolute file path.
- `pnpm dlx postplan upload --new <file>` creates a new draft and replaces that file's local mapping.
- Resolve remote state and exact IDs with `pnpm dlx postplan list --json`; do not infer IDs from titles.

## Delete

Deletion is an external destructive action. Resolve the exact draft IDs first and require explicit user authorization for those IDs.

1. Check `pnpm dlx postplan --help`; prefer a built-in delete command if one exists.
2. Otherwise call authenticated `DELETE https://postplan.dev/api/drafts/<draft-id>` using the key read from the canonical credential file without printing it.
3. Verify the ID is absent from `pnpm dlx postplan list --json` and its public URL returns `404`.
4. Remove only matching entries from `~/.postplan/drafts.json`, or warn that the next upload of that file needs `--new`. Preserve the local HTML file.

The current API soft-deletes the draft. It removes the draft and all version URLs from public serving and account listings; do not claim the underlying version records were physically erased.

## Dashboard time

Postplan API timestamps ending in `Z` are UTC. The current dashboard formats those UTC values without local conversion or a timezone label. Convert them to the user's timezone and state both zones when explaining a mismatch; for example, `15:23 UTC` is `23:23` in Singapore (`UTC+8`).
