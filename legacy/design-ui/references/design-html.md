# Authoring DESIGN.html

`DESIGN.html` is one project's rendered visual reference. It demonstrates accepted decisions; temporary comparison HTML holds proposed alternatives.

Start from [../assets/DESIGN.html](../assets/DESIGN.html). Its comments define slots, not defaults.

## Derive before rendering

Read `DESIGN.md`, implemented tokens and components, and relevant assets. Accepted `DESIGN.md` decisions are authoritative. Resolve material conflicts from project evidence or ask the user; then update both canonical artifacts.

Use project terminology, representative content, and accepted styling throughout the document itself. Remove template colors, fonts, radii, copy, and generic components. Prefer exported tokens or shared styles; otherwise reproduce exact values and note their source. Never create a silent second token system.

Identify supported contexts that change design: platform, viewport, viewing distance, input, theme, text scale, and accessibility settings. Width does not determine input; demonstrate touch, pointer, focus, hover, or density differences where relevant.

## Required specimens

Render only systems the project has accepted, but render each included system completely:

- **Color:** every token, exact value, family step, role, allowed use, pairing, state, theme, and contrast constraint. Multiple accents need ownership, state, overlap, and exclusion maps.
- **Typography:** actual families and fallbacks; every role at real size with weight, line height, tracking, measure, and responsive behavior.
- **Spacing and layout:** tokens at visible scale, widths, grids, fixed and fluid regions, density, breakpoints, and narrow/wide examples.
- **Shape and depth:** borders, radii, light model, shadow layers, elevation, stacking, overlap, and owned surfaces.
- **Components:** real variants, content, target sizes, semantics, interactions, and applicable default, hover, focus, active, selected, disabled, loading, empty, failure, and success states.
- **Behavior:** voice, labels, feedback, progress, recovery, undo, modality, motion, and complete loops where defined.
- **Icons and assets:** governed sources, metaphors, sizes, targets, labels, optical variants, states, accessibility, localization, crop, focal point, contrast, fallback, and target-size behavior.
- **Adaptation and access:** semantic order, keyboard focus, scaling or zoom, non-color cues, reduced motion, supported themes, inputs, and representative constrained contexts.

Do not invent components to fill the document. Keep rationale in `DESIGN.md`; use `DESIGN.html` for visual recognition, usage, and comparison. Trace consequential specimens to a token, component, source path, or `DESIGN.md` heading.

## Gate

- No template styling, sample copy, or unresolved alternative appears as accepted.
- Every specimen comes from `DESIGN.md` or verified project evidence.
- Included systems are complete enough that another agent need not guess names, values, roles, states, or ownership.
- Real content, narrow and wide layouts, supported inputs, focus, recovery, and non-color meaning are visible.
- Colors, type, icons, imagery, and components appear at realistic sizes and contexts.
- Names, values, and roles match `DESIGN.md` exactly; unresolved gaps stay labeled.
- File remains local unless the user asks to publish it.
