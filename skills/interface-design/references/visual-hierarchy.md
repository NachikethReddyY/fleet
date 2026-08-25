# Visual Hierarchy

Rank information and actions so users see what matters, what supports it, and what can wait.

## Levels and relationships

Build primary, secondary, and tertiary levels with size, weight, contrast, position, and space. Keep every level readable; avoid giant primary text paired with tiny support text. Two text weights often cover product UI: `400–500` for ordinary text and `600–700` for emphasis.

If a primary element feels weak, reduce nearby competition before decorating it. Judge prominence relationally, inside the complete composition.

Present data for the user's scan. Omit obvious labels, combine natural phrases such as “12 left in stock,” and emphasize whichever of label or value users seek first. Semantic HTML hierarchy and visual prominence are separate decisions: keep a logical outline, then style each role for its real importance.

Balance pixel weight against contrast. Dense icons may need less contrast than adjacent text; low-contrast borders may need more width. Evaluate the composition, not isolated tokens.

## Actions and elevation

Rank actions by contextual priority:

- **Primary:** main next step, usually one per view.
- **Secondary:** clear without competing.
- **Tertiary:** discoverable and quiet.

Severity is separate. A destructive action may stay quiet until a confirmation surface, where it becomes the clear consequential choice.

Elevation attracts attention and must match stacking order. Reserve high levels for temporary surfaces such as menus, dragged items, and dialogs.

## Imagery

Treat imagery as content with visual weight. Establish layout with final assets or substitutes matching subject, aspect ratio, brightness, and focal placement. Preserve aspect ratio, important content inside a crop-safe region, and embedded color profiles where accurate reproduction matters.

For text over imagery, test every permitted crop and worst-case asset. Seek stable contrast in this order:

1. Use a quiet crop and separate text from the subject.
2. Reposition the focal point.
3. Add a restrained light or dark overlay.
4. Adjust contrast and brightness.
5. Tint or colorize when it supports identity.
6. Use a diffuse text shadow only as reinforcement.

If contrast still depends on favorable pixels, move text onto its own surface.

Match assets to rendered size. Prefer vectors when substantial scaling is expected, but remember that vectors can still contain unsuitable detail. Provide simplified small variants; crop screenshots to legible regions instead of presenting unreadable miniature text. Inspect real size and target density on representative displays.

Unpredictable imagery needs a contract: container, aspect ratio, crop-or-fit policy, optional focal point, loading/missing/broken states, and a restrained boundary for pale or transparent assets. Test extreme portrait, landscape, low-quality, and transparent inputs.

Classify images as informative, functional, or decorative. Give the first two useful alternatives or accessible names; exclude decoration. Keep essential text and controls outside images.

When depth or parallax affects imagery, assign explicit foreground, middle, and background roles. Keep motion subtle and recheck crop, focus, readability, and reduced-motion behavior.

## Gate

- Primary content and main action are obvious without making support unreadable.
- Labels and values match the user's scan; semantics and visual order are both correct.
- Weight, contrast, action priority, elevation, and stacking agree.
- Imagery works at final crop, size, density, and worst supported content.
- Text contrast survives all permitted images; unpredictable assets cannot break layout.
- Every image has the correct informative, functional, or decorative treatment.
