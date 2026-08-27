# HTML Document Design

Design for reading, communication, and learning. Write like a clear report or spec, not a landing page or product UI.

## 1. Start with information

Before styling, decide:

1. What should reader understand first?
2. What evidence supports it?
3. What detail can wait?
4. Which representation explains it fastest?

Use this order: page, section, concept, explanation, evidence. Keep core meaning visible; disclose implementation, long code, full paths, edge cases, extended examples, and appendices.

### Document patterns

| Type | Recommended structure |
| --- | --- |
| Report, plan, summary | Title, date/subtitle, concise opening, flat sections or disclosures, optional metrics, quiet footer |
| Concept or study guide | Definition, tabs for Overview / How it works / Examples / Key terms, insight and mistake callouts, summary |
| Research or analysis | Abstract callout, finding sections, evidence, limitations, source list |
| Comparison | Short framing, tabs or aligned panels, exact-field table when useful, restrained pros/cons callouts |
| Technical reference | Concept and diagram first; collapsed code, paths, migrations, and line evidence after |

For a long study guide, put a plain-language survival map near the opening when the reader has limited review time. Keep it to the smallest set of concepts that unlocks the rest of the guide, pair each term with one concrete mental model, and give an interview-ready distinction or trade-off. Preserve the full lesson below it. Do not imply that a deep subject can be mastered in two minutes; make the short path useful on its own and honest about what it omits.

## 2. Theme and color

Monochrome first. Color earns a role.

```css
:root {
  --bg:      #000000;
  --surface: #111111;
  --border:  #2a2a2a;
  --text:    #f0f0f0;
  --muted:   #888888;
  --subtle:  #444444;

  --cyan:    #00e5ff;
  --green:   #0CEE9C;
  --yellow:  #ffea00;
  --red:     #ff1744;
  --purple:  #d500f9;
  --orange:  #ff6d00;
}
```

- Canvas stays `#000000` to `#0a0a0a`; use roughly three surface levels: canvas, elevated/code, hover/selected.
- Structure, dividers, and ordinary labels stay neutral.
- Cyan means information, links, or active selection; green success; yellow caution; orange action/alert; red danger/critical; purple special.
- Apply color at smallest useful level: text, value, icon, thin border, badge, then surface.
- Pair color with text, icon, shape, or pattern. Color cannot carry meaning alone.
- Neutral sequence numbers, labels, counts, and ordinary facts stay white or gray. Green requires actual success, completion, safety, or positive measured value; never use it merely because an item looks important.
- Use orange only for a real primary action. Ordinary source and reference links stay inline with a small external-link SVG; they are not button bubbles.
- No gradients unless data represents a spectrum. Avoid full-color section backgrounds.
- Categorical charts may use stable series colors `#3199FF`, `#FF5C73`, `#B471FA`, `#F6C107`, `#0CEE9C`, and `#55E3F9`; keep category and status meanings separate.
- On black, choose bright high-chroma accents that remain distinct at a glance. In one categorical chart, exhaust the available palette before repeating a color; keep fills near full opacity unless brightness overwhelms labels.
- Semantic callout surfaces use `10%` accent opacity. Warning icons/labels use yellow; danger and critical icons/labels use red.

## 3. Width, type, and spacing

When a document uses the sidebar/grid shell, the `.content` column owns the single readable max-width (`max-width: 1000px`, centered). Everything inside it fills that column at `width: 100%` — headings, paragraphs, lists, quote slabs, callouts, tables, code, diagrams. Never add inner caps on individual elements (no `72ch` paragraph measures, no `760px` inner containers); if text feels too wide, lower the content-column cap instead. Single-column documents without a shell may center prose at `780px`; technical canvases without a shell may run `1280–1440px` with prose near `720–780px`. Single column is default. Stack layouts on phones.

```css
body {
  font-family: Inter, "SF Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  font-size: 15px;
  line-height: 1.65;
  color: #d0d0d0;
  background: var(--bg);
}
h1 { font-size: clamp(32px, 5vw, 43px); font-weight: 700; color: #fff; }
h2 { font-size: clamp(20px, 3vw, 30px); font-weight: 600; color: var(--text); }
h3 { font-size: clamp(16px, 2vw, 19px); font-weight: 600; color: var(--text); }
.label {
  font-size: 11px;
  font-weight: 600;
  letter-spacing: .08em;
  text-transform: uppercase;
  color: var(--muted);
}
```

- Technical body copy may rise to `16–18px`; never shrink normal text below `15px`. For a user-directed full-width technical document, let title, summary, and structural content fill one bounded canvas: retain at least the viewport gutter, cap the shell at `1760px`, and avoid inner component width caps. When a report uses a sidebar, cap and center its main content column at `1000px`; everything within it — prose, lists, quotes, grouped tables, metric grids, disclosures, diagrams, and callouts — fills that column (`width: 100%; max-width: none`). The column cap is the only width cap in the document.
- Diagram labels: at least `13.5px`, ideally `14px`. Code: `16px` in technical docs.
- Keep at least `16px` clear margin on both viewport sides at every width. A reliable shell is `width: min(calc(100% - 32px), var(--max-width)); margin-inline: auto;`. Do not defeat this floor with negative margins or full-bleed children.
- In a technical canvas, let grouped tables, metric grids, disclosures, diagrams, and callouts fill their parent content width (`width: 100%; max-width: none`). When a callout uses a grid for its icon and text, let its body fill the complete remaining text column; do not reapply the document prose measure inside it.
- Start document shell `32–48px` from viewport top on desktop and `24–32px` on phones. Avoid oversized empty hero space.
- Document H1 has a hard `43px` maximum. A reliable default is `clamp(32px, 5vw, 43px)`; use `30–38px` on narrow screens.
- Default rhythm: section `48px`; element `16px`; grouped card padding `20px`.
- Relationship spacing: heading to description `8–10px`; description to visual `14–16px`; visual to caption/evidence `8–10px`; section to section `40–48px`.
- Use eyebrow/kicker labels only when they add context unavailable in heading.
- Put the same visible full-width `1px solid #2a2a2a` rule above the first major section and between every adjacent section. Leave `48–56px` between each rule and the following heading. Verify the computed borders and inspect the rendered lines.

If labels need to shrink below minimum to fit one row, widen visual or wrap it. Never leave a narrow `880px` document floating inside a huge black canvas.

## 4. Space before containers

Keep most sections on canvas. Establish hierarchy with type, spacing, alignment, and thin separators. Reserve containers for code, controls, diagrams, important callouts, selected states, and grouped data.

Run a rectangle audit before publishing. Remove any border, background, radius, badge, or chip that does not communicate grouping, identity, state, data, or action. Prefer whitespace and dot separators for metadata; one container may group many items, and only compact reference tokens use the individual identity-token exception defined below.

Keep interview answers, talk tracks, executive summaries, and other long-form key prose on the document canvas by default. Use a clear label, a stronger opening sentence, the full content-column width (`width: 100%`), and spacing to establish importance.

For a direct quote or rehearsable interview answer only, an asymmetric quote slab may establish speaker voice without looking like another generic card. Use a stronger `3px` left border, quiet `1px` top/right/bottom borders, square left corners, and gently rounded right corners: `border-radius: 0 10px 10px 0`. A `#111111` surface and `#2a2a2a` quiet borders are reliable defaults; the left edge may use cyan when the quote is the section's primary informational takeaway. Keep the label and quotation text aligned to that edge. Do not use this treatment for ordinary summaries, explanatory prose, or every answer on the page.

Avoid cards inside cards or one repeated `dark rectangle + border + large radius` treatment. Give components distinct forms:

- chips `6px`
- code `8–10px`
- callouts `8px`
- disclosures `10px`
- diagrams `12px`

## 5. Choose representation

| Information | Use |
| --- | --- |
| Sequence or process | Flow diagram |
| Architecture | Layered system diagram |
| Relationships | Node/domain diagram |
| States | Nodes plus labeled transitions |
| Time | Timeline |
| Metrics | Chart |
| Hierarchy | Tree |
| Repeated exact fields | Table |
| Implementation proof | Collapsed code/evidence |

Diagrams must explain grouping, direction, transition, or hierarchy—not turn list items into boxes. Build conceptual groups first, then components and strong directional connections. Main flow should register within 2–3 seconds.

Process and request-flow diagrams must fit the intended content column without requiring page-level horizontal scrolling. Group steps by responsibility or system boundary—such as browser, HTTP/API, application, data access, and database—instead of giving every implementation file an equal card. Use labeled lanes, compact grouped stages, or a two-row continuation when six or more steps would become a stretched strip. Preserve unambiguous reading order when the layout stacks vertically on narrow screens. A diagram does not need its own bordered panel when spacing, lane labels, and connectors already establish the group.

Tables use aligned values, compact rows, thin separators, neutral surfaces, and color only on meaningful status/value. Use `#0a0a0a` for table and metric-card surfaces. Round outer group, not every row. A subtle `rgba(0, 0, 0, .05)` tint on an identity column can create hierarchy without another card surface. Differentiate the header with at least one clear neutral cue: a `#181818–#1c1c1c` surface step, brighter neutral header text, or a stronger bottom separator. Do not rely on small gray uppercase text alone to distinguish the header from the body.

### Charts

- Use inline SVG, semantic HTML/CSS, or canvas only when text fallback remains.
- Show title, unit, baseline, comparable scale, direct values, and a compact legend.
- Bar charts start at zero unless a clearly labeled analytical reason requires another baseline.
- State whether values are measured, sourced, estimated, or illustrative.
- Related charts keep identical axes and color mappings.
- Comparison grids use two aligned columns on wide screens and one on narrow screens.
- Put each chart and its title, note, scale, and values in one outer `<div>`. Use one subtle container; keep rows and values unboxed. Prefer bright near-full-opacity bars on black and avoid repeating a categorical color until the palette is exhausted.

## 6. Default components

Multi-section documents should use all four when natural content exists. Short documents may omit unnecessary components.

### Collapsible sections

Use native `<details>` and `<summary>` for optional detail, references, appendices, and long implementation proof. Style summary as a compact disclosure; show a plus/minus state with CSS. Keep core conclusions outside.

### Tabs

Use tabs for parallel categories or comparisons, not sequential steps. Each tab group contains:

1. A `role="tablist"` button row.
2. Buttons with `role="tab"`, `aria-selected`, and `aria-controls`.
3. Panels with `role="tabpanel"`; inactive panels use `hidden`.
4. Scoped JS using `addEventListener`, keyboard support, and no inline handlers.

Use compact pill tabs in one unboxed, single-line tablist. Give the tablist no background, border, radius, or shadow; let only the selected pill use a clear filled step, bright text, and restrained weight. Color may accent the selected text or focus ring but must not carry selection alone. Do not add a second underline-style tab treatment to the same document.

Keep pills on one line with intrinsic widths and make the tablist horizontally scrollable when it exceeds the content column. Each label remains whole inside its pill; the list scrolls instead of wrapping, shrinking labels, or clipping the last item. Hide permanent scrollbar chrome when touch or trackpad scrolling remains available, preserve visible keyboard focus, and ensure keyboard selection brings the active pill into view. Verify the longest label, the last tab, and horizontal reachability at the narrowest viewport.

Keep panel content close to its tabs: about `16–20px` from bar to panel heading, `8–12px` from heading to the first paragraph or list, and `12–16px` below the panel's final content.

Animate selection with `160–240ms` color/background movement and panel fade plus `4–8px` slide. Motion explains state change, never delays reading. Disable movement under `prefers-reduced-motion`. Tabs remain readable if JS fails by leaving all panels in document order or a useful first panel visible.

### Callouts

Use for key insight, warning, success/note, or critical issue. Use a `10%` semantic tint for every callout surface, with no outer outline and no colored side rail. Match the surface to the semantic color: cyan for info, yellow for warning, green for success, and red for critical. Keep the icon/label in that same semantic color and body copy neutral. Callouts fill their parent content width, and their text fills the complete grid column beside the icon. Prefer a familiar inline SVG using `currentColor`, a consistent `24 × 24` viewBox, and `16–18px` rendered size. Align the icon to the first text line. Use emoji only when its emotional or cultural meaning is the point.

Match the icon to the statement, not merely to the callout color: use an information circle for a broad explanation, a link or relationship glyph for relational integrity, a shield for security, a database cylinder for persistence or stored data, a warning triangle for caution, and a check for a verified success. If no familiar icon improves recognition, omit it rather than falling back to a generic information icon.

| Kind | Accent | Purpose |
| --- | --- | --- |
| Info | Cyan | Definition, insight, summary |
| Warning | Yellow | Caution, limitation, common mistake |
| Success | Green | Correct pattern, completed state |
| Critical | Red | Failure, danger, must-fix issue |

### Copyable code

Every code, command, prompt, config, or file tree gets a compact `#141414` surface and header. Disclosures use `#0a0a0a` and fill their parent content width. Put the human-readable title at top left and the real type at top right: `SHELL`, `PYTHON`, `TYPESCRIPT`, `HTML`, `CSS`, `JSON`, `YAML`, `MARKDOWN`, `SQL`, `TREE`, or another real language. Render the type as small neutral text, not a colored or bordered badge.

Apply accessible token-level syntax color to code blocks that are longer than three lines or central to the explanation. A reliable dark-theme mapping is comments `#888888`, keywords `#B471FA`, functions/types `#55E3F9`, strings `#0CEE9C`, numbers/constants `#F6C107`, and punctuation/operators in neutral text. Keep every token readable against `#141414`, make the code understandable when color is removed, and avoid coloring whole lines or assigning a different hue to every identifier. In self-contained documents, emit escaped token spans directly; do not add a highlighting dependency. Copy behavior must return the plain code text without labels or visual markup.

Place a familiar inline-SVG copy control as an overlay at the bottom right of the code portion. Hide it until the code block is hovered or the control receives keyboard focus; keep it visible on touch-only devices. Give it `aria-label="Copy …"` and `title="Copy"`; text is unnecessary when icon is recognizable. Copy nearest `<code>` text; show check/error feedback for about `1500ms`. Use `navigator.clipboard` with safe fallback. Preserve horizontal scrolling and readable focus states.

## 7. Supporting components

- Status badges show real state only: `Active`, `Failed`, `Draft`, `3 errors`. Document type, nouns, dates, counts, and ordinary facts are labels or text, not status badges. Compact reference tokens are a separate identity treatment defined below.
- Bubbles group selected controls or compact functional state. Counts and chart values stay plain unless a shared container materially improves comparison. Calls to action become bubbles only when they are true primary actions.
- Monospace is for code, commands, identifiers, filenames, routes, and values.
- Prefer inline SVG icons for document type, file, language, search, copy, warning, success, database, server, disclosure, and external link. Use `currentColor`, a shared viewBox/stroke system, and consistent alignment. Familiar action icons may stand alone with accessible names; pair unfamiliar icons with text.
- Put a small document-type icon beside compact artifact labels such as report, guide, plan, research, or reference.
- Metadata appears once as one muted line and includes only facts the reader needs. Omit implementation labels such as `Self-contained`, `Dark mode`, and `No dependencies` unless they materially affect use. Use dot separators only when two or more useful items remain; do not repeat metadata in header, sidebar, and footer.

### Reference tokens

References are quiet evidence with one shared visual family and type-specific identity. A file reference uses a small file-type icon, a neutral filename, and an optional line span. A directory reference uses a blue macOS-style folder icon and never inherits a file-type mark. A database table, Prisma model, schema field/column, enum, callable, route, API, package, config key, or error code uses a compact type glyph plus its neutral identifier. A skill reference uses its leading `$`. Show the shortest useful name and reveal a full path only when needed.

Use reference-token styling whenever prose or a table asks the reader to locate, recognize, or return to a concrete named unit. For example, `schema.prisma` is a file token, `event_registrations` is a database-table token, `EventRegistration` is a model token, `eventId` is a schema-field token, and `findUnique` is a callable-symbol token. Plain syntax fragments, data types, values, commands, expressions, query fragments, and incidental identifiers remain unboxed monospace. When the same text appears in both roles, style only the referential occurrence. Audit every inline `<code>` or monospace fragment with this test: “Is the reader being pointed to a concrete unit, or being shown language syntax/value?” Do not turn every monospace word into a token. A file reference inside a large heading is a special case: use a larger, text-like title treatment with no compact chip background, and prevent the heading's compressed letter-spacing from distorting the filename.

When explanatory prose teaches the identity or purpose of a Prisma schema attribute—such as `@map`, `@@map`, `@relation`, `@db.*`, `@unique`, `@@unique`, or `@@index`—treat each named attribute as a schema-attribute reference token so it is easy to find and compare. Use the purple enum/schema-attribute identity. Inside a Prisma code block, the same attributes remain syntax-highlighted keywords without chips. Operators and type modifiers such as `?` and `[]` remain ordinary inline code unless the prose points to a separately documented named feature.

Use `li.ref` as the semantic hook for source and evidence rows. In a final source list, keep each row unboxed and use ordinary ordered-list markers. Reserve compact bubbles for the reference identity tokens defined below.

| Type | Icon/accent |
| --- | --- |
| Directory/folder | compact macOS-style folder SVG with a tab and layered `#79C2FF`, `#3199FF`, and `#9DD5FF` fills |
| JavaScript | `JS`, `#F6C107` |
| Markdown | `MD`, `#0CEE9C` |
| HTML | `<>`, `#3199FF` |
| CSS | `#` |
| JSON | `{ }` |
| Prisma | `◇`, `#55E3F9` or `#B471FA` |
| SQL or database artifact | inline SVG database cylinder/stack, `#55E3F9` |
| Callable or method | `ƒ` or compact function SVG, `#55E3F9` |
| Model or entity | compact node/data-model SVG, `#B471FA` |
| Schema field or database column | `↳` or compact field SVG, `#F6C107` |
| Enum or schema attribute | `E` or `◇`, `#B471FA` |
| Config, environment key, or package | `$` or compact package/config SVG, `#0CEE9C` |
| Error code | `!`, `#FFEA00` |

Only the icon receives type color. Reference text stays `#d4d4d8` or `#a1a1aa`; use `11–12px` mono text, `6px` radius, roughly `22–24px` height, and low/no border. For a directory path—with or without a trailing slash—use a compact inline SVG with the familiar folder tab and layered blue surfaces; hide the token's default pseudo-icon so labels such as `MD` cannot appear beside it. Use a database cylinder rather than a generic grid or document glyph for SQL files, stored procedures, migrations, and other database-owned artifacts.

Inline reference tokens must share the surrounding text line, not sag below it or float above it. For a `22–24px` `inline-flex` token beside `15–16px` body text, start with `vertical-align: .1em`; do not copy a negative offset as a default. Measure the token box against an adjacent text `Range.getBoundingClientRect()` in a paragraph, list item, and table cell. Keep their vertical-center difference within `1px` when practical and never beyond `2px`. Adjust the `vertical-align` value for the actual font and line height rather than using transforms or relative positioning, which can move paint without fixing the inline line box. If a body token makes the line look cramped, use a text-like inline variant with inherited line height and reduced vertical padding rather than shrinking the surrounding prose. Use that text-like variant inside callouts unless the reference itself is the subject of the callout. When the reference is important enough to need emphasis, the text-like variant may use `2–4px` block padding and a neutral grey surface with no outline; keep the filename neutral and let the icon carry the type color.

File, symbol, and skill references may use individual compact tokens when the shape makes the referenced unit easier to recognize. Use an opaque surface, `6px` radius, about `24px` height, and tight `2–4px 8px` padding; never box the surrounding group. On the canvas, `#141414` is sufficient. Inside a `#111111` card or `#0d0d0d` disclosure, step the token up to roughly `#202020–#242424`; add a quiet `#343434` border only when the edge still disappears. Never reuse a token surface that is visually indistinguishable from its immediate parent. Let long tokens wrap or break with `max-width: 100%`, `white-space: normal`, and `overflow-wrap: anywhere` rather than widening the page.

### References used

Use an `<ol>` with visible `1.`, `2.`, `3.` markers and mark every source row `li.ref`. Keep rows and the outer wrapper visually unboxed. Give outside markers `22–28px` inline-start space, allow long URLs to wrap with `overflow-wrap: anywhere`, and inspect the longest citation on a narrow viewport so neither marker nor text looks clipped. Keep the heading small (`16–18px`) so it reads as supporting material, not another primary section.

Keep each bibliography row and its complete citation unboxed. Within that row, style each inline repository file or path with the same typed reference token used elsewhere; use the same neutral grey surface, no outline, and readable vertical padding as body/callout references so the visual language stays synchronized without turning the full citation into a card. Keep multiple repository files as separate tokens rather than joining them inside one bubble. A source outside the repository is an ordinary inline link with a small external-link SVG. External links open in a new tab and use `rel="noopener noreferrer"`. Do not style publication titles, organisations, dates, or descriptive source labels as reference tokens.

Format citations in Harvard style: `Author or organisation (Year, or n.d.) Title. Available at: URL (Accessed: D Month YYYY).` For local or unpublished guidance, replace the URL with a bracketed source description such as `[local agent guidance]`. Never invent an author or publication date; use the responsible organisation when known and `n.d.` when no reliable date is available.

Keep the gap from the last reference to the quiet footer compact: about `24–32px` total, including reference-section bottom padding and footer top padding.

## 8. Navigation and interaction

Navigation is optional. Use it only for more than roughly 6 sections when it improves scanning. Integrate sticky nav with modest `24–32px` gutter, readable `14–14.5px` text, real `IntersectionObserver` active state, and mobile collapse. Mark the active sidebar item with cyan text and a `2px` cyan line on the sidebar edge; use the same cyan line on the bottom edge when navigation collapses horizontally. Prefer no nav over broken scroll-spy.

Interactivity must remove reading friction. Good uses: reveal answer/detail, switch comparisons, copy code, search/filter long docs. Controls need semantic elements, visible focus, accessible names, adequate targets, and concise success/failure feedback. External links open in a new tab and use `rel="noopener noreferrer"`. Respect reduced-motion preferences.

## 9. Scanability and restraint

- Short, scannable paragraphs; selective emphasis.
- Concept and visual before proof or code.
- Charts, diagrams, tables, and code may be wider than prose.
- No decorative stat cards, gradients, badges for nouns, icons on every heading, excessive helper text, or marketing hero.
- Different component types must not share equal visual weight.
- Callouts integrate with document; code remains secondary; file chips stay quietest.

## 10. Output check

Before publishing, verify:

1. Subject matches `<title>` and visible `<h1>`; computed H1 size never exceeds `43px`.
2. Core message is clear without opening disclosures or reading code.
3. Representation fits information; process diagrams group steps by boundary, fit their content column, and preserve clear order without required horizontal scrolling.
4. All CSS is in one `<style>`; all optional JS in one classic `<script>`; no dependencies.
5. Tabs, disclosures, copy buttons, links, keyboard focus, and small-screen layout work; pill tablists stay on one horizontally scrollable line with whole labels and a reachable last tab at the narrowest viewport.
6. Text, chart, code-token, and nested reference-token contrast remain readable; color has a non-color cue.
7. File stays below `512 KB`.
8. Long document has quiet footer with date and exact provenance pattern: `Generated by <model> through <wrapper> Codex harness.` Omit skill name.
9. Every colored element passes semantic audit: neutral facts remain white/gray; semantic and categorical color roles do not leak.
10. Every code block has title-left/type-right, accessible syntax color when useful, and a copy overlay on the code portion; every icon-only control has an accessible name; callout and reference icons match the thing they represent; external links open in a new tab.
11. Research, analysis, and factual guides list references used near the end.
12. Rectangle audit passes: metadata is dot-separated, neutral counts/values are plain, long-form answers do not default to large bordered cards, direct-quote slabs keep square left corners and rounded right corners, reference tokens are compact and individually meaningful, directories use blue folder icons while file-type marks remain exclusive to files, inline reference-token centers align within `2px` of adjacent text, every inline monospace item was classified as reference identity or syntax, and every remaining container has a stated job.
13. The first and every adjacent major section show a computed `1px solid #2a2a2a` separator with visible top breathing room; callouts use neither side rails nor outer outlines.
14. Categorical chart colors are bright on black and do not repeat until the palette is exhausted; tablists are unboxed and only the selected pill receives a filled surface.
15. The document keeps at least `16px` clear space on both viewport sides; table headers have a visible neutral distinction from body rows; source lists use visible ordered markers, Harvard-style citations, wrapped long URLs, and a `24–32px` gap before the footer.

For each visual element ask: Does it improve understanding, hierarchy/state, or useful action? Could spacing or typography do same work more quietly? If simpler works, use it.

Make important information obvious, not every piece visually interesting.
