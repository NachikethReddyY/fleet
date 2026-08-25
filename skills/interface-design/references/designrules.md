# Design Rules: Earn Every Treatment

Models tend to converge on conspicuous design patterns: nested cards, pills,
badges, enormous titles, tiny supporting text, gradients, and decoration on
every surface. These patterns are not defects by themselves. They become
defects when repeated without a product-specific job.

Use **earned styling**: every visible treatment must improve hierarchy,
grouping, state, identity, comprehension, or action. Start with the product's
content and accepted `DESIGN.md`; add a treatment only when its job can be
named.

## Derive the visual language from the product

Establish the product's user, task, context, personality, and density before
choosing a fashionable visual language. Let those inputs determine whether the
interface is quiet or expressive, compact or spacious, flat or layered.

A dark canvas, glass surface, neon accent, gradient, oversized hero, dashboard
grid, or rounded-card system is one possible direction, not a neutral default.
Use it when it expresses the accepted personality and supports the task. Build
from existing brand and product evidence when it exists.

## Make every container earn its boundary

Begin sections on the shared canvas. Use spacing, alignment, and typography to
communicate structure before adding another rectangle.

A container earns its boundary when it represents at least one of:

- a selectable, draggable, expandable, or independently actionable unit;
- a group whose members must be understood together;
- a surface with distinct ownership, state, or elevation;
- content that needs a protective reading or interaction boundary.

One container can group several related elements. A separate card around every
paragraph, metric, form field, or list item fragments the composition. Nested
containers need distinct jobs at each level; parent and child should not repeat
the same background, border, radius, and shadow merely to create layers.

Follow [layout-and-spacing.md](layout-and-spacing.md) for grouping through
proximity and [depth-and-elevation.md](depth-and-elevation.md) when a surface
represents a real layer.

## Reserve capsules for compact semantics

Pills and badges work best when their shape helps identify a small, discrete
unit such as:

- status;
- tag or category;
- active filter;
- compact selection;
- short token with independent identity.

Render ordinary names, headings, descriptions, dates, counts, and metadata as
text unless they need that discrete identity or interaction. A colored capsule
does not make ordinary information more meaningful.

Buttons and navigation may use rounded or capsule geometry when the product's
shape system calls for it. Keep the geometry consistent with control size and
personality instead of turning every label into a pill. Follow
[component-composition-and-states.md](component-composition-and-states.md) for
semantic and interaction contracts.

## Keep the type hierarchy proportional

Anchor the scale in readable body and control text, then size headings for their
actual role, content length, and available space. A display title may be large
in an expressive landing or editorial moment; a title in a working interface
usually supports the task rather than occupying most of the viewport.

Create contrast with weight, line height, color, spacing, and placement before
pushing size differences to extremes. Supporting text remains comfortably
readable; it does not shrink to make a heading feel important. If the largest
text behaves like an illustration while essential small text becomes visual
texture, the scale has disconnected from the content.

Inspect the largest and smallest roles together at narrow and wide viewports.
The page title should leave the primary task visible in the initial composition
when immediate action matters. Follow [typography.md](typography.md) for scale,
measure, and responsive type decisions.

## Build hierarchy by reducing competition

Give each view one clear starting point and one primary action when the task has
one. Strengthen them first by quieting nearby elements: reduce redundant copy,
soften secondary contrast, simplify surrounding surfaces, or add space.

Eyebrows, kickers, helper text, repeated metadata, and icons earn their place by
adding information unavailable in the adjacent heading or control. Repeating
the same meaning in several visual forms creates noise rather than hierarchy.
Follow [visual-hierarchy.md](visual-hierarchy.md) for prominence and action
priority.

## Give decoration and icons explicit roles

Use gradients, glows, patterns, illustrations, oversized shapes, accent lines,
and background effects to express a named brand, grouping, state, or narrative
role. Keep one dominant motif and let quieter elements support it. Empty space
is valid and does not require decoration.

Use an icon when its symbol is recognizable, improves scanning, clarifies an
action, or reinforces meaning. Headings and list items can remain typographic
when an icon adds no new signal. Keep one coherent icon family and optical
weight. Follow [icons.md](icons.md) for metaphor, family, size, target, state,
label, accessibility, and right-to-left decisions.

Decoration behind content stays subordinate and preserves text contrast. Follow
[color.md](color.md) for accent ownership and the imagery section in
[visual-hierarchy.md](visual-hierarchy.md) for background and crop behavior.

## Choose patterns from real content

Add cards, statistic panels, tabs, sidebars, timelines, charts, or diagrams only
when the information has the relationship that pattern represents. A sequence
may need a flow; repeated exact fields may need a table; a small set of facts
may need only text.

Avoid turning content into a component inventory. The interface is complete
when the user's job is clear and usable, even if it contains fewer visual
patterns than a showcase. Follow
[component-composition-and-states.md](component-composition-and-states.md) when
reworking a familiar component around content.

## Limit simultaneous signals

Border, fill, radius, shadow, icon, accent, badge, and motion are separate
signals. Combine them only when each communicates a different necessary fact.
For example, a selected control may need a surface and focus indicator; it does
not automatically need a gradient, shadow, icon, badge, and animation as well.

Prefer one dominant cue with the smallest supporting cue required for
accessibility or interaction. Repetition turns emphasis into texture and makes
the truly important state harder to see.

## Restraint audit

Before accepting a styled interface, inspect the complete composition rather
than isolated components:

1. **Rectangle audit:** remove each border, background, radius, and shadow in
   turn. Restore only those whose grouping, interaction, ownership, or layer
   becomes unclear.
2. **Capsule audit:** classify every pill or badge as status, identity,
   selection, filter, or action. Render unclassified items as ordinary text.
3. **Type audit:** compare the largest heading, body, controls, labels, and
   metadata together at narrow and wide sizes. Bring disconnected extremes
   back into one readable scale.
4. **Decoration audit:** name the role of every gradient, glow, pattern, shape,
   and illustration. Remove treatments with no role or repeated role.
5. **Icon audit:** remove icons that merely repeat adjacent text or decorate a
   heading. Keep icons that improve recognition, scanning, or action.
6. **Pattern audit:** verify that every card, tab set, sidebar, chart, and
   diagram matches a real content or interaction relationship.
7. **Signal audit:** simplify elements carrying several simultaneous emphasis
   cues until each remaining cue has a distinct job.
8. **Deletion pass:** compare the simplified composition with the original.
   Keep the quieter version whenever meaning and usability are unchanged.

The audit passes when every remaining treatment has a named job, the intended
primary content is obvious, supporting content stays readable, and removing
anything else would reduce understanding or usability.
