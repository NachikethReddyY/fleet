# Platform and Input Adaptation

Design for use conditions, not device labels. Keep purpose and mental model stable while composition and interaction adapt.

## Context

Record viewport extremes, viewing distance, posture, session length, interruptions, primary and alternative inputs, resizing, orientation, multitasking, theme, text scale, localization, and required capabilities. Never infer input from width.

## Platform patterns

- **Handheld touch:** prioritize current content and action; keep essential controls reachable and visible; avoid hover dependency; support rotation, virtual keyboards, interruption, enlargement, and permission refusal.
- **Tablet or hybrid:** use space for context and parallel work instead of enlarging a phone layout; preserve state across split views, windows, and orientation; support touch, stylus, keyboard, pointer, and voice in combination.
- **Desktop:** reveal useful context and commands while preserving reading measure; support resizing, restored state, keyboard efficiency, pointer conventions, multiple windows, selection, menus, and drag where relevant.
- **Responsive web:** adapt to available space and capabilities, use native semantics, and test narrow touch, wide precision, and hybrid conditions. Treat hover, gestures, drag, and shortcuts as enhancements with equivalent routes.
- **Wearable or glanceable:** show critical information and one or two high-value actions with shallow hierarchy and predictable scrolling.
- **Distant or shared:** design for viewing distance and directional focus; keep focus unmistakable, protect display edges, and handle shared identity safely.
- **Spatial:** use immersion only for spatial value; keep ordinary work in stable windows, protect comfort and surroundings, limit peripheral motion and reaching, and avoid exposing gaze-derived intent.

These are patterns, not device stereotypes. Adapt from evidence and platform conventions.

Respect platform safe areas, system-reserved regions, native control behavior, and user appearance or text settings. Use Apple target sizes and components only on the applicable Apple platform; translate their purpose, not their points, to the web.

## Input contracts

- **Touch and gestures:** use familiar gestures with immediate feedback. Necessary custom gestures must be discoverable, distinct from system gestures, and have an equivalent essential-action route.
- **Pointer:** use precision for selection, resizing, and contextual controls. Pointer effects reinforce visible targets.
- **Keyboard:** every essential supported flow works without a pointer. Focus stays visible, ordered, and stable. Preserve system/browser shortcuts; add custom ones only for frequent product commands.
- **Directional focus:** focus and selection remain visually and semantically distinct; every reachable control has a predictable path.
- **Voice, switch, and alternatives:** provide clear accessible names and roles; avoid timing, precision, or multi-pointer requirements when a simpler route exists.

## Gate

- Supported contexts state viewing, posture, session, environment, and input assumptions.
- Composition adapts intentionally; content and task state survive change.
- Essential actions work across supported alternative inputs.
- Hover, gesture, drag, shortcut, and focus enhance rather than hide the core interaction.
- Touch targets, pointer precision, keyboard focus, and directional focus are tested independently.
- Specialized contexts receive suitable density, comfort, privacy, and safety treatment.
- Web rules are identified as cross-platform synthesis, not an Apple web standard.
