# Icons

Icons can identify actions, destinations, objects, and states quickly, but they
also create ambiguity and noise when used without a clear job. Design the icon
system as part of language, hierarchy, input, and accessibility—not as a layer
of decoration.

## Decide whether an icon belongs

Use an icon when it improves at least one of:

- recognition of a familiar action or object;
- scanning among repeated controls or categories;
- identification where space is genuinely constrained;
- reinforcement of a state that also has another cue;
- continuity with a platform convention or established product vocabulary.

Do not add an icon merely to decorate a heading, fill empty space, or repeat
adjacent text without improving recognition. When a symbol is unfamiliar,
abstract, safety-critical, or likely to vary by culture, pair it with a clear
label. Text is usually clearer than inventing a private pictogram.

## Choose familiar metaphors

Represent one concept per icon. Prefer simple, established metaphors that match
the audience and platform. Test the symbol without its surrounding screen; if
people consistently name a different action, change the metaphor or add text.

Avoid symbols whose meaning depends on a stereotype, local custom, outdated
physical object, or unexplained brand lore. Check whether directional symbols
must mirror in right-to-left layouts. Do not mirror symbols whose direction is
intrinsic to the object, brand, media control, or data.

Use project-specific icons only for project-specific concepts. Do not redraw a
standard platform action merely to appear unique when doing so makes it less
recognizable.

## Build one coherent family

Choose and record an icon source: system symbols, one licensed library, custom
assets, or a deliberately governed combination. Do not mix unrelated outline,
filled, rounded, sharp, hand-drawn, and three-dimensional families casually.

Control the family's:

- canvas and alignment grid;
- stroke or fill language;
- cap, join, and corner character;
- level of detail;
- optical weight relative to nearby type;
- perspective and dimensional treatment;
- filled, outline, or alternate state rules.

When sources must mix, normalize their perceived scale and weight at every
target size. The goal is optical consistency, not identical bounding boxes.

## Separate glyph size from target size

An icon's visible drawing and its interactive target are different decisions.
Choose glyph size for recognition and balance with adjacent text. Choose target
size and spacing for the platform, input method, and accessibility requirement.
Center the glyph optically within the target; mathematical centering may not
look centered for asymmetric shapes.

Inspect icons at actual rendered size and pixel density. Detailed icons need a
simplified small-size variant rather than uniform downscaling. Do not enlarge a
small, crude symbol until its stroke and detail dominate nearby content; use a
larger supporting container when the composition needs more presence.

## Define usage and states

For every functional icon, record:

- concept and action or destination;
- source and asset name;
- target contexts and rendered glyph sizes;
- interactive target sizes by supported input;
- label rule: always visible, context-dependent, tooltip, or accessible-only;
- default, hover, focus, active, selected, disabled, loading, and destructive
  treatment where applicable;
- filled or alternate variant behavior;
- localization and right-to-left behavior;
- accessible name and decorative treatment.

Keep state change recognizable without color alone. If an outlined icon becomes
filled when selected, confirm the change is clear at real size and does not
alter its perceived meaning. Selection, focus, and press are distinct states
and should not collapse into one treatment.

## Pair icons with text deliberately

Align icons and text by optical weight and typographic rhythm. A dense filled
icon may need lower contrast than its label; a fine outline may need slightly
more size or weight. Follow [visual-hierarchy.md](visual-hierarchy.md).

For icon-and-label controls:

- keep the icon near the label it explains;
- preserve the same ordering for repeated controls;
- avoid several icons competing around one short label;
- use verbs or destination names that clarify the symbol;
- keep a visible label when recognition or consequence matters more than
  compactness.

Tooltips can teach pointer users but cannot rescue an unclear icon for touch,
keyboard, voice, or screen-reader users.

## Use color and containers with restraint

Functional icons generally inherit the text or control role around them. Use
accent or semantic color when the icon owns that meaning, not to make every
symbol lively. Meaning must survive without color.

A circular tile, rounded square, badge, or pill behind an icon changes its
visual weight and may imply a button, category, or status. Add a container only
when that interaction or semantic role is real. Do not put every icon in a
colored shape as a default style.

## Demonstrate the system

In `DESIGN.md`, record the family, source, metaphor, sizes, targets, labels,
states, accessibility, and localization rules. In `DESIGN.html`, render:

- the complete governed set or each governed category;
- icons beside the text sizes they accompany;
- small and large optical variants where used;
- icon-only and icon-with-label patterns;
- interactive states and target boundaries;
- light, dark, high-contrast, and right-to-left cases when supported.

## Review gate

Before accepting an icon system, verify:

1. Every icon has a recognition, scanning, state, or platform job.
2. Familiar symbols retain familiar meanings and behavior.
3. Unfamiliar or consequential symbols have visible labels.
4. The family is coherent in weight, geometry, detail, and perspective.
5. Glyph and target sizes were chosen separately and tested at real size.
6. Focus, selection, press, disabled, and semantic states remain distinct.
7. Meaning does not depend on color, tooltip, or one input mode.
8. Accessibility names, decorative exclusions, and right-to-left behavior are
   defined.
9. Containers and accents express real roles rather than decorate every icon.
10. `DESIGN.md` and `DESIGN.html` record and demonstrate the same system.

## Apple source basis

This reference generalizes Apple's HIG guidance for
[Icons](https://developer.apple.com/design/human-interface-guidelines/icons),
[SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols),
[Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility),
and [Right to left](https://developer.apple.com/design/human-interface-guidelines/right-to-left).
Use SF Symbols requirements only for products that actually use that system.
