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
  --green:   #76ff03;
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
- Categorical charts may use stable series colors `#3199FF`, `#FF5C73`, `#B471FA`, `#F6C107`, `#39D970`, and `#55E3F9`; keep category and status meanings separate.
- On black, choose bright high-chroma accents that remain distinct at a glance. In one categorical chart, exhaust the available palette before repeating a color; keep fills near full opacity unless brightness overwhelms labels.
- Semantic callout surfaces use `5%` accent opacity. Warning icons/labels use yellow; danger and critical icons/labels use red.

## 3. Width, type, and spacing

Prose documents use a centered `780px` maximum. Technical documents use a `1280–1440px` canvas: prose remains `720–780px`, while diagrams, tables, and code may expand to `1200–1280px`. Single column is default. Stack layouts on phones.

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

- Technical body copy may rise to `16–18px`; never shrink normal text below `15px`.
- Diagram labels: at least `13.5px`, ideally `14px`. Code: `16px` in technical docs.
- Keep at least `16px` clear margin on both viewport sides at every width. A reliable shell is `width: min(calc(100% - 32px), var(--max-width)); margin-inline: auto;`. Do not defeat this floor with negative margins or full-bleed children.
- Start document shell `32–48px` from viewport top on desktop and `24–32px` on phones. Avoid oversized empty hero space.
- Document H1 has a hard `43px` maximum. A reliable default is `clamp(32px, 5vw, 43px)`; use `30–38px` on narrow screens.
- Default rhythm: section `48px`; element `16px`; grouped card padding `20px`.
- Relationship spacing: heading to description `8–10px`; description to visual `14–16px`; visual to caption/evidence `8–10px`; section to section `40–48px`.
- Use eyebrow/kicker labels only when they add context unavailable in heading.
- Put the same visible full-width `1px solid #2a2a2a` rule above the first major section and between every adjacent section. Leave `48–56px` between each rule and the following heading. Verify the computed borders and inspect the rendered lines.

If labels need to shrink below minimum to fit one row, widen visual or wrap it. Never leave a narrow `880px` document floating inside a huge black canvas.

## 4. Space before containers

Keep most sections on canvas. Establish hierarchy with type, spacing, alignment, and thin separators. Reserve containers for code, controls, diagrams, important callouts, selected states, and grouped data.

Run a rectangle audit before publishing. Remove any border, background, radius, badge, or chip that does not communicate grouping, identity, state, data, or action. Prefer whitespace and dot separators for metadata; one container may group many items, and only compact file/skill references use the individual identity-token exception defined below.

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

Tables use aligned values, compact rows, thin separators, neutral surfaces, and color only on meaningful status/value. Round outer group, not every row.

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

Keep the semantic tab-list row visually unboxed: no outer background, border, radius, or shadow. Only the active tab gets a compact low-opacity glass bubble plus bright cyan text. The selected inner bubble is the state cue, so omit a redundant bottom border or underline.

Give the unboxed tab list enough vertical room for the selected bubble: its block size should exceed the tab by at least `4px` (`2px` above and below). If selection uses a vertical transform or shadow, verify the selected tab's rendered rectangle stays fully inside the tab list so no border is clipped.

Keep panel content close to its tabs: about `16–20px` from bar to panel heading, `8–12px` from heading to the first paragraph or list, and `12–16px` below the panel's final content.

Animate selection with `160–240ms` color/background movement and panel fade plus `4–8px` slide. Motion explains state change, never delays reading. Disable movement under `prefers-reduced-motion`. Tabs remain readable if JS fails by leaving all panels in document order or a useful first panel visible.

### Callouts

Use for key insight, warning, success/note, or critical issue. Use a `5%` semantic tint with no outer outline and no colored side rail. Prefer a familiar inline SVG using `currentColor`, a consistent `24 × 24` viewBox, and `16–18px` rendered size. Align the icon to the first text line. Color warning icon/label yellow and danger/critical icon/label red; keep body copy neutral. Use emoji only when its emotional or cultural meaning is the point.

| Kind | Accent | Purpose |
| --- | --- | --- |
| Info | Cyan | Definition, insight, summary |
| Warning | Yellow | Caution, limitation, common mistake |
| Success | Green | Correct pattern, completed state |
| Critical | Red | Failure, danger, must-fix issue |

### Copyable code

Every code, command, prompt, config, or file tree gets a compact `#141414` surface and header. Put the human-readable title at top left and the real type at top right: `SHELL`, `PYTHON`, `TYPESCRIPT`, `HTML`, `CSS`, `JSON`, `YAML`, `MARKDOWN`, `SQL`, `TREE`, or another real language. Render the type as small neutral text, not a colored or bordered badge.

Place a familiar inline-SVG copy control as an overlay at the bottom right of the code portion. Hide it until the code block is hovered or the control receives keyboard focus; keep it visible on touch-only devices. Give it `aria-label="Copy …"` and `title="Copy"`; text is unnecessary when icon is recognizable. Copy nearest `<code>` text; show check/error feedback for about `1500ms`. Use `navigator.clipboard` with safe fallback. Preserve horizontal scrolling and readable focus states.

## 7. Supporting components

- Status badges show real state only: `Active`, `Failed`, `Draft`, `3 errors`. Document type, nouns, dates, counts, and ordinary facts are labels or text, not status badges. Compact file/skill reference tokens are a separate identity treatment defined below.
- Bubbles group selected controls or compact functional state. Counts and chart values stay plain unless a shared container materially improves comparison. Calls to action become bubbles only when they are true primary actions.
- Monospace is for code, commands, identifiers, filenames, routes, and values.
- Prefer inline SVG icons for document type, file, language, search, copy, warning, success, database, server, disclosure, and external link. Use `currentColor`, a shared viewBox/stroke system, and consistent alignment. Familiar action icons may stand alone with accessible names; pair unfamiliar icons with text.
- Put a small document-type icon beside compact artifact labels such as report, guide, plan, research, or reference.
- Metadata appears once as one muted line and includes only facts the reader needs. Omit implementation labels such as `Self-contained`, `Dark mode`, and `No dependencies` unless they materially affect use. Use dot separators only when two or more useful items remain; do not repeat metadata in header, sidebar, and footer.

### File and skill references

File references are quiet evidence: small colored type icon, neutral filename, optional line span. Show shortest useful filename; reveal full path only when needed.

Use `li.ref` as the semantic hook for source and evidence rows. In a final source list, keep each row unboxed and use ordinary ordered-list markers. Reserve compact bubbles for the file/skill identity tokens defined below.

| Type | Icon/accent |
| --- | --- |
| JavaScript | `JS`, `#F6C107` |
| Markdown | `MD`, `#39D970` |
| HTML | `<>`, `#3199FF` |
| CSS | `#` |
| JSON | `{ }` |
| Prisma | `◇`, `#55E3F9` or `#B471FA` |
| SQL | `▦` |

Only icon receives file-type color. Filename stays `#d4d4d8` or `#a1a1aa`; use `11–12px` mono text, `6px` radius, roughly `22px` height, and low/no border.

File and callable-skill references may use individual compact badges when the bubble makes the referenced unit easier to recognize. Use an opaque `#141414` background, `6px` radius, about `24px` height, and tight `2–4px 8px` padding; never box the surrounding group. A file badge uses its small type icon; a skill badge uses the leading `$` as its only icon. Color only the icon or `$`; keep the filename or skill name neutral. Plain commands inside prose remain unboxed monospace.

### References used

Use an `<ol>` with visible `1.`, `2.`, `3.` markers and mark every source row `li.ref`. Keep rows and the outer wrapper visually unboxed. Give outside markers `22–28px` inline-start space, allow long URLs to wrap with `overflow-wrap: anywhere`, and inspect the longest citation on a narrow viewport so neither marker nor text looks clipped. Keep the heading small (`16–18px`) so it reads as supporting material, not another primary section.

Format citations in Harvard style: `Author or organisation (Year, or n.d.) Title. Available at: URL (Accessed: D Month YYYY).` For local or unpublished guidance, replace the URL with a bracketed source description such as `[local agent guidance]`. Never invent an author or publication date; use the responsible organisation when known and `n.d.` when no reliable date is available.

Keep the gap from the last reference to the quiet footer compact: about `24–32px` total, including reference-section bottom padding and footer top padding.

## 8. Navigation and interaction

Navigation is optional. Use it only for more than roughly 6 sections when it improves scanning. Integrate sticky nav with modest `24–32px` gutter, readable `14–14.5px` text, real `IntersectionObserver` active state, and mobile collapse. Prefer no nav over broken scroll-spy.

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
3. Representation fits information.
4. All CSS is in one `<style>`; all optional JS in one classic `<script>`; no dependencies.
5. Tabs, disclosures, copy buttons, links, keyboard focus, and small-screen layout work.
6. Text and chart contrast remain readable; color has non-color cue.
7. File stays below `512 KB`.
8. Long document has quiet footer with date and exact provenance pattern: `Generated by <model> through <wrapper> Codex harness.` Omit skill name.
9. Every colored element passes semantic audit: neutral facts remain white/gray; semantic and categorical color roles do not leak.
10. Every code block has title-left/type-right plus a copy overlay on the code portion; every icon-only control has an accessible name; external links open in a new tab.
11. Research, analysis, and factual guides list references used near the end.
12. Rectangle audit passes: metadata is dot-separated, neutral counts/values are plain, file and skill badges are compact and individually meaningful, and every remaining container has a stated job.
13. The first and every adjacent major section show a computed `1px solid #2a2a2a` separator with visible top breathing room; callouts use neither side rails nor outer outlines.
14. Categorical chart colors are bright on black and do not repeat until the palette is exhausted; tab lists have no outer container styling.
15. The document keeps at least `16px` clear space on both viewport sides; source lists use visible ordered markers, Harvard-style citations, wrapped long URLs, and a `24–32px` gap before the footer.

For each visual element ask: Does it improve understanding, hierarchy/state, or useful action? Could spacing or typography do same work more quietly? If simpler works, use it.

Make important information obvious, not every piece visually interesting.
