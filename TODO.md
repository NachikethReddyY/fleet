# Direction context and fail-fast checks — 2026-08-26

- [x] Add a "Project context" direction section to `core-files/AGENTS.md` (what this is / what matters / how to verify / where to look / shared language).
- [x] Wire `check-symlink-health` into an automatic pre-commit hook via tracked `.githooks/` + `core.hooksPath`.
- [x] Verify the hook and test suite run green without committing anything.

# Manual loop runner and thread analysis — 2026-08-26

- [x] Extend `loop-me` with an executable handoff contract.
- [x] Add manual `thread-analysis` and read-only `skill-audit` skills plus the first workflow spec.
- [x] Build the thin pnpm/Turborepo schema, runtime, and CLI slice.
- [x] Add `.analy/` reports for thread analysis and run observability.
- [x] Verify manual execution, report fields, non-tracked storage, and preserved existing workflows.

# Greenfield router skill — 2026-08-26

- [x] Map the existing local skill responsibilities and choose exact context pointers.
- [x] Create the repo-local `greenfield` router with its state contract.
- [x] Validate structure, pointers, non-duplication, dry-run evidence, and symlink health.
- [x] Record completed files, stage map, evidence, and any missing capability.

- [ ] create a icon library

# Symlink health checker — 2026-08-26

- [x] Add focused fixtures for healthy, missing, broken, wrong-target, relative-target, and root-linked skill layouts.
- [x] Implement a read-only checker matching `scripts/sync-agent-configs.sh` ownership rules.
- [x] Run the fixture suite and inspect Fleet's real symlink report.

# Complete skill-scope inventory — 2026-08-26

- [x] Show every Fleet-local skill and detect accidental global leaks.
- [x] Add an explicit `--sync` mode that discovers all global skill folders before checking.
- [x] Prove new global skills sync while Fleet-local skills remain local.
# Simplify bounded follow-up workflow — 2026-08-26

- [x] Add a global fast path for narrow corrections to an existing artifact or named file.
- [x] Add matching `html-communicator` guidance for preserving accepted layout and avoiding broad trace searches.
- [x] Validate the instruction files and record the resulting process rule.

# Align takeaway layout with response audit — 2026-08-26

- [x] Apply the response-audit remaining-content width contract to the takeaway hero and sections while preserving the sidebar and pill tabs.
- [x] Encode the accepted study-guide layout rule in `skills/html-communicator/SKILL.md`.
- [x] Re-upload the same Postplan draft and verify the rendered page and public response.

# YouTube transcript takeaway artifact and dated HTML archive — 2026-08-26

- [x] Retrieve and verify the linked video's English captions and source metadata.
- [x] Write a self-contained takeaway HTML with practical actions and transcript evidence.
- [x] Move Fleet HTML artifacts into `artifacts/YYYY-MM-DD/` while preserving the design asset path.
- [x] Update `.gitignore` and Postplan local mappings for moved Fleet artifacts.
- [x] Upload the new artifact to Postplan and validate the local/remote result.
- [x] Add and validate a reusable `youtube-transcript` skill using `yt-dlp` as the default path.
- [x] Restore compact pill tabs after visual review feedback.
- [x] Verify desktop rendering and interactive controls; mobile resize remained unavailable in the preview client.
- [x] Apply accepted Harvard-style plain-text references and remove duplicate Markdown/source pills.
- [x] Record the accepted reference treatment in the HTML skill and re-upload the corrected guide.
- [x] Remove the two unneeded reference extras while preserving the accepted sidebar and heading hierarchy.
- [x] Remove the two unnecessary Audit disclosures while preserving the sidebar and heading hierarchy.

# Learning, authorization, and scorecards — 2026-08-26

- [x] Make external actions require action-specific authorization in `core-files/AGENTS.md`.
- [x] Update the learning ladder and add honest audit scorecards.
- [x] Add matching scorecard guidance to `skills/html-communicator/SKILL.md`.
- [x] Validate the instruction files and ledger.

# Markdown icon repair — 2026-08-26

- [x] Add a workspace-scoped Markdown file-icon association.
- [x] Validate the setting and generated icon mapping.

# Learning mode and ledger — 2026-08-26

- [x] Add an opt-in learning workflow to `core-files/AGENTS.md`.
- [x] Create the shared append-only `LEARNINGS.json` ledger.
- [x] Validate the instruction and ledger changes.

# Global instruction refinements — 2026-08-26

- [x] Add scope lock and repository, branch, and worktree preflight rules.
- [x] Bound delegated jobs and strengthen approval requirements.
- [x] Keep raw planning and tool logs out of user-facing reporting.
- [x] Require thread-specific `TODO.md` task tracking.
- [x] Restrict subagent work to one small Luna job at `xhigh` or `max` reasoning.
- [x] Add Nachiketh's outcome-first working style to the global instructions.
- [x] Add prompt-problem detection and repair rules.
- [x] Add decision ownership, learning safeguards, independent proof, and scoped `TODO.md` rules.
- [x] Verify the instruction changes and record evidence.
