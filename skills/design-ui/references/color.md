# Color

Build color from product roles, not isolated attractive values.

## Roles and ownership

Inventory only needed families: neutral text and surfaces, brand or primary action, feature or data accents, interaction states, and semantic feedback. Give every family an owner, allowed uses, states, and exclusions. Multiple accents need an explicit usage map.

Reserve accent color for meaningful emphasis, selection, status, or primary action. When content or data is already colorful, keep surrounding controls quieter. Use each semantic color consistently and consider cultural interpretation before assigning meaning.

Create fixed shade scales instead of component-level `lighten` or `darken` values:

1. Choose a base in its highest-value real use.
2. Choose required dark and light endpoints in context.
3. Add visually distinct intermediate steps.
4. Keep only shades with named roles.

A limited family may need about five shades; a broad system may need eight to ten. The count follows roles, not a mandatory `100–900` convention.

Build neutrals from the darkest foreground and lightest canvas. A subtle warm or cool bias may support personality; keep its temperature coherent across the scale.

## Model and perception

HSL is convenient for manual sRGB exploration. OKLCH is better when perceptually even lightness and chroma steps matter. HSL lightness is not perceived lightness, and HSL differs from HSB/HSV. Use notation supported by project tooling and browser targets.

Mathematical regularity is only a start. Adjust chroma, saturation, or restrained hue shifts so light and dark steps retain family character. Judge tokens against actual neighboring surfaces and content.

## Hierarchy and access

Primary, secondary, and tertiary text tones usually cover one neutral surface. Secondary remains comfortably readable. Prefer explicit foreground tokens over opacity on colored, layered, or image surfaces.

If light text forces a colored surface to become visually dominant, consider dark colored text on a light tint. Adjust perceptual lightness and chroma before shifting hue.

Meet the project's accessibility target in the rendered context. Under WCAG 2.2 AA, ordinary text needs at least `4.5:1` contrast and qualifying large text `3:1`; controls, graphics, boundaries, and focus indicators have separate requirements.

Color reinforces meaning but never carries it alone. Add text, icon, position, shape, pattern, marker, or line style. Verify grayscale and relevant color-vision conditions.

Treat light, dark, and increased-contrast appearances as values for the same semantic roles, not mechanical inversions. Define each supported mode explicitly and test content, controls, focus, imagery, and translucency in context. Prefer platform semantic colors when the target expects them to respond to system settings.

## Gate

- Every token has a role, owner, and real use; no one-off or unused shades remain.
- Families contain enough distinct steps for their jobs and preserve character at both ends.
- Foregrounds, controls, graphics, states, and focus meet the chosen contrast target.
- Multiple accents have clear ownership, state, and exclusion rules.
- Accent remains scarce enough to signal meaning, and semantic color remains culturally appropriate.
- Meaning survives without color and under supported color-vision conditions.
- Every supported appearance preserves semantic roles.
- `DESIGN.md` and `DESIGN.html` contain identical names, values, roles, pairings, and states.
