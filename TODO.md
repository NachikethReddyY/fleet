# Aston Martin F1 sustainability concepts — 2026-09-19

- [x] Confirm the target Notion database schema and capture the official Aston Martin F1 2024/2025 sustainability evidence plus relevant FIA constraints.
- [x] Develop three separate Design Thinking briefs: logistics emissions, circular parts/material reuse, and race-to-road energy insights.
- [x] Create and visually verify one self-contained HTML artifact for each concept.
- [x] Publish the three artifacts through Postplan and verify their public URLs.
- [x] Create three separate Notion database entries, link each artifact, and fetch them back for verification.

# Token-limit reduction Postplan guide — 2026-09-14

- [x] Retrieve and verify the supplied video's original-English captions and metadata.
- [x] Extract the video's concrete token-reduction workflow with timestamped source support.
- [x] Define artifact checks before implementation and create the self-contained HTML guide.
- [x] Validate content, responsive markup, accessibility semantics, privacy, and file size; runtime browser interaction remained unavailable because no Playwright browser is installed.
- [x] Publish through Postplan and verify the returned public URL.

# Source notes skill and YouTube trial — 2026-09-14

- [x] Define focused checks for skill discovery, source fidelity, requested-focus analysis, and output traceability.
- [x] Create the global `source-notes` skill without duplicating source-specific retrieval workflows.
- [x] Sync the new skill into configured harnesses and verify symlink health.
- [x] Run the skill workflow against the supplied YouTube video and save its source-backed note.
- [x] Verify caption coverage, note claims, citations, and final file locations.

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

# Firecrawl Docker auto-recovery — 2026-09-05

- [x] Add focused tests for local recovery with Docker running and with OrbStack stopped.
- [x] Retry local Firecrawl requests after starting Docker and the Firecrawl Compose stack.
- [x] Document configuration and verify a live web search.

# Cross-provider history audit — 2026-09-19

- [x] Inventory local provider stores and establish deduplicated coverage, dates, and model/cost attribution limits.
- [x] Extract all accessible conversations into a local audit index with parent/subagent links and evidence pointers.
- [x] Review behavior and outcome evidence using Sol and Terra; separate automated screening from qualitative review.
- [x] Compare observed failure patterns with current Fleet guidance and skills.
- [x] Produce and verify a scorecard, model usage assessment, and scoped proposed improvement plan without changing guidance.

# Tool argument failures audit follow-up — 2026-09-19

- [x] Inspect retained tool failure receipts for type/schema violations and distinguish them from code compilation or runtime failures.
- [x] Verify representative malformed arguments, correction/retry behavior, and model attribution.
- [x] Add a scoped improvement to the audit and plan; create the local HTML improvements list.
- [x] Verify counts and references; static HTML checks passed. Rendering/interactions unverified: browser binding unavailable and native pipe closed.

# Report reference icons — 2026-09-19

- [x] Match file and directory references to HTML Communicator type icons; preserve report content and layout.
- [x] Verify all 19 references, visually inspect the named skill-file marks in Helium, and republish the existing Postplan draft (version 2; HTTP 200).

# Task-based model scorecards — 2026-09-19

- [x] Add the current report’s icon-compliance failure as improvement 12.
- [x] Define an evidence-based per-task rubric and assess Codex and other-provider tasks with Sol/Terra.
- [x] Aggregate comparable criteria by model and task class, retaining unknowns and attribution limits.
- [x] Add task scorecards to the existing HTML, verify them, and publish the same Postplan URL.

# Implement history-audit improvements — 2026-09-19

- [x] Split shared and Fleet-only instruction ownership; verify layout and identify runtime verification limits.
- [x] Restore configured skill links and cover stale links without deleting them.
- [x] Apply portable routing, learning-seam and complete tool-contract guidance.
- [x] Replay completion, routing, learning and authority scenarios with retained redacted fixtures.
- [x] Remove implicit publication/comments; add HTML requirement coverage checks.
- [x] Retire unavailable routes, repair references, and add integrity checks.
- [x] Fix examples, canonical-root references and credential documentation; retain distinct artifact lifecycles.
- [x] Add manual, local-only episode measurement schema and validated reporting.
- [x] Record dataset pilot and credential migration boundaries without altering other projects or secrets.
- [x] Run focused suites and real health checks; produce a package-by-package implementation report.

# Optimize canonical global guidance — 2026-09-19

- [x] Consolidate repetition and shorten wording while retaining all behavior and the canonical symlink source.
- [x] Review preservation of authority, completion, learning, tool contracts, design and delegation safeguards.
- [x] Verify instruction delivery, symlink health and measured size reduction; record limits.

# Restore explicit global guidance sections — 2026-09-19

- [x] Restore user-requested working-style, audit/evaluation, prompt, execution, preferences and delegation sections against the GitHub reference.
- [x] Verify content coverage, canonical instruction delivery, and updated token count.
