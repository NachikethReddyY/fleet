# Layout and Spacing

Use space to communicate grouping, support reading, and give each feature the
room its content requires. Available screen space is a constraint, not a target
to fill.

## Choose density deliberately

Start spacious, then remove space until the composition feels connected without
becoming cramped. Adding only enough space to fix visible crowding tends to
produce interfaces that remain busy.

Evaluate density in the context of the full interface. Generous spacing usually
improves clarity, but compact layouts are valid when the user's job depends on
seeing more information at once, such as an operational dashboard. Treat
density as a product decision rather than a default.

## Build nonlinear spacing and sizing scales

Use a constrained scale instead of adjusting values one pixel at a time. A
useful scale reflects relative change:

- Small values sit closer together because a few pixels noticeably affect an
  icon, control, or internal padding.
- Large values spread farther apart because the same pixel difference is barely
  visible in a container width or section gap.

As an initial heuristic, adjacent values should differ by roughly 25%; adjust
when typography, device density, or a real component proves another interval is
needed. Starting from a divisible base such as `16px` can make factors and
multiples easier to derive, but the resulting scale matters more than the base.

When testing a value, try its neighboring scale values before inventing a new
one. Add a token only when a recurring need is not represented. Record the
accepted scale in `DESIGN.md` and render it in `DESIGN.html`.

## Give content the width it needs

Do not stretch an element merely because the viewport is wide or another
element is full-width. Assign each section, form, card, and reading column the
width that best supports its content. Use a maximum width when growth would
make the element harder to scan or understand.

When a narrow element feels stranded inside a wide layout, use the remaining
space for genuinely supporting content or arrange the content into columns.
Keep the narrow element at its useful width instead of stretching it for visual
symmetry. Conversely, let content use more room when its task genuinely
requires it.

When a large canvas encourages unnecessary width, test the layout under a real
narrow constraint. For responsive web interfaces, an approximately `400px`
canvas is a useful early mobile test. Expand from the working narrow layout and
change only what the added space improves.

## Use grids selectively

Use grids to simplify alignment and repeated layout decisions, not to force
every element into fluid percentage widths. Choose each sizing behavior from
the content:

- Use fixed, minimum, or maximum widths when an element has a stable useful
  size.
- Use fluid width when the element should benefit from additional space.
- Let a flexible main region fill the remainder beside a content-sized sidebar.
- Use an internal grid where a component's children benefit from alignment.

A sidebar that scales as a fixed percentage can become wastefully wide on large
screens and unusably narrow on small screens. A card with a known optimal width
should keep that width until the viewport forces it to shrink. Do not make
components compromise earlier merely to remain on a global grid.

## Scale responsive properties independently

Relationships that work at one viewport may fail at another. Large elements
usually need to shrink faster than elements that are already small, so avoid
encoding every responsive relationship as one fixed ratio.

For example, `18px` body text and a `45px` heading may work on a large screen,
while `14px` body text may pair better with a `20–24px` heading on a small
screen than with the `35px` result of preserving a `2.5em` ratio.

Scale properties inside components independently as well. A larger button may
need disproportionately more padding, while a small button may need tighter
padding. Preserving identical proportions can make variants look zoomed rather
than intentionally sized.

## Adapt without losing context

Preserve recognizable content, control relationships, and task state through
window resizing, orientation changes, multitasking, text enlargement,
localization, and supported display configurations. Adapt composition when the
current arrangement no longer fits; do not reshuffle at arbitrary breakpoints
when the existing composition still works.

Treat viewport, viewing distance, and input as independent constraints. A wide
touchscreen and a wide pointer-driven desktop may need different density and
targets. Respect platform safe areas and persistent system regions. Test the
smallest and largest supported layouts with long content, large text, open
keyboards or panels, and interrupted tasks.

## Use proximity to show grouping

When borders or surfaces do not explicitly separate groups, spacing must reveal
which elements belong together. Keep less space within a group than around it.

Apply this rule in both axes:

- A label sits closer to its input than the next field group.
- A section heading sits closer to its section than the preceding section.
- Lines within one list item sit closer than separate list items.
- Horizontally arranged controls use internal gaps smaller than the space to
  neighboring groups.

Inspect ambiguous groupings before adding another border or background.
Correcting proximity often restores clarity with less visual noise.

## Review gate

Before completing a layout-and-spacing pass, verify:

1. Density supports the user's task and was chosen deliberately.
2. Spacing and sizes come from a constrained nonlinear scale.
3. Each element is only as wide as its content benefits from.
4. Fixed, constrained, and fluid widths match actual scaling needs.
5. Responsive sizes change independently where fixed ratios break down.
6. Space within each group is smaller than space between groups.
7. Narrow and wide layouts remain readable without avoidable overflow,
   truncation, or unused stretching.
8. Layout changes preserve content, controls, and task state across supported
   orientations, windows, inputs, text sizes, and locales.
9. `DESIGN.md` and `DESIGN.html` contain the same accepted layout tokens and
   rules.
