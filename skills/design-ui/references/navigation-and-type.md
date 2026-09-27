# Navigation and typography defaults

These preferences come from the user's supplied dock screenshots and notes (2026-09-26). The images are enlarged references; use the annotated logical dimensions, not screenshot pixel measurements.

## Floating dock

Start with a 48px-high dock and 72px-wide destination items in web CSS pixels. On native platforms, translate to platform logical units and verify on device. Keep the overall width derived from item count, padding, and gaps. Do not infer an exact outer width from the cropped reference.

Group related destinations in one rounded dark container. Each destination combines an icon and concise label; the active destination has a visible inset fill and programmatic selected/current state. Keep inactive labels readable. Reuse an existing icon family.

Place the primary contextual action beside the dock as a separate control, as the supplied plus-button reference shows. Its meaning and accessible name must identify what it creates in the current context. Do not invent extra destinations to fill space.

Keep top-level destinations present and in a consistent order across sections, including when a section is empty. Preserve each section's navigation state. On native Apple apps, follow the platform tab-bar behavior rather than replacing tabs with actions. In a deliberately scoped editing or selection mode, the supplied custom reference replaces the destination group with relevant tools and shows a separate return/undo-style control. Define its actual meaning before implementation. Use selection or mode as an explicit trigger, retain a clear exit, preserve work and previous navigation state, and restore focus when leaving. Avoid unexplained changes while the user is aiming at a control.

Reserve content space below floating controls, respect safe-area insets, and check the on-screen keyboard. Keep the dock position stable across ordinary states. If labels, zoom, localization, or the platform's hit targets do not fit, adapt dimensions or layout explicitly; never clip text to preserve a nominal size. Translucency is optional; verify contrast over real content and provide an opaque fallback.

## Text

Start mobile body text at 17px and dense web-app body/control text at 13px when no accepted system overrides them. These are user preferences, not claims about every app or accessibility compliance. The supplied tutorial compares iOS and macOS, not mobile and web generally. Apple's typography tables specify native text in points; the 13px web default is a separate user preference. Reading-heavy content can require larger text; headings and secondary labels need their own roles.

Use scalable tokens, respect user text settings, and inspect computed size and wrapping at actual scale. Native text uses platform text styles and logical units rather than a literal CSS pixel prescription. Do not reduce a touch target to its text size.

## Focused proof

- Measure the default dock height and item widths in the rendered implementation.
- Verify every destination, active state, context switch, and return action.
- Check that the final content row and focused field remain reachable above the dock.
- Inspect 17px mobile and 13px web starting roles, plus enlarged text and long labels.
- Confirm accessible names, keyboard access, visible focus, and usable targets.

Sources: [Apple tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars), [toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars), and [typography](https://developer.apple.com/design/human-interface-guidelines/typography), archived 2026-09-26; [Kole Jain mobile UI tutorial](https://www.youtube.com/watch?v=Gfsd8NNuD9g), 00:20–02:11 and 06:03–06:25. See [research-sources.md](research-sources.md) for evidence limits.
