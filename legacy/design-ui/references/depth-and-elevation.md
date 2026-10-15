# Depth and Elevation

Depth explains surfaces, stacking, and interaction. Use one coherent model and the fewest cues that make relationships clear.

## Model

For a light-from-above model, light-facing edges brighten and opposite edges darken. Raised surfaces cast a compact shadow away from the source; inset surfaces reverse those edge cues inside the surface. Explicit highlight tokens are safer than overlays when alpha washes out color.

A flat system can express the same structure with surface values, borders, solid offsets, and overlap. Physical realism is unnecessary; consistent meaning is required.

Use blur, translucency, and material effects only when they clarify layer or context. Content contrast must remain stable over every permitted background; provide a more opaque fallback when it does not.

## Materials and nested shapes

On Apple platforms, prefer system controls that supply material behavior and accessibility adaptation. Liquid Glass belongs primarily to the navigation and control layer above content, not repeated behind content cards. Use standard materials or ordinary fills within content. On the web, a blur approximation is an adaptation, not native Liquid Glass.

Inspect materials over bright, dark, and busy content, with reduced transparency, increased contrast, and reduced motion where supported. Keep controls legible without animation or translucency. Reserve prominent tint for meaningful priority rather than coloring every control.

For nearby nested rounded shapes, make inner and outer curves coherent with their inset. Prefer native concentric shapes when available; for ordinary web rounded rectangles, an inner radius near the outer radius minus the inset is a starting geometry, then inspect the actual result. This does not justify adding nested containers.

Sources: [Apple materials](https://developer.apple.com/design/human-interface-guidelines/materials) and [toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars), archived 2026-09-26; [Bitrig material walkthrough](https://www.youtube.com/watch?v=KyA2qjNRKkM), 00:20–04:25. The web geometry is an implementation adaptation.

## Bounded levels

Define three to five named levels when needed: base, subtly raised controls or cards, menus or dragged items, and blocking surfaces. Map each to owned surfaces and actual stacking order.

Lower levels use tighter shadows. Higher levels use broader, softer cast shadows. In a layered shadow:

- broad soft layer communicates cast distance;
- tight dark layer communicates surface contact.

Remove contact shadow as distance grows. Every layer needs a distinct structural job.

Connect changes to interaction: grabbed items may rise, pressed controls may approach the plane, and menus enter at their owned level. Static elements should not look draggable or pressable. Preserve focus and reduced-motion behavior.

If parallax is used, assign clear foreground, middle, and background roles and keep movement subtle enough to preserve comfort and focus.

## Overlap and restraint

Overlap must clarify front-to-back order or ownership. Verify stacking, clipping, content visibility, targets, and responsive reflow. Use a restrained separator when adjacent imagery makes the edge unclear.

Remove highlights, blur, nested shadows, or extra levels that do not clarify surface, stacking, or interaction.

## Gate

- One light or flat-depth model governs every surface.
- Raised and inset cues remain directionally coherent.
- Each named level owns specific surfaces and matches actual stacking order.
- Shadow size, softness, and layers communicate distance consistently.
- Interaction changes agree with the z-axis and remain clear with reduced motion.
- Materials retain legibility across real backgrounds and supported accessibility settings.
- Overlap stays readable, operable, and stable across viewports.
- `DESIGN.md` and `DESIGN.html` define and demonstrate the same depth system.
