# Typography

Typography sets voice, hierarchy, density, and reading rhythm. Build one small system for real content.

## Scale and roles

Use a constrained nonlinear scale: small sizes need close steps; display sizes can spread farther apart. Ratios are starting tools, not requirements. Round deliberately and add a size only when a recurring role needs it.

Each token defines family, size, line height, weight, optional tracking, use, and responsive behavior. Prefer `px` or `rem`; nested `em` sizes can drift outside the scale. Render every role at actual size in `DESIGN.html`.

## Typeface and reading

Choose personality after legibility. A system or neutral sans-serif stack is a safe interface starting point. Body and control faces need clear small-size forms, useful x-height, comfortable spacing, and real supplied weights instead of synthetic styles. Avoid light weights for small text. Condensed or display faces usually belong to short headings. Evaluate candidates in the product's languages, content, and actual viewing distance.

Fit layout to reading. Paragraphs often work around 45–75 characters per line; `20–35em` is a useful web starting range. Longer lines and smaller text usually need more line height; large headings need less. `1.5` is only a body-text starting point. Judge real wraps.

Align mixed sizes on typographic baselines. Match paragraph alignment to language direction. Center only short independent text, right-align comparable numbers, and use tabular numerals when available. Justification requires language-aware hyphenation and inspection for gaps.

## Adaptation and links

Text must scale, zoom, reflow, localize, and support right-to-left content without clipping, overlap, missing controls, or forced horizontal reading. Preserve essential meaning before shortening secondary copy. Test long names, translations, dates, and numbers.

Keep terminology, capitalization, and tone consistent. Lead control labels with a clear action where useful; errors name the problem and concrete correction without blame.

Prose links need a persistent non-color cue. Navigation may use quieter treatments, but hover cannot be the only sign of interactivity.

Keep default letter spacing unless a specific role benefits: large headings may tighten slightly; all caps often need more space. Choose a typeface suited to the reading size instead of repairing it with tracking.

## Gate

- Every style maps to one named role and computed sizes stay on the scale.
- Families supply readable glyphs and required real weights.
- Measure and line height work across actual content and viewports.
- Baselines and alignment support scanning and language direction.
- Links remain identifiable across pointer, touch, and keyboard use.
- Tracking overrides have a named purpose.
- Scaling, zoom, localization, and right-to-left reflow preserve meaning and controls.
- `DESIGN.md` and `DESIGN.html` contain identical type tokens.
