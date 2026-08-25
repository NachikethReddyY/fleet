# Component Composition and States

Compose components around the user's job, the meaning of their content, and
the design system. Familiar patterns provide a behavioral contract; their
internal presentation can change when the task benefits and the contract
remains clear.

## Add character through existing semantics

Before adding standalone decoration, look for meaningful elements already in
the interface that can carry more visual character:

- replace generic list markers with restrained, content-relevant icons;
- treat quotation marks as part of a testimonial's composition;
- give links an intentional weight or underline treatment;
- express selected controls with the established accent system;
- use an edge, marker, or icon to strengthen a section's identity.

Choose one treatment that reinforces meaning and repeat it consistently.
Custom checkboxes, radio buttons, links, and list markers must retain their
semantic role, interaction states, keyboard behavior, and accessible name.
Follow [visual-hierarchy.md](visual-hierarchy.md) when the treatment changes
prominence and [color.md](color.md) for accent ownership and state contrast.

## Give decoration a job

An accent line, tinted surface, gradient, pattern, shape, or illustration
should reinforce a specific role such as section identity, grouping, state, or
brand personality. Define that role before choosing the treatment, then reuse
the same visual grammar wherever the role recurs.

Keep decoration behind content subordinate to the content. Patterns and
positioned graphics need restrained contrast, predictable crops, and responsive
placement that preserves reading. Gradients should behave as one coherent
surface rather than two competing colors. Decorative assets remain
non-interactive and outside the accessibility tree.

Use accepted system tokens and governed assets. Follow [color.md](color.md) for
surface and accent values and the imagery guidance in
[visual-hierarchy.md](visual-hierarchy.md) for contrast and cropping.

## Treat empty states as feature states

Design an empty state according to why content is absent:

- **First use:** explain the value of the feature and make the setup or creation
  action primary.
- **No results:** state which query or filters produced no match and keep the
  controls needed to broaden or clear them.
- **Content removed or completed:** confirm the condition and offer the next
  relevant destination or action.
- **Unavailable or unauthorized:** explain the constraint and provide a valid
  recovery or escalation path.
- **Failure:** distinguish an error from legitimate emptiness and provide a
  retry or recovery action when one exists.

Show only controls that can perform a useful action in the current state.
Preserve navigation or filtering needed to understand or recover from it. An
illustration may establish tone or direct attention, but the explanation and
next step carry the state.

Test empty states before relying on polished sample data. They are often the
user's first experience of a feature and must work at every supported viewport.
Follow [interaction-and-feedback.md](interaction-and-feedback.md) for loading,
progress, error recovery, undo, onboarding, and modal behavior around these
states.

## Choose the quietest sufficient separator

When two regions need distinction, choose the cue that best describes their
relationship:

1. Use proximity when separation means “different groups on the same plane.”
2. Use a surface change when regions have different roles or ownership.
3. Use a border when a persistent boundary, control edge, or precise alignment
   must remain visible.
4. Use a shadow when one surface is genuinely above another.

Combine cues only when one does not communicate the relationship under real
content and supported themes. Follow
[layout-and-spacing.md](layout-and-spacing.md) for proximity and
[depth-and-elevation.md](depth-and-elevation.md) for borders, shadows, and
surface layers.

## Recompose around the user's job

Treat a component name as a behavioral starting point rather than a fixed
visual arrangement. Change the composition when doing so improves scanning,
comparison, comprehension, or action:

- group a menu into labeled sections or columns when its option set has real
  categories;
- combine related table values when users read them together and do not need to
  sort, filter, resize, or address them independently;
- add supporting text or imagery to an option when it changes the user's
  decision;
- present important radio choices as selectable cards while preserving one
  mutually exclusive selection model.

Retain the pattern's expected semantics, keyboard behavior, focus order,
selection model, dismissal behavior, and responsive legibility. Novelty earns
its complexity only when it improves the task; a familiar composition remains
the default when both perform equally well.

When studying reference interfaces, identify the unexpected decision, the
constraint it solves, and whether that constraint exists in the current
product. Reuse the principle when it transfers; derive the final expression
from this product's personality and system.

## Review gate

Before completing a component-composition pass, verify:

1. Expressive treatments strengthen existing meaning rather than add an
   unrelated motif.
2. Custom controls preserve semantics, accessibility, and every interaction
   state.
3. Every accent or background treatment has a named role and system source.
4. Decoration remains subordinate under real content and responsive crops.
5. Every applicable empty-state cause has an explanation and useful next step.
6. Controls shown in an empty state can act in that state or help recovery.
7. Separators express grouping, boundaries, or elevation with the fewest
   sufficient cues.
8. Reworked components improve a specific user task while preserving their
   behavioral contract.
9. Reference designs contributed transferable decisions rather than copied
   surface styling.
10. `DESIGN.md` and `DESIGN.html` record and demonstrate the accepted component
    and state rules.
