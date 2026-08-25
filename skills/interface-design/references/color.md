# Color

Color gives an interface personality, communicates state, separates systems,
and supports hierarchy. Build a comprehensive but bounded palette from the
product's real uses instead of collecting attractive values in isolation.

## Assign roles before values

Inventory the jobs color must perform:

- neutral text, surfaces, borders, and controls;
- brand or primary actions;
- feature, navigation, subsystem, tenant, or data accents;
- interaction states such as hover, active, selected, and focus;
- semantic feedback such as success, warning, danger, and information;
- visualization categories when the product displays data.

Not every product needs every family. Each accepted family usually needs
several shades, however; a few unrelated colors cannot cover text, surfaces,
controls, and states coherently.

Give every family explicit ownership. When multiple accents exist, define which
part of the product uses each one, its allowed states, and where it must not be
used. Record that map in `DESIGN.md` and render it in `DESIGN.html`.

## Choose a useful color model

Hex and RGB encode output values directly but make relationships difficult to
reason about. Cylindrical models expose separate lightness, colorfulness, and
hue controls:

- HSL uses hue, saturation, and lightness. It is familiar and convenient for
  manually exploring related sRGB colors.
- OKLCH uses perceptual lightness, chroma, and hue. It is generally more useful
  when adjacent steps should appear evenly lighter, darker, or more colorful.

HSL lightness is not perceived lightness: yellow and blue can share the same HSL
lightness while appearing dramatically different. HSL hue angles are not
perceptually even either. Use HSL for quick intuitive adjustments when that fits
the project; prefer a perceptual space such as OKLCH when uniform visual steps
matter. Store colors in the notation the project's browser targets, tooling, and
token pipeline support.

Do not confuse HSL lightness with HSB/HSV brightness; their coordinates have
different meanings.

## Build bounded shade scales

Define fixed shades rather than generating one-off `lighten` or `darken`
results inside components.

For each primary or accent family:

1. Choose a base in a realistic high-value use, such as the main action.
2. Choose the darkest required shade in context, often foreground text or a
   strong state.
3. Choose the lightest required shade in context, often a subtle surface.
4. Fill the gaps with visually distinct steps.
5. Test every shade in its intended component and state.

Five shades may cover a limited family; broad systems often need closer to
eight or ten. A nine-step `100–900` scale is convenient but not mandatory.
Keep only steps with a defined role, and make adjacent choices different enough
that the system removes indecision.

### Build neutrals from the edges

Interfaces often use more neutrals than chromatic colors. Start with the darkest
foreground and lightest canvas the product needs, then fill the scale. Prefer a
very dark neutral and a subtle off-white when pure black or white feels too
harsh for the intended personality.

Neutrals may carry a small amount of color:

- blue or cyan produces a cooler family;
- yellow, orange, or red produces a warmer family.

Maintain the chosen temperature across the scale. Light and dark endpoints may
need more saturation or chroma to avoid looking washed out beside middle shades.

## Preserve character across light and dark shades

Changing only HSL lightness often drains intensity near the lightest and darkest
ends. Adjust saturation or chroma so the family still feels related. Small hue
shifts can also preserve perceived brightness and character—for example,
warming darker yellows toward orange—but keep shifts restrained enough that
the result still reads as one family.

Use the color space as a starting tool, then judge the scale visually. Hues have
different perceived brightness, surrounding colors change perception, and
mathematical regularity does not guarantee a balanced palette. Refine accepted
tokens rather than adding a new shade for every local mismatch.

## Use color to establish readable hierarchy

A primary, secondary, and tertiary text tone are usually enough on one neutral
surface:

- primary carries the main content;
- secondary supports or qualifies it;
- tertiary carries quiet metadata or low-priority information.

Secondary does not mean illegible. On a colored surface, choose a foreground
that belongs to the surface's family and provides the required contrast.
Explicit colors are more predictable than reduced opacity, especially over
images, patterns, or layered surfaces.

If light text requires a colored background so dark that it dominates the
composition, flip the relationship: use dark colored text on a light tinted
surface. For colored text on a colored surface, adjust perceptual lightness and
chroma first; use a restrained hue shift when it improves contrast without
breaking the family.

Follow the project's applicable accessibility target. Under WCAG 2.2 AA,
ordinary text requires at least `4.5:1` contrast and qualifying large text at
least `3:1`. Controls, focus indicators, graphics, and state boundaries have
their own requirements and must be verified in their actual contexts.

## Never rely on color alone

Color may reinforce meaning but cannot be its only carrier. Pair it with text,
icons, position, shape, pattern, line style, or another persistent cue. For
example:

- pair positive and negative trends with direction icons or signed values;
- distinguish chart series with labels, markers, patterns, or line styles;
- give links and states a cue that survives color-vision differences;
- combine semantic color with an icon and clear message.

Verify meaning in grayscale and with relevant color-vision simulations.

## Adapt roles across appearances

Treat light, dark, increased-contrast, and other supported appearances as
expressions of the same semantic roles, not mechanical inversions. Preserve
hierarchy and meaning while choosing values that work in each environment.
Dark surfaces may need restrained chroma, softer large bright regions, and
different borders or elevation cues; simply swapping black and white can create
glare or erase depth.

Prefer system or semantic colors when the target platform requires them to
respond to user settings. For project tokens, define an explicit value for
every supported mode and verify foregrounds, controls, imagery, translucency,
and focus states in context. A token name describes its role; the value may
change by mode.

## Compare and record colors in context

Judge colors against their actual neighbors, surfaces, content, themes, and
states. When two choices remain plausible, show both in the same realistic
component and ask the user to choose.

`DESIGN.md` records exact tokens, family ownership, roles, allowed uses,
pairings, states, accessibility results, and implementation sources.
`DESIGN.html` renders every accepted scale, accent family, pairing, theme, and
representative component. Both artifacts change together.

## Review gate

Before completing a color pass, verify:

1. Every token has a defined role and owner.
2. Neutral, primary, accent, semantic, and data families exist only when needed.
3. Each family has enough distinct shades for its accepted uses and no unused
   or one-off shades.
4. Light and dark shades preserve the intended family character.
5. Text, control, graphic, state, and focus contrast meet the project's target.
6. Colored surfaces use explicit, tested foregrounds.
7. Every multiple-accent system has an ownership, state, and exclusion map.
8. Meaning remains clear without color.
9. Relevant themes and color-vision conditions have been checked.
10. Supported appearances preserve semantic roles instead of using an untested
    inversion.
11. `DESIGN.md` and `DESIGN.html` contain the same color names, values,
    roles, pairings, and states.
