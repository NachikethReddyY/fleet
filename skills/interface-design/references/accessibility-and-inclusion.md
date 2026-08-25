# Accessibility and Inclusion

Design so people can perceive, understand, navigate, and operate the product in
different ways. Accessibility and inclusion are product constraints from the
first low-fidelity slice, not a checklist applied after styling.

## Do not design for one assumed person

Consider permanent, temporary, and situational differences in vision, hearing,
mobility, speech, cognition, language, culture, age, and technical familiarity.
Do not infer goals or capabilities from identity or disability.

Audit examples, avatars, illustrations, names, occupations, homes, families,
activities, and language for stereotypes or narrow assumptions. Represent
people and settings with credible variety when representation is relevant.
Avoid requesting demographic attributes unless the feature has a legitimate
need; when it does, offer inclusive options and a way not to answer where
possible.

Use plain, respectful language. Avoid culture-specific metaphors when the
meaning must travel across locales. Prepare layout and content for translation,
longer strings, different number and date formats, and right-to-left reading.
Do not assume a color or symbol has identical meaning in every culture.

## Provide more than one path to perception

Do not communicate essential meaning through color, sound, motion, shape,
position, or haptics alone. Pair the relevant modes: text with icons, captions
or transcripts with audio, labels with color, and visible state with haptics.

Maintain useful contrast across supported themes and states. Let text and
interface symbols scale without clipping, overlap, loss of controls, or forced
horizontal reading. Keep reading order, visible order, headings, labels, and
landmarks aligned so assistive technology describes the same interface that
sighted users encounter.

Images need treatment based on purpose:

- informative images receive an equivalent description;
- functional images receive the name of the action or destination;
- decorative images remain outside the accessibility tree;
- essential text and controls remain real interface content, not baked into an
  image.

## Support multiple ways to operate

Use native semantics and familiar controls where possible. Every interactive
element needs a meaningful role, accessible name, state, and value. Interaction
must not require a particular combination of sight, hearing, speech, dexterity,
or pointer precision.

Provide comfortable targets with enough separation for the active platform and
input. The visible glyph may be smaller than its hit area. Test touch, pointer,
keyboard, voice, switch, and directional focus paths that the project supports.
Keep focus visible and predictable; do not trap it or move it without a clear
reason.

Avoid time limits when possible. When time is essential, provide warning and a
reasonable way to extend or recover. Do not require complex or custom gestures
without a simpler equivalent. Preserve entered data when validation or another
recoverable problem occurs.

## Make the interface understandable

Keep navigation and control behavior consistent. Use direct labels, put errors
near the problem, explain how to recover, and avoid blaming language. Break
complex tasks into comprehensible steps without forcing experienced people
through unnecessary instruction.

Reduce cognitive load through clear hierarchy, stable placement, and
recognizable patterns. Animation must not be the only explanation of a state
change. Respect reduced-motion preferences and replace disorienting movement
with a calmer transition or immediate state change.

## Test configurations, not only components

Test complete tasks with combinations that stress the design:

- large text or browser zoom at narrow and wide widths;
- keyboard-only and visible focus;
- screen reader names, order, states, and announcements;
- reduced motion, increased contrast, dark mode, and color-vision differences;
- captions or transcripts for meaningful audio;
- touch targets and pointer targets at real rendered size;
- translated and right-to-left content;
- temporary failure, slow loading, permission denial, and interrupted work.

Use platform accessibility APIs and system settings where available. Do not
replace a system capability with a visual imitation that assistive technology
cannot understand.

## Review gate

Before approving a feature, verify:

1. The design does not rely on one sense, input method, language, or assumed
   life experience.
2. Semantics, names, order, state, and focus match the visible interface.
3. Text and controls survive scaling, zoom, localization, and narrow widths.
4. Meaning remains clear without color, sound, motion, or haptics alone.
5. Targets and spacing fit every supported input context.
6. Essential tasks work with keyboard and relevant assistive inputs.
7. Motion and time constraints have safe alternatives.
8. Copy and representation avoid unnecessary stereotypes and exclusions.
9. Real configurations and complete flows were tested.
10. Accessibility requirements and evidence are recorded in `DESIGN.md` and
    demonstrated in `DESIGN.html`.

## Apple source basis

This reference generalizes Apple's HIG guidance on
[Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility),
[Inclusion](https://developer.apple.com/design/human-interface-guidelines/inclusion),
[Writing](https://developer.apple.com/design/human-interface-guidelines/writing),
and [Right to left](https://developer.apple.com/design/human-interface-guidelines/right-to-left).
Platform-specific sizes and APIs remain platform decisions rather than
universal web constants.
