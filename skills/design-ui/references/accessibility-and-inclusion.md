# Accessibility and Inclusion

Design complete tasks that people can perceive, understand, and operate through different abilities, languages, settings, and inputs.

## Content and perception

Use plain, respectful language and credible representation. Avoid unnecessary demographic assumptions and culture-bound metaphors. Prepare content for translation, longer strings, local formats, and right-to-left reading.

Essential meaning needs more than one cue: pair color, sound, motion, position, shape, or haptics with text, labels, icons, patterns, or another persistent mode. Keep visible order, semantic order, headings, labels, and landmarks aligned.

Classify images as informative, functional, or decorative. Provide equivalent descriptions or action names for the first two; exclude decoration. Keep essential text and controls out of images.

## Operation

Prefer native semantics and familiar controls. Every interactive element has a meaningful role, name, state, and value. Keep focus visible, ordered, and untrapped.

Choose target size and separation for the actual platform and input; glyph size is separate. Apple point targets are Apple-platform guidance, not universal CSS values. Test keyboard, touch, pointer, voice, switch, and directional focus paths that the product supports.

Provide simple alternatives to complex gestures, precision, timing, speech, hearing, or multi-pointer requirements. Avoid time limits where possible; otherwise warn and support extension or recovery. Preserve valid input through errors.

Provide captions, transcripts, and controls for meaningful media. Avoid flashing and sustained rapid animation; let users pause motion or follow reduced-motion preferences.

## Adaptation and understanding

Text and controls must survive scaling, browser zoom, localization, narrow widths, theme changes, and increased contrast without clipping, overlap, lost controls, or forced horizontal reading.

Use direct labels, stable navigation, nearby errors, nonblaming copy, and explicit recovery. Respect reduced motion; replace disorienting movement with a calmer transition or immediate state change.

Test combinations, not isolated components: large text at narrow width, keyboard plus visible focus, screen-reader names/order/states, reduced motion, high contrast, dark mode, color-vision differences, translated or right-to-left content, real target sizes, slow loading, denial, failure, and interruption.

## Gate

- No essential meaning depends on one sense, input, language, or assumed ability.
- Semantics, names, order, state, value, and focus match the visible interface.
- Scaling, zoom, localization, and constrained layouts preserve meaning and controls.
- Targets and spacing fit each supported input.
- Essential tasks work with keyboard and relevant assistive inputs.
- Motion and time constraints have safe alternatives.
- Copy, examples, and representation avoid unnecessary exclusion.
- Complete flows were tested under combined accessibility conditions.
- Requirements and evidence are recorded in `DESIGN.md` and demonstrated where useful in `DESIGN.html`.
