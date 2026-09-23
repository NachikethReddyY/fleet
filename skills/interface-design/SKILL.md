---
name: interface-design
description: Design or review product interfaces, interaction flows, responsive behavior, accessibility, visual systems, and DESIGN.md or DESIGN.html artifacts. Use for web, mobile, and desktop product UI; skip marketing-only graphics.
---

# Interface Design

Design from the user's job outward. Make the smallest real flow work before styling it. Reuse accepted project decisions; add visual treatment only when it improves hierarchy, grouping, state, identity, comprehension, or action.

## Frame the work

Inspect the request, product, implementation, and existing `DESIGN.md` before choosing a direction. Resolve only uncertainty that changes the result. Record:

- primary user, job, and use context;
- supported platforms, viewports, inputs, and accessibility needs;
- product personality and interface voice;
- feature's smallest useful behavior and observable completion test;
- constraints, unresolved decisions, and deferred extras.

Ask concise questions only when project evidence cannot answer a decision-changing gap. Treat universal, platform-specific, and project-specific rules separately.

Choose the path that fits:

- **New feature:** build a low-fidelity working slice, then design it.
- **Existing system:** follow accepted `DESIGN.md`; propose only uncovered material choices.
- **New direction:** compare options using the real feature and obtain approval before high-fidelity styling.
- **Review:** inspect the real flow, states, contexts, and applicable reference gates. Report prioritized evidence; edit only when asked.

## Make the feature work

Start with the product's core action, not a shell or polished mockup. Keep the first pass monochrome and visually plain, but functionally real:

1. Mark up the smallest usable flow with native semantics and familiar controls.
2. Connect behavior required for the user's job.
3. Exercise applicable first-use, empty, partial, loading, success, failure, offline, interrupted, and permission-limited states.
4. Fix missing feedback, recovery, and edge cases; then add another feature only if scope requires it.

Represent only behavior that can be built now. Preserve entered work through validation, navigation, interruption, and recoverable failure. Exercise the primary input at the most constrained representative viewport. Keep keyboard, touch, pointer, voice, and assistive technology on one coherent action model where supported.

The slice is ready for visual design when the job is completable, every visible affordance matches implemented behavior, and expected states either provide a clear next step or are explicitly deferred.

## Establish the visual system

After the flow exposes what the feature needs, preserve accepted `DESIGN.md` decisions and extend only real gaps. If the task creates a design system and none exists, start a draft from [assets/DESIGN.md](assets/DESIGN.md); record facts and label guesses as unresolved.

Choose one coherent personality before choosing isolated values. Express it through typography, color, shape, density, motion, and language. Define small scales only where current decisions repeat. Use representative content and realistic states; appearance must support the task rather than showcase components.

For a new direction, derive visual choices from the product's subject, audience, and vocabulary. Before styling, summarize palette roles, type roles, and layout intent; check them against the brief. If the same proposal would fit an unrelated product unchanged, revisit the unsupported choices. Preserve explicit preferences and accepted systems, including familiar styles; distinctiveness alone does not justify redesign.

Tune layout variation, motion, and information density independently. A distinctive layout need not animate; a dense workspace need not feel visually loud. Explain the choices using the user's task and references rather than preset numeric scores. Preserve existing settings in a scoped redesign unless the request changes them.

Distinguish a named design system from visual inspiration. Reuse the project's components and tokens; when actual adoption of another system is requested, check its supported implementation before recreating controls. A reference's appearance alone does not authorize changing dependencies or architecture. Describe inspired treatments as adaptations, not official implementations.

When a material direction is unresolved, create temporary local HTML showing controlled alternatives of the real feature. Hold behavior, content, state, and viewport constant; vary only the decision under review. Label each option and its trade-off. Use neighboring values for fine choices and broader alternatives for personality choices. Stop once the meaningful choice is visible.

High-fidelity work requires either an accepted system covering the feature or user approval for new material choices. Direct user specifications count as approval for what they settle. Temporary comparisons may retain alternatives; canonical artifacts contain only accepted decisions.

## Record and apply accepted decisions

After approval:

1. Update `DESIGN.md` with roles, values, rules, reasons, contexts, states, and unresolved questions.
2. Create or update `DESIGN.html` from [assets/DESIGN.html](assets/DESIGN.html) to demonstrate the same accepted system with real components and states.
3. Apply the system to the working feature without weakening behavior, semantics, input access, recovery, or state coverage.

`DESIGN.md` is the agent-facing source of truth. `DESIGN.html` is its visual proof, not a second design. Treat disagreement as a defect and synchronize both. Remove unused scaffold sections and rejected alternatives.

If implementation exposes another material visual choice, return to comparison and approval. Otherwise verify representative viewports, inputs, themes, text sizes, accessibility settings, and interaction states. Completion requires a working user job, purposeful visual hierarchy, passed applicable reference gates, and synchronized canonical artifacts when the task creates or changes a system.

## Reference router

The visual-direction guidance incorporates selected ideas from [Anthropic's frontend-design skill](https://github.com/anthropics/skills/blob/main/skills/frontend-design/SKILL.md), adapted to this skill's product scope and approval workflow.

Independent visual controls and the distinction between systems and inspiration are adapted from [Taste Skill](https://github.com/Leonxlnx/taste-skill/blob/main/skills/taste-skill/SKILL.md). Its landing-page defaults do not apply to this product-interface workflow.

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
