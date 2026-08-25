# Platform and Input Adaptation

Design for the conditions in which a feature is used, not for a device label
alone. Determine viewport, viewing distance, posture, session length, input
precision, environmental constraints, and whether people commonly multitask.
Keep the product's purpose and mental model stable while adapting composition
and interaction.

## Record the context first

For every supported context, record:

- typical and extreme viewport or window sizes;
- viewing distance and whether the device is held, worn, stationary, or
  shared;
- primary and alternative input methods;
- likely session length and interruption pattern;
- orientation, resizing, multitasking, theme, text-scaling, and localization
  changes;
- capabilities the feature actually requires.

Never infer an input method from screen width. A narrow viewport may have a
keyboard and pointer; a large display may be touch-driven. Use capability and
interaction evidence.

## Mobile and handheld touch

Prioritize the primary task and content on a constrained display. Keep the
controls required for the current step visible and move secondary actions into
an easy-to-reach, discoverable location. Do not make essential behavior depend
on hover or pointer precision.

Place frequent controls where they can be reached comfortably without
obscuring content. Support familiar navigation and gestures, but provide a
visible or otherwise accessible path for essential actions. Expect rotation,
virtual keyboards, text enlargement, dark mode, interruptions, and short or
extended sessions.

Request device or personal information only with permission and only when it
reduces genuine effort or enables the feature.

## Tablet and hybrid input

Use the larger canvas to expose content, context, and parallel work rather than
simply enlarging a phone layout. Avoid unnecessary full-screen transitions and
modal steps. Let windows, split views, orientation, and multitasking change the
composition without destroying task state.

Assume touch, stylus, hardware keyboard, pointer, and voice may be used
separately or together. Size and density must account for both viewing distance
and active input. Pointer support supplements touch; it does not replace
comfortable touch targets or visible affordances.

## Desktop and resizable windows

Use space to reveal useful context, commands, and simultaneous content with
fewer nested levels, while keeping reading measures and control density
comfortable. Support window resizing, multiple windows or displays, and
restoration of meaningful task state.

Design for pointer precision and efficient keyboard use. Provide a logical
focus order, keyboard access to every essential action, and shortcuts for
frequent commands without making shortcuts the only route. Hover can provide
reinforcement or previews, never the sole cue for an available action.

Respect desktop expectations for menus, selection, context actions, drag and
drop, and personalization when they apply. Do not force a mobile interaction
model into a precision-input environment.

## Responsive web

Apple publishes platform guidance for its operating systems, not a standalone
general-web HIG. For web interfaces, apply the transferable guidance as an
explicit synthesis:

- adapt to available space and capabilities rather than user-agent labels;
- support touch, pointer, keyboard, zoom, text scaling, and assistive
  technology together;
- preserve content, task state, and recognizable control placement through
  resizing and orientation changes;
- use familiar web semantics and browser behavior;
- keep hover, gestures, drag and drop, and keyboard shortcuts as enhancements
  unless an equivalent route exists;
- test narrow touch layouts, wide precision-input layouts, and intermediate
  hybrid conditions.

Do not call this an Apple web standard. Record which rules come from project
requirements, web conventions, and cross-platform HIG principles.

## Glanceable and wearable contexts

Prioritize critical information that can be understood quickly and one or two
high-value actions that can be completed with minimal interaction. Keep
hierarchy shallow, make scrolling predictable, and assume people may be moving
or unable to give full attention.

Use timely, relevant information rather than packing a small display with the
desktop product. Make the experience useful on its own when independence is a
product requirement.

## Distant and shared displays

Design for legibility across a room and for remote or directional focus rather
than direct touch. The current focus position and possible next movement must
be unmistakable. Keep important content away from unsafe display edges, make
sign-in and profile switching reasonable for shared use, and avoid dense text
or subtle controls that require close inspection.

Large imagery, restrained motion, and audio can support immersion, but they
must not obscure navigation or feedback.

## Spatial and immersive contexts

Use only the amount of immersion the task benefits from. Keep ordinary
interface work in stable, familiar windows and introduce depth or full
immersion when spatial relationships are essential.

Protect physical and visual comfort. Keep important content in a comfortable
field of view, avoid unexpected peripheral motion, minimize repeated reaching
or large movements, and preserve awareness of surroundings where safety
matters. Eye and hand targeting require clear feedback and alternatives; do
not expose private intent merely because gaze participates in targeting.

## Input rules

### Touch and gestures

Use familiar gestures consistently and provide immediate visual feedback.
Custom gestures must be necessary, easy to perform, distinct from system
gestures, discoverable, and never the only route to an essential action.
Disable or explain unavailable interactions instead of accepting a gesture
without effect.

### Pointer

Use pointer precision for efficient targeting, selection, resizing, and
contextual controls. Keep pointer responses consistent with platform
expectations. Pointer effects clarify an existing target; they must not be the
only evidence that a control exists.

### Keyboard

Every essential flow must be usable without a pointer where keyboard input is
supported. Keep focus visible, ordered, and stable. Use familiar shortcuts for
common actions, avoid overriding system and browser shortcuts, and add custom
shortcuts only for frequent product-specific commands.

### Focus and directional input

Focus indicates the current interaction target; selection indicates a chosen
value or item. Keep them visually and semantically distinct. Do not move focus
unexpectedly. Every reachable control must have a predictable directional
path, and focus treatments must fit without colliding with neighboring content.

### Voice, switches, and alternatives

Give controls clear accessible names and programmatic roles so voice and
assistive inputs can identify them. Avoid timing, precision, or multi-pointer
requirements when a simpler alternative can perform the same job.

## Review gate

Before approving a cross-platform or responsive feature, verify:

1. Each supported context has documented viewing, posture, session, and input
   assumptions.
2. Composition adapts intentionally rather than merely scaling.
3. Content and task state survive resizing, rotation, multitasking, and input
   changes.
4. Every essential action works with the supported alternative inputs.
5. Hover, gesture, drag, shortcut, and focus behavior supplement a clear core
   interaction.
6. Touch targets, pointer precision, keyboard focus, and directional focus are
   tested independently.
7. Wearable, distant, shared, or spatial contexts receive appropriate density
   and comfort treatment when supported.
8. Web guidance is labeled as a cross-platform synthesis, not attributed to a
   nonexistent Apple web branch.

## Apple source basis

Platform guidance is generalized from Apple's pages for
[iOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios),
[iPadOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados),
[macOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos),
[watchOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-watchos),
[tvOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-tvos),
and [visionOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-visionos),
plus the HIG guidance for
[gestures](https://developer.apple.com/design/human-interface-guidelines/gestures),
[keyboards](https://developer.apple.com/design/human-interface-guidelines/keyboards),
[pointing devices](https://developer.apple.com/design/human-interface-guidelines/pointing-devices),
and [focus and selection](https://developer.apple.com/design/human-interface-guidelines/focus-and-selection).
