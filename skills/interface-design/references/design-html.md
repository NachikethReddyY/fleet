# Authoring DESIGN.html

`DESIGN.html` is the rendered visual source of truth for one project. A person
or agent should be able to open it and understand how that product looks, which
tokens and accents exist, where each is used, and how recurring components
behave. It is not a generic style guide, an inspirational mockup, or a theme
supplied by this skill.

Use a separate temporary HTML file to compare proposed directions before user
approval. `DESIGN.html` is canonical: it demonstrates the accepted direction,
not a gallery of competing options.

Start from [../assets/DESIGN.html](../assets/DESIGN.html). Its comments define
the information slots; its empty structure does not authorize invented
decisions.

## Derive before rendering

Read the project's `DESIGN.md`, implemented interface, token files, component
styles, and relevant assets. Resolve conflicts before authoring the visual
reference:

1. Treat accepted `DESIGN.md` decisions as authoritative.
2. Verify that implemented tokens and components match those decisions.
3. Ask the user about a material gap or conflict that cannot be resolved from
   project evidence.
4. Update `DESIGN.md` and `DESIGN.html` together after the intended decision
   is known.

Use the project's actual terminology and representative content. A finance
product, developer tool, and children's application should not receive the same
sample copy, density, palette, or component inventory.

## Make the document demonstrate the product

The reference's own canvas, typography, spacing, navigation, and controls
should use the project's accepted system. Do not retain template colors,
generic card styling, arbitrary radii, or unrelated font choices.

Render the supported contexts that materially affect the interface: platform,
viewport or window range, viewing distance, input methods, session shape, and
accessibility settings. Do not imply that width determines input. A project
that supports both touch and pointer must demonstrate both where their target,
focus, hover, or density behavior differs.

Prefer the project's exported tokens or shared styles when that keeps the
reference accurate and usable in its intended environment. Otherwise reproduce
the accepted values inside the document and state their implementation source
in comments. Do not silently create a second token system.

## Render the complete color system

Color coverage must answer both “what exists?” and “where is it used?”

### Palette

Render every accepted color token with:

- token name and exact value;
- visual swatch;
- family position or shade step;
- role and allowed uses;
- foreground or background pairing;
- interaction or semantic states;
- source file or decision when useful.

Group tokens by the project's real model, such as neutral, brand, accent,
semantic, data visualization, or subsystem palettes. Do not force those groups
onto a project that does not use them. State the working color space,
production notation, supported gamut, and themes or modes.

### Accent map

When the product uses multiple accents, give each accent family a separate
specimen and usage map. State which navigation area, feature, data category,
tenant, state, or component owns it. Show its relevant default, hover, active,
selected, subtle-surface, border, focus, and foreground variants.

Explicitly state overlaps and exclusions. An agent should never need to guess
whether two accents are interchangeable or whether one is reserved for a
specific part of the product.

### Pairings and contrast

Show text, icons, borders, and controls on the surfaces where they actually
appear. Include every supported theme or mode. Record verified contrast or
other accessibility constraints, and preserve a non-color cue for meaning.

## Render every other accepted system

Include only systems the project has decided, but render each included system
completely:

- **Typography:** actual families and fallbacks, every role from the smallest
  text to the largest display size, line height, weight, tracking, measure, and
  responsive changes.
- **Spacing and sizing:** every accepted token at visible scale plus typical
  uses.
- **Layout:** content widths, grids, fixed and fluid regions, density,
  breakpoints, and representative narrow and wide behavior.
- **Shape and depth:** light direction, borders, radii, shadow layers, elevation
  levels, overlaps, stacking relationships, owned surfaces, and permitted uses.
- **Components:** real variants and every applicable state, using realistic
  content and production token names. Demonstrate the semantic and interaction
  contract of recomposed controls and the useful actions available in each
  empty or failure state.
- **Content and behavior:** voice, labels, empty/loading/error/success patterns,
  feedback, progress, recovery, undo, modality, motion, and interaction rules
  when defined. Demonstrate complete loops rather than only ideal end states.
- **Icons:** governed families or categories, source names, metaphors, glyph
  sizes, target boundaries, icon-and-label rules, optical variants, interaction
  and selection states, accessible names, and localization or RTL behavior.
- **Other assets:** governed marks, photographs, illustrations, screenshots,
  uploads, or data-visualization styles at their target sizes. Show applicable
  crop and focal-point behavior, text contrast, responsive treatment, boundary
  handling, fallbacks, and accessible roles.
- **Accessibility and adaptation:** semantic order, keyboard focus, supported
  target sizes, text scaling or zoom, non-color cues, reduced motion, alternate
  perception, representative narrow and wide behavior, and every supported
  theme or mode. Demonstrate evidence instead of merely claiming compliance.

Do not create components solely to fill the document. The reference describes
the product's system; it does not expand product scope.

## Keep decisions traceable

For consequential or easily confused decisions, identify the corresponding
`DESIGN.md` heading, token name, component, or source path. Keep rationale in
`DESIGN.md`; keep `DESIGN.html` focused on visual recognition, usage, and
comparison.

The two artifacts must use identical names and values. A renamed token, new
accent, changed type role, or altered component state requires both files to be
updated in the same change.

## Verification gate

Before accepting `DESIGN.html`, verify:

1. No template palette, font, copy, radius, or component treatment remains.
2. Every rendered decision is supported by `DESIGN.md` or project evidence.
3. Every color token is visible with its value, role, and supported pairing.
4. Every accent has an explicit ownership and state map.
5. The complete type scale is rendered at its actual sizes.
6. Relevant layout, spacing, shape, component, behavior, and asset systems are
   represented.
7. Supported platform, viewing, window, and input contexts are identified.
8. Narrow and wide layouts work without hiding required reference content or
   losing task state.
9. Interactive specimens expose complete feedback, recovery, keyboard focus,
   and applicable states.
10. Icon specimens show governed sources, actual glyph and target sizes, label
    rules, states, and accessibility behavior.
11. Meaning remains understandable without color, motion, audio, or haptics
    alone.
12. Names, values, and roles match `DESIGN.md` exactly.
13. Proposed alternatives do not appear as accepted system decisions;
    unavoidable unresolved gaps remain explicitly labeled rather than guessed.
14. The file remains local unless the user explicitly asks to publish it.
15. Governed imagery is demonstrated at realistic target sizes and with its
    applicable crop, contrast, fallback, and accessibility behavior.
