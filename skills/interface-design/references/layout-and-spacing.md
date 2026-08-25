# Layout and Spacing

Use space to show grouping and support the task. Available area is a constraint, not a target to fill.

## Density and scale

Choose density from the user's job. Start spacious, then tighten until related content feels connected. Compact layouts are valid when comparison or operational awareness depends on seeing more at once.

Use a constrained nonlinear scale: small values need close steps; large values need wider steps. Roughly 25% between adjacent values is a starting heuristic, not a rule. Test neighboring tokens before adding one; add only recurring, missing needs.

## Width and grid

Give each element the width its content benefits from. Use maximum widths for reading, forms, cards, or sections that become harder to scan when stretched. Use remaining room for genuinely supporting content rather than visual symmetry.

Place essential content early in reading order. Reveal secondary detail progressively only when a visible cue shows that more exists; required actions remain discoverable.

Choose sizing per region:

- fixed, minimum, or maximum width for a stable useful size;
- fluid width when extra space improves the content;
- flexible main area beside a content-sized sidebar;
- internal grids where repeated children benefit from alignment.

Global grids must not force components away from useful widths. Test a real narrow constraint early; around `400px` is a useful web starting point, not a universal breakpoint.

## Adaptation and grouping

Scale responsive properties independently. Large headings, small text, control padding, and layout gaps rarely preserve one ratio across every viewport.

Change composition when content no longer fits, not at arbitrary device labels. Preserve recognizable positions, relationships, content, controls, and task state through resizing, orientation, multitasking, localization, text enlargement, open keyboards, and supported inputs. Respect safe areas and persistent browser or system regions. Viewport, viewing distance, and input are separate constraints. On resizable desktop layouts, avoid placing the only critical control at a fragile bottom edge.

Proximity communicates grouping: space inside a group must be smaller than space between groups, on both axes. Fix ambiguous spacing before adding borders or backgrounds.

## Gate

- Density supports the task rather than a default aesthetic.
- Sizes use a bounded nonlinear scale with no unexplained one-offs.
- Each region is fixed, constrained, or fluid for a content-based reason.
- Responsive properties change independently where fixed ratios fail.
- Grouping remains obvious through proximity.
- Progressive disclosure keeps a visible cue and never hides required actions.
- Narrow and wide layouts avoid needless stretching, truncation, and overflow.
- Content, controls, and state survive supported contexts.
- `DESIGN.md` and `DESIGN.html` contain the same layout tokens and rules.
