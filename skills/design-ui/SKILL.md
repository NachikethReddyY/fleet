---
name: design-ui
description: Design, implement, or review web, mobile, and desktop product interfaces, navigation, typography, interaction states, and engagement loops. Use for product UI and design systems; skip marketing graphics and standalone report documents.
---

# Design UI

Build around a task the user can finish. Make navigation predictable, progress understandable, and the next action apparent. Existing accepted design and explicit user references take precedence over defaults.

## Choose the smallest path

Inspect the named screen, its real states, project design decisions, and supplied references. State the user task, platform, protected behavior, and visible completion criteria before editing.

- Narrow correction: preserve accepted layout and behavior, patch the named issue, and verify the affected state. Skip fresh alternatives and a new design system.
- New or materially changed direction: use `html-communicator` to make distinct local static alternatives with the same realistic content and state. Explain the specific choice each exposes, return local paths, and stop for selection before changing real components. Explicit specifications settle only the decisions they describe.
- Accepted direction: implement the smallest complete flow with existing components and tokens; include recovery and completion states.
- Review: inspect actual behavior and screenshots, report evidence and severity, and change files only when requested.

Resolve missing product meaning with the user. Choose routine implementation details yourself. A reference treatment does not authorize changing the app's architecture, branding, or dependencies.

## Establish the design

Read [navigation-and-type.md](references/navigation-and-type.md) for the user's dock and platform typography defaults. These are starting preferences, not universal platform standards. Keep navigation destinations distinct from actions on the current selection.

Use the accepted palette, density, type, and icon family. Without an established system, use near-black backgrounds, white primary text, muted gray secondary text and borders, restrained blue accents, and dense task-focused layouts. Make hierarchy through alignment, spacing, typography, and action priority. Avoid decorative labels, invented branding, filler copy, and generic card or pill wrappers. The reference dock is a purposeful navigation group, not a reason to wrap other content in pills.

Before styling a new flow, map its destinations, content objects, and contextual actions. For each screen, make its location, available action, and resulting state clear. Validate this structure before refining materials.

Choose tokens only for recurring roles. Use realistic long labels, empty content, errors, and populated states. Read the relevant reference below when a decision needs more detail, rather than loading the entire library.

For habits, progress, rewards, streaks, community, competition, reminders, or retention, read [engagement.md](references/engagement.md). Decide whether an engagement loop serves the user's outcome before adding it. Ordinary utilities need no gamification.

## Implement and prove

Preserve entered work and durable progress through navigation, validation, interruption, and recoverable failure. Give every visible action real behavior, clear feedback, and an appropriate undo or recovery route. Cover applicable loading, empty, partial, success, failure, and permission states.

Verify the primary task in the browser or target device at representative narrow and wide sizes. Inspect dock geometry, text at actual size, keyboard focus, touch targets, zoom, contrast, reduced motion, and content beneath floating controls. Exercise context changes and return navigation, not only the initial screenshot. Report unavailable checks as unverified.

When the task creates or changes a design system, record accepted roles, values, and behavior in `DESIGN.md`; use [assets/DESIGN.md](assets/DESIGN.md) only as a starting structure. Keep `DESIGN.html` synchronized as visual proof using [design-html.md](references/design-html.md). Small component fixes do not require creating both documents.

Stop when the requested task works, the affected states match the accepted direction, applicable reference gates pass, and proof covers the visible claims. A mock-selection task stops at the reviewable alternatives. A review stops at evidenced findings. Never claim product effectiveness from a static mock or structural check.

## Detail references

Always read [experience-principles.md](references/experience-principles.md). The references translate portable Apple HIG strengths into product and web practice; use native Apple values or components only when targeting that platform. Select every branch the current decision touches, skip unrelated files, read each selected file completely, and apply its final gate or checklist.

- **Platform, viewport, responsive behavior, or input adaptation:** [platform-and-input.md](references/platform-and-input.md)
- **Semantics, assistive access, scaling, localization, or inclusive content:** [accessibility-and-inclusion.md](references/accessibility-and-inclusion.md)
- **Feedback, progress, errors, recovery, data entry, permissions, motion, settings, or generative behavior:** [interaction-and-feedback.md](references/interaction-and-feedback.md)
- **Color roles, palette, opacity, themes, or contrast:** [color.md](references/color.md). Also read [visual-hierarchy.md](references/visual-hierarchy.md) when color sets prominence.
- **Prominence, action priority, labels, media, or text over images:** [visual-hierarchy.md](references/visual-hierarchy.md)
- **Density, spacing, width, grid, grouping, or responsive sizing:** [layout-and-spacing.md](references/layout-and-spacing.md)
- **Typeface, scale, measure, line height, alignment, links, or tracking:** [typography.md](references/typography.md)
- **Surfaces, shadows, elevation, light, inset depth, or overlap:** [depth-and-elevation.md](references/depth-and-elevation.md)
- **Component composition, custom controls, empty states, separators, or decoration:** [component-composition-and-states.md](references/component-composition-and-states.md)
- **Icon need, metaphor, family, optical fit, labels, states, or mirroring:** [icons.md](references/icons.md)
- **Any styled interface or visual review:** [designrules.md](references/designrules.md); run its restraint audit.
- **Familiarity vs. novelty balance, mental models, chunking, or decision justification:** [visitor-psychology.md](references/visitor-psychology.md)
- **App polish, perceived quality, transitions, delight, or a multi-state flow review:** [premium-app-experience.md](references/premium-app-experience.md)
- **Creating or reviewing `DESIGN.html`:** [design-html.md](references/design-html.md)

- **Dock dimensions, contextual navigation, or platform text defaults:** [navigation-and-type.md](references/navigation-and-type.md)
- **Rewards, streaks, levels, comparison, identity, urgency, or reminders:** [engagement.md](references/engagement.md)

- **Dashboard tables, activity, progressive disclosure, mobile adaptation, or search empty states:** [content-and-disclosure.md](references/content-and-disclosure.md)
- **Source attribution, conflicting advice, or deeper research:** [research-sources.md](references/research-sources.md). The local research archive is optional; this skill must work without it.
