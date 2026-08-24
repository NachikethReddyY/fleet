# Design Rules

Compact design guidance for generating polished HTML documents and interfaces.
Use these rules as defaults; adapt them to the content rather than treating them as a fixed template.

## 1. Design for the Content

Identify what you are generating: report, learning document, analysis, technical documentation, dashboard, presentation, comparison, etc.

Determine what the user should understand first, what is supporting information, and what can be revealed later.

**Do:** design around the information and reading task.
**Don't:** apply the same dashboard/card layout to everything.

**Width for technical docs:** technical documents with diagrams, tables, code, and architecture visuals must use substantially more horizontal space than prose-only pages. Default canvas 1360–1480px; sidebar + content should feel like one intentional wide layout, not a small document floating in black space. Keep long prose at 720–780px, but let diagrams, tables, and code use the full available width. Never float a narrow 880px column inside a huge canvas. Different content types get different max-widths — prose stays readable, visuals expand. If a diagram forces its labels below ~13px to stay on one row, the content width is too narrow — widen the canvas or wrap to two rows.

## 2. Dark Mode

Dark mode is preferred.

- Canvas: `#000` to `#0A0A0A`
- Keep the black canvas dominant.
- Use roughly 3 surface levels: canvas, elevated/code, hover/selected.
- Build hierarchy with contrast, typography and spacing.

**Do:** use subtle tonal differences where surfaces are useful.
**Don't:** create dozens of slightly different dark-grey rectangles.

## 3. Prefer Space Over Containers

Most sections should sit directly on the canvas.

Use spacing, alignment, typography and subtle separators before adding cards.

Reserve containers for code, controls, diagrams, important callouts, selected states, or genuinely grouped data.

**Do:** use whitespace to establish structure.
**Don't:** put every section in a card or nest cards unnecessarily.

> If spacing or typography can communicate the structure, don't create another component.

Diagrams, concept summaries, and small information groups do NOT need a box by default. Use a box only when the content is genuinely grouped data, code, or an alert. When everything is boxed, nothing is distinct.

**Reduce repeated container language:** many elements currently share `dark rectangle + border + rounded corners` (diagrams, callouts, nav, code, disclosures). Give each type distinct treatment and allow ordinary content to stay unboxed. Use smaller radii overall — strong rounding should be intentional: chips 6px, code 8–10px, callouts 8px, disclosures 10px, diagrams 12px. Not every object needs the same large radius.

## 4. Create Clear Hierarchy

Typical hierarchy:

`Page → Section → Concept → Explanation → Evidence`

Suggested scale (technical docs — larger than before):

- H1: 42–48px semibold
- H2: 30–34px semibold
- H3: 19–21px semibold
- Body: 18px (never below 17px at normal zoom; was 15–17 — too small)
- Sidebar navigation: 14–14.5px (not 12–13px)
- Annotation / chip: 13.5–14.5px (never below 13px inside diagrams)
- Code: 14px mono
- Diagram labels: minimum 13.5px, ideally 14px

Let major headings use available width; keep long body text at a comfortable reading width.

Hierarchy is created by size, weight, spacing, and contrast — not by making secondary text tiny. Important explanations should be findable while scanning without hurting readability. Prioritize comfortable reading at normal browser zoom; use contrast before reducing font size.

**Avoid excessive eyebrow/kicker text:** do not automatically add small uppercase text above every heading (`VSMS — Visual Screening Management System`, `VSMS · Database Tour`) or a descriptive line below every section. A strong title often needs no label. Keep eyebrow text only when it provides context the heading cannot. Repeated kickers create visual noise that competes with hierarchy.

**Do:** use size, weight, spacing and contrast first.
**Don't:** use cards, badges or color to compensate for weak hierarchy, or shrink secondary text until it is hard to read. Don't add kickers everywhere.

## 5. Use Color With Purpose

The design should work in monochrome first, then use color where it communicates meaning.

Semantic defaults:

- Blue → action/accent
- Green → correct/success/complete/safe
- Amber → warning/partial/needs attention
- Red → error/failure/danger

Apply color at the smallest useful level:

`text → value → icon → thin border → badge → surface`

Keep labels, units and surrounding structure neutral unless they carry the same meaning.

**Do:** pair color with text, an icon, shape or pattern.
**Don't:** rely on color alone or color unrelated elements decoratively.

Large tinted cards should be rare; use them only when the entire area represents an important status or alert.

## 6. Minimize Badges and Pills

Badges should communicate meaningful state or compact information that benefits from quick scanning.

Good:

`Active` `Failed` `Draft` `3 errors`

Prefer restrained outline badges with a neutral interior.

**Do:** use badges for actual state.
**Don't:** turn technologies, concepts, headings or ordinary metadata into decorative pills.

Remove labels when context already explains their meaning.

## 7. Choose the Right Representation

Do not automatically render information as prose, lists or tables.

Use:

- Sequence/process → flow diagram
- Architecture → system diagram with layered grouping
- Relationships → node/domain diagram
- States → real state diagram (nodes + labeled arrows), not text inside rounded rectangles
- Timeline → timeline
- Metrics → chart
- Hierarchy → tree
- Exact repeated-field comparison → table
- Implementation → code (secondary, collapsible)

**Do:** visualize relationships when it improves comprehension.
**Don't:** force visual information into large blocks of prose, or reduce a state machine to tiny text inside boxes.

**Diagrams must not be "text inside cards."** If the relationship or transition is the point, draw it as a diagram (nodes, arrows, groups) — do not just put the same text in a rounded rectangle.

## 8. Use Diagrams for Mental Models

Bad:

`React → Axios → Express → Middleware → Controller → Service → Prisma → PostgreSQL`

Better: a clear SVG, Mermaid or HTML/CSS architecture diagram with **visual grouping** between layers.

**Rebuild, don't patch:** if a diagram reads as a row of boxes rather than an architecture, regenerate it from the concept — establish conceptual groups first (frontend / API+application / data layer / database / workers), then components and connections. Do not rescue a weak diagram by adding borders, labels, arrows, or colors.

For architecture/process diagrams:

- Group related components with subtle bands or proximity — don't show equal cards in a single row with many internal containers.
- Use strong, directional arrows (not faint hairlines) — flow should be obvious in 2–3 seconds before reading labels.
- Labels at readable size (≥13.5px, ideally 14px). Never shrink labels to keep a diagram on one row; widen or wrap.
- Avoid coloring every node outline differently; the **flow** is the emphasis, not individual nodes.
- A good diagram communicates the main flow before the user reads individual labels.

Diagrams should be large enough to scan quickly, clearly directed, lightly labelled and focused on the important path. If a visual does not explain the relationship better than text, redesign it or keep it as text.

**Do:** use visuals to reduce explanation. Visually represent transitions, grouping, direction, or hierarchy.
**Don't:** add diagrams purely for decoration, force an unreadable single-row layout, or convert a list into rounded rectangles and call it a diagram.

## 9. Tables Are for Tabular Data

Use tables when users need exact comparison across consistent fields.

For dense tables or metric rows:

- keep surfaces neutral;
- use thin separators;
- align comparable values;
- keep rows compact;
- color the meaningful value/status rather than the entire row;
- round the outer group rather than every item.

Consider diagrams instead for architecture, workflows, states, schema relationships and event lifecycles.

**Do:** let typography and alignment carry the table.
**Don't:** turn every metric into a separate rounded card.

## 10. Separate Concept From Proof

For technical content:

**Understand it → Inspect the proof**

Show the concept, visual and explanation first.

Then expose supporting implementation such as source files, functions, migrations, code and line references — preferably **collapsed** (details/summary, tabs) so code does not visually dominate the concept.

**Do:** make the concept understandable without reading code.
**Don't:** mix explanations, paths and implementation evidence in the same paragraph, or let a large code block become the loudest element in a section.

## 11. Use Progressive Disclosure

Keep primary information visible. Reveal secondary complexity when needed.

Good candidates:

- implementation details
- long code
- full paths
- edge cases
- extended examples
- source evidence

Use accordions, expandable sections, tabs or popovers where useful. Implementation-heavy documents should use this liberally to break up long vertical walls of paragraph → code → paragraph.

**Do:** hide secondary complexity.
**Don't:** hide core information purely for aesthetics.

Visual summaries (small diagrams, inline metrics, relationship sketches) between dense technical sections reduce the wall-of-text effect without deleting information.

## 12. Use Interactivity With Purpose

Useful examples:

- Question → reveal answer
- Concept → reveal implementation
- Diagram node → show details
- Code/prompt → copy
- Large document → search/filter

Keep controls compact and familiar. Icon-only actions should have accessible labels and sufficiently large interaction targets.

Provide concise success/failure feedback without interrupting the reading flow.

**Do:** add interaction when it removes friction.
**Don't:** add interaction or helper text merely because the interface supports it.

## 13. Limit Monospace

Use monospace for actual technical literals: code, commands, identifiers, filenames, routes and values.

**Do:** keep technical references visually secondary.
**Don't:** scatter long paths, endpoint strings and symbols throughout prose.

The eye should notice **Optimistic concurrency** before `eventService.js:1229`.

## 14. File References

Use compact file-reference elements instead of long paths inside prose. Chips must be one of the **quietest** components on the page.

**File-type system (consistent):**

- JavaScript → `JS` (yellow `#F6C107` on dark, compact)
- Markdown → `MD` (restrained green `#39D970`)
- HTML → `<>` (blue `#3199FF`)
- CSS → `#` or CSS mark
- JSON → `{ }`
- Prisma → triangular/database ◇ (`#55E3F9` or `#B471FA`)
- SQL → SQL/database ▦
  Avoid generic document icons when the type is known. Icons must be compact (11–12px), proportionally balanced (no tall/stretched document shapes), and visually consistent in size/weight.

**Color rule:** only the **icon** gets the file-type color; the filename text stays white/neutral. File references are evidence, not semantic status. Do not color the entire chip by extension.

Style:

- file-type icon 11–12px, colored as above, but small and subservient
- monospace filename 11–12px, **neutral white/grey** (`#d4d4d8` / `#a1a1aa`)
- subtle dark surface (`#0f0f0f` / `#111`)
- radius 6px (not pill), height ~22px, vertical padding 3px
- low/no border, secondary weight — quieter than body text
- icon + filename, icon slightly smaller than text

Examples:

`[yellow JS] eventService.js`

`[green MD] DESIGN.md`

`[triangular Prisma] schema.prisma`

Actual rendering:

`# eventService.js · L1229–1264` (yellow JS icon, neutral filename)

Show the shortest useful filename by default. Reveal the full path on hover, tooltip or expansion when necessary.

Prefer:

**Optimistic concurrency prevents stale updates from replacing newer data.**

`[JS] eventService.js · L1229–1264`

Avoid:

`backend/services/eventService.js:1229-1264 implements optimistic concurrency...` (and avoids coloring the whole filename yellow)

**Do:** treat file references as quiet supporting evidence with intentional, file-type-specific icons.
**Don't:** reuse the chip style for arbitrary metadata, make chips feel like badges/buttons, use generic or tall stretched icons, or color the entire filename.

## 15. Use Icons Carefully

Use familiar icons where they improve recognition: file, search, copy, warning, success, database, server, expand, external link.

Use `icon + text` when meaning may be unclear. Prefer file-type-specific icons over a single generic document icon. Keep icons compact and proportioned to the text (icon slightly smaller than or equal to filename).

**Do:** use icons to reduce reading.
**Don't:** attach decorative icons to every heading or paragraph.

## 16. Keep Navigation Secondary — and Optional

For long documents, use quiet navigation that assists rather than dominates. **Navigation is optional.** If scroll-spy / active-state is broken or the document is better served by width, remove the sidebar entirely — a broken or detached nav wastes space and hurts scanability.

When you do include nav:

`[ sticky navigation ] [ main reading area ]`

- Keep the gutter modest (24–32px, not a huge canyon).
- Navigation is part of the document, not a floating detached column.
- Sidebar text should be readable (14–14.5px, not 12px).
- Active state needs a real scroll-spy (IntersectionObserver) — not just a static `active` class on the first item. If you cannot implement it, remove the nav.
- Collapse nav on smaller screens.

**Single-column is the default for technical docs** unless nav is provably useful. When nav is removed, let the content use the viewport: prose at 760–780px, but diagrams/tables/code expand to the full content width (up to 1200–1280px). Do not leave large black gutters on both sides.

Keep setup or usage instructions in the natural reading flow rather than beside headings where they interrupt comprehension.

**Do:** let users reach the main mental model quickly. Prefer no nav over a broken nav.
**Don't:** make a giant contents panel dominate the opening, isolate nav with excessive whitespace, or ship a non-functional active state.

## 17. Comparative Charts and Grids

Use grids when several comparable charts or panels benefit from simultaneous scanning.

Prefer:

- two aligned columns on wide screens;
- one column on narrow screens;
- consistent panel dimensions and axes;
- compact legends close to the data;
- stable color mappings across all related visuals.

Suitable categorical palette on black:

`#3199FF` blue
`#55E3F9` cyan
`#39D970` green
`#F6C107` amber
`#FF5C73` coral/red
`#B471FA` purple

Categorical colors identify different series. Semantic green/amber/red communicate status.

**Do:** keep those two color roles distinct.
**Don't:** change mappings between related charts.

## 18. UI Mock Variants

When showing design variants:

- render actual variants rather than describing them;
- label them `A`, `B`, `C`;
- keep the underlying content consistent;
- place them for direct comparison;
- vary the design, not the information.

**Do:** make differences immediately visible.
**Don't:** use written descriptions when the user needs to compare visual options.

## 19. Avoid the AI-Generated UI Look

Watch for:

- cards inside cards
- badges for every noun
- excessive rounded corners (many elements sharing the same large radius)
- dozens of grey surfaces
- unnecessary gradients
- decorative stat cards
- repeated metadata boxes
- icons everywhere
- excessive inline monospace
- equal visual weight everywhere
- oversized metric rows
- unnecessary helper text
- varied components sharing the same dark rectangle + border + large radius (code, callouts, diagrams, disclosures all look identical)

**Do:** prefer strong typography, spacing, alignment and intentional emptiness. Give each component type a distinct purpose: code = mono + dark block with subtle border (8–10px); diagram = light stroke on canvas with grouped bands (12px); chip = tiny quiet annotation (6px); disclosure = collapsible secondary (10px); callout = integrated subtle semantic surface (8px) — not a card.
**Don't:** add components solely to make the page look "designed." Differentiate: not every section needs a container. Use smaller radii overall; strong rounding is intentional, not default.

**Callouts should feel integrated, not like dashboard alerts.** Avoid `colored vertical border + dark card + text`. When the entire message carries a meaning (success, warning), use a very subtle semantic background + appropriate icon (`✓  Important explanation` with faint green tint). Keep tint restrained and preserve text contrast. Do not let a thick colored stripe do the state communication.

## 20. Optimize for Scanability

Users should understand the document structure without reading every sentence.

Use clear headings, concise paragraphs, whitespace, selective emphasis, useful visuals and consistent alignment.

Let diagrams, charts and tables become wider than prose when the information benefits from it. Make better use of desktop width — wider diagrams, comparison layouts, and occasional side-by-side structures reduce excessive vertical scrolling.

**Do:** emphasize what matters.
**Don't:** bold, highlight or decorate everything.

## 21. Horizontal Use & Density — Fixes for Common Failures

When a document contains many implementation-heavy sections (transactions, concurrency, security, jobs), the design must work harder:

- **Width:** technical pages use 1280–1440px. Prose is constrained, visuals are not. If a diagram's labels drop below 13px, the layout is too narrow.
- **Typography:** body 17–18px, never shrink secondary text to tiny to create hierarchy — make it quieter via color/weight.
- **Diagrams:** must be real explanatory visuals with grouping and strong flow, not text inside rounded rectangles. Use the full width or wrap to two rows before shrinking type.
- **Containers:** differentiate strongly — code vs callout vs diagram vs chip should not share the same dark-rounded-box. Many sections should have no container at all.
- **File chips:** quietest element on the page — compact, file-type-specific, icon subservient to filename.
- **Visual breaks:** insert small relationship sketches, mini-flows, or comparison strips between dense code/text sections to break vertical monotony.
- **Code hierarchy:** concept → visual → explanation is primary; code is secondary and collapsible. Never let a code block outrank its explanation.

## 22. Vertical Spacing as a System

Some areas have generous gaps while related elements sit very close. Spacing must communicate relationships.

Scale:

- heading → description: close (8–10px)
- description → primary visual: moderate (14–16px)
- visual → supporting evidence (chips, caption): close (8–10px)
- end of section → next section: large (40–48px)

Use a consistent scale based on semantic relationship. Do not apply arbitrary margins independently to every component. Whitespace should tell the user which elements belong together.

## 23. Metadata Should Not Compete

Technical metadata such as `Prisma 6 · Postgres 18 · 61 migrations · 50 models` is useful but secondary. Keep it compact and quiet — one muted line, not repeated in hero, sidebar, and footer. Sidebar footer info (`Offline-readable · one file`) should also be minimal. Do not let metadata rival headings or body content.

# Technical Diagram & Color Rules

Use these rules for technical reports, architecture documents, analysis pages, system maps, benchmarks, and engineering proposals.

## Diagram Style

- Use a true black or near-black canvas.
- Keep diagrams mostly flat and neutral.
- Prefer thin lines, simple boxes, and direct labels.
- Avoid decorative gradients, shadows, glass effects, and unnecessary depth.
- Use modest corner radius. Technical diagrams should not look like rounded app cards.
- Use borders only when they help define a node or boundary.
- Keep diagram nodes compact. Do not create large empty containers around short labels.
- Let the information occupy the width available.
- Prefer wide horizontal diagrams when showing flow, routing, pipelines, or system boundaries.
- Use vertical layouts only when the relationship naturally flows top-to-bottom.
- Keep arrows obvious and easy to follow.
- Use straight or minimally bent connectors where possible.
- Avoid decorative connector curves unless they clarify overlapping relationships.
- Keep arrowheads large enough to read without becoming visually dominant.
- Use dashed lines only when they communicate a different relationship, such as optional, failed, indirect, or fallback flow.
- Do not turn a list of concepts into a row of colorful cards and call it a diagram.
- A diagram must show at least one useful relationship: flow, hierarchy, dependency, state, ownership, grouping, or comparison.
- If the relationship is not clearer visually than in text, keep it as text.

## Diagram Hierarchy

- Make the main path immediately visible.
- Secondary relationships should be quieter.
- Use position and grouping before color.
- Use labels outside or above groups when several nodes belong to the same layer.
- Avoid placing excessive explanatory text inside nodes.
- Node text should usually contain:
  - a short title;
  - one short supporting line if necessary.

- Put detailed explanations below the diagram rather than inside every box.
- Keep diagram typography large enough to read at normal browser zoom.
- Do not shrink labels just to force everything into one row.
- If the diagram becomes crowded, use more width, split it into stages, or simplify it.
- Rebuild unclear diagrams instead of adding more boxes, labels, borders, and arrows to patch them.

## Architecture Diagrams

For request flows or system architecture:

- Group related components into clear layers or boundaries.
- Example:
  `Client → HTTP/API → Domain → Persistence → Database`
- Show the main request direction prominently.
- Use neutral nodes by default.
- Highlight only important boundaries or transitions.
- Make responsibilities visible through placement and concise labels.
- Do not assign every technology its own saturated fill color.
- Avoid turning architecture into a rainbow pipeline.
- If a boundary matters more than an individual component, emphasize the boundary rather than coloring every node inside it.

## Relationship Diagrams

For entity, schema, or dependency relationships:

- Use lines and placement as the primary communication method.
- Keep entity boxes neutral.
- Use color only when it identifies a meaningful family or special role.
- Keep related entities spatially grouped.
- Avoid excessive crossing lines.
- Prefer clear connection geometry over decorative styling.
- Do not color every entity differently unless those colors encode real categories.

## State and Process Diagrams

- Show transitions, not just states.
- Use arrows to communicate allowed movement.
- Distinguish terminal, error, warning, or exceptional states only when useful.
- Keep ordinary states neutral.
- Use semantic color for exceptional states rather than giving every state a unique color.
- Avoid representing state machines as unrelated boxes with enum text inside them.

## Technical Document Style

- Treat the page as a technical report, not a landing page.
- Use strong but moderate headings.
- Avoid oversized hero typography.
- Useful information should begin early in the viewport.
- Prefer dense, deliberate layouts over large decorative empty areas.
- Use the available horizontal space, especially for diagrams, tables, and charts.
- Keep prose at a readable width, but allow technical visuals to become significantly wider.
- Use clear section separators rather than enclosing every section in a card.
- Prefer thin horizontal rules, whitespace, alignment, and typography for structure.
- Avoid cards inside cards.
- Avoid repeated rounded dark-grey rectangles.
- Black should remain the dominant surface.
- Dark grey should be used only where an actual surface is useful.
- Keep body text bright enough to read comfortably.
- Use muted grey for supporting context, captions, caveats, and metadata.
- Secondary text should be quieter through contrast before becoming dramatically smaller.

## Technical Tables

- Keep tables flat.
- Use thin neutral row separators.
- Avoid putting every row or metric into its own card.
- Keep headers muted but clearly distinguishable.
- Use white or near-white for primary values.
- Align numeric values consistently.
- Keep row heights compact.
- Use bold only when a value genuinely needs emphasis.
- Allow one or a few values in a row to carry semantic color.
- Do not tint an entire row when highlighting one number is enough.

## Color Usage

Color should communicate information, not decorate the page.

### Default

Most of the page should remain:

- black;
- dark neutral grey;
- white;
- muted grey.
add l
## Semantic Color

Use:

- Green → success, safe, added, valid, complete, positive path
- Amber/yellow → warning, edit, partial, attention, review
- Red/coral → failure, error, risk, removed, incorrect
- Blue/cyan → neutral technical accent, selected path, informational relationship
- Purple → secondary category when another categorical distinction is genuinely required

Do not use semantic colors simply because they look attractive.

## Color the Smallest Useful Element

Prefer this order:

`number → word → icon → line → border → badge → whole surface`

Example:

If `7.6` is the important failing value, color **7.6 red**.

Do not make the entire cell, row, or table red.

If a route is successful, a green connector may be enough.

Do not fill every node green.

## Color in Diagrams

Prefer color on:

- connection lines;
- small dots;
- icons;
- node labels;
- thin borders;
- small status indicators.

Avoid saturated full-node fills by default.

Strong node fills are appropriate only when:

- color is itself the primary category encoding;
- there are few nodes;
- the distinction materially helps comprehension.

Do not use:

`blue box → cyan box → purple box → yellow box → green box`

merely because the boxes represent different technologies.

Use neutral boxes and highlight the relationships instead.

## Color in Charts

Charts are an exception where larger areas of bright color are appropriate because the color represents actual data.

- Use stable colors for each series.
- Reuse the same mapping across related charts.
- Keep backgrounds and axes neutral.
- Use bright bars or lines against black.
- Do not change a series color between panels.
- Keep legends compact and close to the data.

Categorical color and semantic color are different.

Example:

A green bar may identify `XFS + VDO` as a series.

That does not automatically mean the result is “successful”.

Do not confuse category identity with status meaning.

## Color in Tables

Use color sparingly.

Good:

`WRONG-IMPL     7.6     1.4     2.6`

where only `7.6` is red because it is the important failure value.

Bad:

Coloring the entire row red.

Use color to direct attention to the exact evidence that matters.

## Status and Change Blocks

For sections such as:

`ADD`
`EDIT`
`REMOVE`
`WARNING`

Use a small semantic label and a thin matching accent.

Example:

`[ADD] Verify before you assert`

A thin green vertical line may connect related added content.

For edits, use amber.

For removals or failures, use red.

Keep the main content neutral.

Do not tint the entire section.

## Code Blocks

- Use a dark neutral surface slightly lighter than the canvas.
- Keep borders thin and subtle.
- Use modest radius.
- Use readable monospace text.
- Avoid unnecessary syntax rainbow coloring.
- Highlight only important lines or tokens when useful.
- Keep explanatory prose outside the code block.
- Code should support the explanation, not dominate the entire page.

## Callouts

Callouts should be rare.

Prefer:

`icon + short message + subtle semantic treatment`

Avoid:

`large rounded dark card + thick colored stripe + long paragraph`

If the entire message represents a warning or success state, a subtle tinted surface is acceptable.

Otherwise keep the surface neutral and use a small icon or accent.

## File References

File-reference chips should stay quiet.

Example:

`[JS] app.js · L361`

- Color only the file-type icon.
- Keep the filename and line number white or neutral.
- Use compact padding.
- Use modest radius.
- Avoid oversized generic document icons.
- Use recognizable file-type marks when possible:
  - JS → `JS`
  - MD → `MD`
  - HTML → `<>`
  - JSON → `{}`
  - SQL → database/query icon
  - Prisma → recognizable Prisma/schema symbol

- File colors are identification cues, not semantic status.

## Final Rule

Before adding color, a container, or a diagram element, ask:

1. What information does this communicate?
2. Would position, spacing, typography, or a line communicate it already?
3. Does the color encode actual meaning?
4. Is the relationship obvious without reading every label?
5. Is the visual easier to understand than the equivalent text?

If not, simplify it.

**Technical visuals should feel precise, dense, readable, and intentional — not colorful for the sake of looking designed.**

## 24. Footer Provenance

The footer is for generation provenance, not a repeat of document properties. Avoid ending with another list like `One file · offline-readable · no external deps`. Prefer a short muted line:

`Generated with muse-spark-1.2 through opencode · html-communicator · Design guided by DESIGN.md`

or `Built with muse-spark-1.2 · opencode · html-communicator`

If the harness/skill matters, include it once, quietly.

## Final Rule

For every visual element ask:

1. Does it improve understanding?
2. Does it establish meaningful hierarchy or state?
3. Does it enable a useful action?
4. Could spacing or typography do the same thing more quietly?

If the simpler solution works, use it.

**Make the important information obvious, not every piece of information visually interesting.**
