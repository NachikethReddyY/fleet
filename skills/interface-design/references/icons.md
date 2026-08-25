# Icons

Icons are interface language. Use them for recognition, scanning, state, constrained space, or established platform vocabulary—not filler.

## Meaning and family

Prefer one familiar concept per icon or use a short verb label when it communicates faster. Pair unfamiliar, abstract, culturally variable, or consequential symbols with visible text. Test whether the symbol is understood without its surrounding screen. Keep standard platform actions recognizable instead of redrawing them for novelty.

Choose one governed source: system symbols, a licensed library, custom assets, or a deliberate combination. Keep canvas, stroke or fill, corners, detail, perspective, and optical weight coherent. Normalize mixed sources by perceived size and weight, not bounding boxes.

Mirror directional symbols for right-to-left layouts only when direction is linguistic or navigational. Preserve intrinsic object, brand, media, and data direction.

## Size, targets, and states

Glyph size and target size are separate. Fit the glyph to adjacent type and recognition; fit the target and spacing to platform, input, and accessibility needs. Center optically. Prefer vector interface icons when scaling is expected. Inspect real rendered size and density; create simplified small variants instead of uniformly shrinking detail.

For functional icons define:

- concept, source, asset name, contexts, and glyph sizes;
- target sizes by input;
- visible, contextual, tooltip, or accessible-only label rule;
- default, hover, focus, active, selected, disabled, loading, and destructive states as applicable;
- localization, mirroring, accessible name, and decorative exclusion.

Focus, press, and selection are distinct. Add a selected glyph variant only when the surrounding component does not already communicate selection. State must remain clear without color. A tooltip can assist pointer users but cannot rescue ambiguity for touch, keyboard, voice, or screen readers. Keep essential words outside icon artwork so they can localize.

Align icon and label by optical weight and typographic rhythm. Keep repeated order stable and visible labels where recognition or consequence matters.

Icons normally inherit surrounding text or control color. Use accent, semantic color, or a container only when the icon owns that meaning. A tile, badge, or pill changes weight and may imply action, category, or status.

## Gate

- Every icon improves recognition, scanning, state, or platform continuity.
- Metaphors remain familiar; uncertain or consequential meanings have labels.
- Family, geometry, detail, and optical weight are coherent.
- Glyphs and targets are tested separately at real size.
- Focus, press, selection, disabled, and semantic states remain distinct without color alone.
- Labels, accessible names, decoration, input behavior, and mirroring are defined.
- `DESIGN.md` and `DESIGN.html` demonstrate the same governed system.
