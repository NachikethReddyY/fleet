---
name: html-communicator
description: >
  Create self-contained dark-mode HTML documents for reports, plans, summaries,
  proposals, research, comparisons, explainers, study guides, and other
  multi-section communication. Use when the user requests HTML or a structured
  document, wants to understand a concept visually, or content benefits from
  tabs, collapsibles, callouts, charts, or copyable code. Skip short replies and
  web apps, dashboards, product UI, prototypes, games, calculators, forms, or
  explicit DOCX, PDF, or slide requests.
---

# HTML Communicator

Build readable communication artifacts, not products. Output one portable dark-mode HTML file and return its local path. Publish it only when the user explicitly requests publication or has already authorized publication for that artifact.

## Workflow

1. Read [DESIGN.md](DESIGN.md) completely.
2. Identify document type, reader's first question, supporting evidence, and optional detail.
3. Choose representations before layout: prose, table, diagram, chart, tabs, or disclosure.
4. For audits, evaluations, rankings, comparisons, or measured claims, build the honest scorecard before recommendations or a roadmap; follow the scorecard rules below.
5. Write one semantic HTML file, no larger than 512 KB.
6. Add default components when content supports them: collapsible detail, tabs for comparisons/categories, semantic callouts, and copy buttons for code or commands. Style concrete named references—such as files, schema tables/models/fields, routes, APIs, callables, and error codes—with the typed reference-token system in `DESIGN.md`; keep keywords, commands, expressions, literals, and example syntax as plain code. In the final bibliography, keep each complete citation row unboxed while retaining typed reference tokens for inline repository files or paths; external sources remain ordinary links with an external-link cue. Never invent content to force a component.
   - For bibliography rows, prefer visible ordered-list markers and plain Harvard-style citation text. Omit source-type pills such as `MD` or `YouTube` when the citation already identifies the source; never wrap the complete row in a card or pill.
7. Turn applicable mandatory requirements into a short acceptance list. For local HTML artifacts, verify the file can be read with `curl --fail --silent --show-error "file:///absolute/path/to/artifact.html"` and check the returned HTML for expected content, markup, links, and relevant structure. Use source inspection for CSS and interaction logic. Do not open or operate the user's browser to test an HTML artifact unless the user explicitly requests browser testing. A request to create or preview an artifact does not by itself authorize browser testing.
8. Keep source and delivery proof separate from visual proof. `curl` confirms the local file is readable; it cannot prove rendered layout, responsive behavior, or controls. Mark those visual and interaction checks unverified unless the user explicitly requests browser testing or supplies another rendered result to inspect.
9. If publication is authorized, apply the publication privacy gate: for private-source content, verify aggregation or anonymization and identify the destination's access mode; treat unknown access as public. Then use the Postplan route below and return both artifact locations. Otherwise stop after local creation and verification.

## Existing-artifact fast path

For a narrow visual or copy correction to an existing HTML artifact, treat the current design as selected:

- Read the target artifact and the named reference or screenshot only. Do not create alternate mocks, delegate, or re-research unless the user changes direction or the reference is insufficient.
- Preserve accepted layout, sidebar geometry, headings, controls, and content. Patch the smallest responsible selector or element.
- For width feedback, inspect the rendered widths once, change the named container, and avoid moving the sidebar or changing the grid unless explicitly requested.
- Use bounded searches for supporting context. Prefer named files and structured indexes; exclude raw logs, traces, `ndjson`, provider events, generated snapshots, and diffs from recursive searches.
- Verify the affected viewport and one directly affected control, then stop when the user-visible result is correct. If updating an already-authorized Postplan draft, re-upload the same path.

## Honest scorecards

For each scorecard dimension, show the score or status, evidence, sample size, counting method, confidence, and limits. State whether values are measured, sourced, estimated, or illustrative. Use `—` when evidence is insufficient; omit rankings that a tiny or unclear sample cannot support. Keep the scorecard before recommendations or the roadmap, and place a short methodology note beside it so the reader can judge the result before acting on it.

## Artifact contract

- Dark mode; true-black canvas; monochrome structure; semantic accent only.
- One file with inline CSS, inline SVG, and optional inline classic JS. No external stylesheets, libraries, or module scripts.
- Set matching visible `<h1>` and `<title>`. Cap document `<h1>` at `43px`; scale down on narrow screens.
- Keep core content useful without JS. Use JS only for tabs, copy feedback, search/filter, or another reading aid.
- Bind behavior with `addEventListener`; no inline event handlers.
- Use a navigation sidebar only beyond roughly 6 sections, when it saves effort. It needs working scroll-spy and must collapse on small screens.
- Give every accordion or `<details>` a visible neutral `1px solid #2a2a2a` border in both its closed and `[open]` states; preserve the border when it opens.
- For a study guide with a sidebar, keep the durable-intent treatment together: a small `Study guide` eyebrow, a concise title such as `Make intent durable.`, one muted supporting sentence, and the section links. Do not split those pieces into separate cards.
- Match the response-audit layout for the main canvas: use a wide outer shell (`width: calc(100% - 64px)`, `max-width: 1760px`) with a fixed navigation column and a `minmax(0, 1fr)` content column; keep the main content at `width: 100%; min-width: 0; max-width: 1000px; justify-self: center`.
- Let the content column own the only readable width cap. The hero, section introductions, paragraphs, lists, tab panels, callouts, tables, code blocks, and references should use the remaining content width (`width: 100%`) rather than adding arbitrary 760px/780px inner caps. Preserve responsive stacking and horizontal overflow for genuinely wide tables.
- Long documents end with a quiet footer: date plus `Generated by <model> through <wrapper> Codex harness.` Omit skill name.
- External images must use HTTPS or data URLs.
- External links open in a new tab with `target="_blank"` and `rel="noopener noreferrer"`.
- Deep-link verifiable identities: whenever body, table, callout, diagram, or bibliography names a PR, commit, issue, CI run, release, doc, or other external source with a known URL, render it as an inline link with meaningful text (e.g. `PR #123`, short SHA, issue title) plus the external-link cue — never plain text the reader must hunt for, and never a bare URL in body. Repeat the full URL only in References Used in Harvard style. Never invent URLs; if the URL is unknown leave plain text. Respect the publication privacy gate: omit private URLs that fail aggregation/anonymization.
- Audit every inline monospace item as either a concrete reference identity or ordinary code/syntax, and style it according to `DESIGN.md`.
- Render repository directory references with the blue macOS-style folder token defined in `DESIGN.md`; reserve file-type marks such as `MD` for actual files.
- Use compact pill tabs for tabbed categories and comparisons. Follow the tab treatment and mobile-fit criteria in `DESIGN.md`; keep the group keyboard-accessible with `role="tablist"`, `role="tab"`, `aria-selected`, and working arrow/Home/End navigation.
- Give prose tables and long-form tab panels room to breathe: use readable body sizing and padding before adding more borders or smaller type.
- In callouts, use a text-like inline reference variant for filenames and symbols; a full-height `inline-flex` chip inside a sentence makes the line feel compressed. When the reference needs to stand out, give the inline variant `2–4px` block padding and a neutral grey surface with no outline; keep the filename neutral and let only the type icon carry semantic color.
- Keep inline repository references in bibliography rows visually synchronized with body and callout references: neutral grey surface, no outline, readable vertical padding, and only the type icon colored.
- For grouped tables, use a single outer radius and, when useful, a subtle `rgba(0, 0, 0, .05)` tint on the identity column to create hierarchy without adding another card surface.
- When a concrete file token appears inside a large title, use a title-specific text treatment rather than reusing the compact body chip; keep the filename readable and avoid inheriting compressed heading letter-spacing.
- Let process diagrams and exact-field tables use the technical canvas when the prose column would make lanes or cells feel cramped; stack or recompose when the wide view would require horizontal scrolling.

Hard bans: forms, frames, embeds, objects, applets, popups, storage, fetch, workers, meta refresh, `javascript:` URLs, secrets, private URLs, and local filesystem paths inside the artifact.

## Publish

Use this route only when publication is explicitly requested or already authorized for this artifact.

1. Write HTML locally.
2. Run `pnpm dlx postplan upload <file>`.
3. If validation fails, fix markup and retry.
4. If auth is missing, ask user to run `postplan auth login`, then retry without removing requested interactivity.
5. Re-upload same absolute path to preserve its URL. Use `--new` only when user wants a separate draft.
6. Fetch the returned URL and verify the intended content is available; report delivery and visual verification separately.

Upload success proves delivery only. Return the local path, URL, and stated access mode, and separately report the visual verification result. Never claim hosting before upload succeeds.
