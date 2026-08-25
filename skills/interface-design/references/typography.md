# Typography

Typography establishes voice, hierarchy, density, and reading rhythm. Define a
small system that covers the interface's actual content instead of choosing a
new font size or treatment for each component.

## Establish a type scale

Use a constrained, nonlinear scale. Small sizes need close steps because a
`2px` change is conspicuous; large display sizes can use wider steps because
similar differences are barely visible.

A modular ratio can provide starting values, but it is not a requirement.
Round fractional results deliberately and add practical intermediate sizes when
an interface needs them. Hand-crafted scales are often better for product UI
because they avoid subpixel values and can cover dense labels, body text,
section titles, and display text without arbitrary gaps.

Define each type token as a complete role:

- font family;
- size;
- line height;
- weight;
- letter spacing when needed;
- intended use;
- responsive behavior.

Use `px` or `rem` for scale tokens. Avoid nested `em` font sizes because
their computed values can drift outside the scale. Record every accepted size
from the smallest label to the largest display text in `DESIGN.md`, and render
the same scale at actual size in `DESIGN.html`.

## Let text scale, reflow, and localize

Treat user-selected text enlargement and browser zoom as supported layout
conditions. Important text must grow and reflow without clipping, overlap,
missing controls, or forced horizontal reading. Reduce columns, stack related
content, or allow more height before truncating meaningful copy. Meaningful
icons that function as part of a text role should scale in step with that role.

Test realistic translations, long names, formatted dates and numbers, and
right-to-left content. Do not encode meaning through line breaks or a fixed
string length. When space is constrained, preserve the information required to
understand and act before shortening secondary copy.

## Choose typefaces for their job

A neutral sans serif or the system font stack is a safe starting point for
interface text:

```css
font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
  "Noto Sans", Ubuntu, Cantarell, "Helvetica Neue", Arial, sans-serif;
```

Choose personality only after confirming legibility. Body and control text need
clear letterforms, a useful x-height, and comfortable spacing at small sizes.
Condensed or display faces usually belong in short headings rather than primary
interface text.

Confirm that the family supplies the weights and styles the system uses instead
of relying on synthetic bold or italics. Families with several well-made
weights are a useful discovery filter, not proof of quality. Popular fonts and
type choices from respected products can narrow the search, but evaluate them
in the product's own language, content, and interface.

## Control text measure

Fit the layout to reading rather than stretching prose to fill its container.
For paragraphs, target roughly 45–75 characters per line; `20–35em` is a useful
starting range on the web. Wider media or components may share the content area
without forcing paragraphs to use their full width.

Follow [layout-and-spacing.md](layout-and-spacing.md) when text measure changes
the content column or responsive layout.

## Tune line height to size and measure

Line height must help the eye find the next line:

- Longer lines generally need more line height.
- Small text generally needs more line height relative to its size.
- Large headings generally need tighter line height.

`1.5` is a useful body-text starting point, not a universal value. Wide prose
may need more, while large single- or two-line headings may approach `1`.
Inspect real wrapped content before accepting a token.

## Align text by how it is read

Align mixed font sizes on their typographic baseline when they share a row.
Visual centering often leaves their baselines awkwardly offset.

Match paragraph alignment to the language direction. Center short headings or
independent text blocks, not prose that regularly exceeds two or three lines.
Right-align numbers in tables so magnitudes and decimals are easy to compare;
use tabular numerals when the typeface supports them.

Justified text can suit a formal direction, but enable language-appropriate
hyphenation and inspect the result for distracting word gaps.

## Style links for their context

Links inside prose need a persistent non-color cue or another unmistakable
clickable treatment. In navigation or link-heavy interfaces, use quieter weight,
contrast, or underline treatments so every link does not compete equally.

Ancillary links may strengthen on hover or focus, but hover alone cannot be
their only discoverability cue. Follow [color.md](color.md) and
[visual-hierarchy.md](visual-hierarchy.md) when link treatment affects color or
action priority.

## Adjust letter spacing sparingly

Trust the typeface's default spacing unless a specific context benefits from a
change:

- Large headings set in a body-oriented face may tolerate slightly tighter
  spacing.
- All-caps text often needs wider spacing because its letter shapes are less
  varied.

Avoid trying to repair a display face for small text by opening its spacing.
Choose a face designed for the size and reading task.

## Review gate

Before completing a typography pass, verify:

1. Every text style maps to a named role in one constrained scale.
2. Computed font sizes remain on the scale.
3. Typeface families provide the required real weights and readable glyphs.
4. Paragraphs stay near the intended measure across relevant viewports.
5. Line height responds to both size and line length.
6. Mixed sizes align by baseline where appropriate.
7. Alignment supports language direction and scanning behavior.
8. Links remain identifiable in pointer, keyboard, and touch contexts.
9. Letter-spacing overrides have a specific purpose.
10. Text scaling, zoom, localization, and right-to-left content reflow without
    losing essential meaning or controls.
11. `DESIGN.md` and `DESIGN.html` contain and display the same type tokens.
