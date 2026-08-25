# Depth and Elevation

Depth communicates which surfaces are raised, inset, overlapping, or
temporarily closer to the user. Use it to explain structure and interaction,
not as decoration.

## Establish one light model

Choose a consistent light direction before designing borders and shadows. Light
from above is a familiar default:

- upward-facing edges appear lighter;
- downward-facing edges appear darker;
- raised objects cast shadow below or away from the source;
- inset objects receive shadow along the edge that blocks the source.

The cues matter more than realism. Use the smallest combination that makes the
surface relationship clear.

### Raised surfaces

To make a control or surface feel slightly raised:

1. Give the light-facing edge a restrained highlight.
2. Add a compact shadow on the opposite side to show occlusion.
3. Keep the shadow close and relatively sharp at low elevation.

Use an explicit palette token for the highlighted edge when an alpha overlay
would wash out the underlying color. Follow [color.md](color.md) for shade and
contrast decisions.

### Inset surfaces

Reverse the edge cues for a recessed well, field, or control:

1. Place a restrained inner shadow along the edge that blocks the light.
2. Lighten the opposite lip.
3. Confine both cues inside the surface.

Inputs and checkboxes may use this treatment when the product intends them to
feel recessed. It is not a default requirement for every control.

## Define a bounded elevation system

Create a small set of named levels instead of tuning a new shadow for each
component. Three to five levels often cover:

- base content;
- subtly raised controls or cards;
- menus, popovers, or dragged items;
- dialogs or other blocking surfaces.

Map each level to owned surfaces and a stacking relationship. The system should
answer “where does this element sit?” before it answers “which shadow looks
good?”

Lower levels generally use smaller, tighter shadows. Higher levels use broader,
softer cast shadows because the surface appears farther from the plane. Match
visual elevation to actual stacking order and hierarchy; follow
[visual-hierarchy.md](visual-hierarchy.md) for attention priority.

## Give each shadow layer one job

A layered shadow offers more control than one overloaded shadow:

- A broad, soft cast shadow represents direct light blocked behind the object.
- A tight, darker contact shadow represents the area near the edge that
  receives little ambient light.

As elevation increases, soften or remove the contact shadow because the object
is no longer close to the surface. Keep the broad cast shadow subtle enough that
it communicates distance without becoming a halo.

Do not add layers that have no distinct physical or structural role.

## Connect elevation to interaction

Depth can explain state changes:

- A draggable item may rise above its siblings while grabbed.
- A pressed control may move toward the plane by reducing its shadow.
- An opening menu or dialog may enter at the elevation it owns.

The transition must agree with both the visual cue and actual interaction.
Preserve keyboard focus and reduced-motion behavior. A static element should
not appear draggable or pressable merely because it has a shadow.

## Create depth without blur

Flat visual systems can still represent layers:

- A lighter surface may appear above a darker base; a darker surface may feel
  inset.
- A short solid offset can separate a control or card from its plane.
- Borders and surface changes can distinguish layers without gradients.
- Overlap can show that one element crosses in front of another.

Color relationships must remain consistent with the project's theme; follow
[color.md](color.md). Flat depth still needs a bounded elevation meaning rather
than arbitrary lighter and darker surfaces.

## Use overlap deliberately

Overlap establishes an unambiguous front-to-back relationship. Use it when that
relationship improves composition or explains ownership, such as a card crossing
two sections or controls sitting above a carousel.

Protect readability and hit targets:

- preserve the intended stacking and clipping behavior at every viewport;
- keep overlapped content from hiding required information;
- add a separator matching the underlying surface when adjacent images or
  shapes visually clash;
- verify that responsive reflow does not reverse the layer relationship.

Follow [layout-and-spacing.md](layout-and-spacing.md) when overlap changes
width, spacing, or responsive structure.

## Keep depth restrained

Physical cues are a model, not a photorealism target. Excess edge highlights,
large blurs, nested shadows, and too many elevation levels make the interface
busy and weaken hierarchy. Remove any cue that does not clarify surface,
stacking, or interaction.

## Review gate

Before completing a depth-and-elevation pass, verify:

1. One consistent light or flat-depth model governs the interface.
2. Raised and inset cues point in opposite, physically coherent directions.
3. Every elevation level has a name, owned surfaces, and stacking meaning.
4. Shadow size and softness increase coherently with perceived distance.
5. Each shadow layer performs one identifiable job.
6. Interaction changes move surfaces along the intended z-axis.
7. Elevation matches hierarchy and actual stacking order.
8. Overlap remains clear, readable, and responsive.
9. Reduced-motion and keyboard states remain understandable.
10. `DESIGN.md` and `DESIGN.html` contain and demonstrate the same depth
    system.
