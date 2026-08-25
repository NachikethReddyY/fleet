---
name: interface-design
description: Design and review software interfaces from purposeful low-fidelity flows through user-approved high-fidelity systems. Use for product UI, responsive mobile, web, or desktop experiences, interaction states, accessibility, visual direction, and DESIGN.md or DESIGN.html artifacts.
---

# Interface Design

Design from working behavior outward. Treat a product as a collection of features: establish what each feature must let the user accomplish, build the smallest useful version, then design the visual system around proven flows.

## Workflow
Preserve this order:

1. Clarify user intent and choose one real feature.
2. Define the feature's purpose, smallest useful behavior, and completion test.
3. Build its core components as a low-fidelity working slice.
4. Test behavior, states, edge cases, primary inputs, and accessibility; repeat
   for the core flow.
5. Read the project's `DESIGN.md`, or create a draft when none exists.
6. Propose the visual direction in local HTML using the real feature. When a
   choice is uncertain, show multiple controlled variations.
7. Ask the user to approve a direction and record the accepted decisions.
8. Update canonical `DESIGN.md` and `DESIGN.html` with the approved system.
9. Apply that system to the working feature as high-fidelity UI and verify that
   behavior, access, and cross-context continuity remain intact.

For each planned feature, state:
- the user's job;
- the smallest useful behavior;
- an observable completion test;
- deferred nice-to-haves.

## Clarify intent

Use established product context when it answers the questions below. When the product's purpose or style is unclear, ask only the unanswered, decision-changing questions:

- Who is the primary user, and what are they trying to accomplish?
- In what context will they use the product?
- What should it feel like: serious, playful, calm, technical, luxurious,
  friendly, or something else?
- What attitude and voice should its interface language convey?
- Which platforms, viewport ranges, viewing conditions, and input methods must
  it support?
- Are privacy, safety, interruption, localization, or accessibility constraints
  material to the task?
- Are there useful references or styles the user wants to avoid?

Resolve enough uncertainty to name the user, job, personality, context, and
constraints before choosing a visual direction. Do not invent an Apple-specific
platform rule for a general web product; identify which guidance is universal,
platform-specific, or project-specific.

## Stage 1: Make it work

Read [references/experience-principles.md](references/experience-principles.md)
completely before planning or approving a feature. Use purpose, agency,
responsibility, familiarity, flexibility, simplicity, craft, and delight as
decision tests rather than as a visual style.

Start with real functionality, not the application shell or a polished mockup. For a flight service, begin with searching for a flight. For a form, begin with the fields, validation, submission, and feedback required to complete its job.

Build each feature as a short working loop:

1. Mark up the simplest usable version.
2. Connect the behavior needed to complete the user's job.
3. Use it to expose missing states and edge cases.
4. Fix the flow, then choose the next feature.

Keep this stage low-fidelity and monochrome. Use plain controls and minimal layout. Low fidelity means visually undecorated, not functionally fake. Defer typeface, color, shadow, icon, and fine-spacing decisions until core behavior can be exercised.

Exercise applicable first-use, empty, partial, loading, success, failure, and
permission-limited states as the slice emerges. A feature is not working while
one of its expected states leaves the user without a clear explanation or next
step.

Exercise the core flow with the primary supported input and at the most
constrained representative viewport. Preserve entered work through validation,
navigation, interruption, and recoverable failure. Use native semantics and
familiar behavior so keyboard, touch, pointer, voice, and assistive technology
can share the same action model where supported.

### Scope pessimistically

Represent only behavior that can be built in the current scope. A working comment form without attachments is more useful than an unfinished comment
system blocked by attachments. Keep nice-to-haves in the plan rather than implying unavailable functionality in the interface.

Move to Stage 2 when core flows work, visible affordances match implemented
behavior, and discovered edge cases are handled or explicitly deferred.

## Stage 2: Propose and approve the design

After the core flow works, read the existing `DESIGN.md`. Preserve its accepted
decisions and extend it only where the new feature introduces a real gap. When
the project has no `DESIGN.md`, create a draft from
[assets/DESIGN.md](assets/DESIGN.md). Record known product intent, constraints,
platform and input contexts, implementation evidence, accessibility
requirements, and unresolved decisions. Mark guesses as unresolved rather than
turning them into tokens.

Choose a coherent personality before choosing isolated visual values. Express it through typography, color, shape, and interface language. Study products familiar to the intended audience when direction is uncertain, while avoiding imitation of direct competitors.

Create small scales instead of choosing arbitrary values for every component.
Define only systems that current features need, then extend them when a
decision starts recurring. Typical systems include:
- font size, weight, and line height;
- color;
- spacing and dimensions;
- border width and radius;
- shadow and opacity;
- component variants and interaction states.

### Show the direction in HTML

For a new visual direction, create a temporary local HTML proposal that renders
the real working feature with representative content, applicable states, and
its most consequential supported context. Show it to the user before
high-fidelity styling begins.

When user judgment is needed, place multiple materially different variations in
the same comparison. Keep behavior, content, state, and viewport constant while
changing only the uncertain decisions, such as type scale, density, accent,
radius, or component treatment. Label each variation and state its meaningful
trade-off so the user can compare rather than imagine the difference.

Use neighboring system values when the question is fine-grained, such as icon
or heading size. Use broader directions when personality itself is unresolved.
Create enough variations to expose the real choice, then stop. Keep comparison
HTML local unless the user asks to publish it.

Temporary comparison HTML is an exploration artifact, not `DESIGN.html`. It may
contain alternatives; canonical `DESIGN.html` demonstrates only the accepted
system.

### Approval gate

High-fidelity implementation requires either an existing accepted design system
that covers the feature or explicit user approval of the proposed direction.
Direct user specifications count as approval for the decisions they settle.

After approval:

1. Update `DESIGN.md` with the chosen values, roles, usage rules, and reasons.
2. Create or update `DESIGN.html` to demonstrate the same accepted system.
3. Remove rejected alternatives from canonical artifacts; keep unresolved
   questions labeled in `DESIGN.md`.

## Stage 3: Apply high fidelity

Apply the approved typography, color, spacing, shape, icons, imagery, motion,
and component rules to the working low-fidelity feature. Styling may refine
layout and presentation but must preserve the tested behavior, state coverage,
semantics, input access, and affordances.

If implementation exposes another material visual choice, return to the Stage 2
comparison and approval gate for that choice. Otherwise update both design
artifacts as accepted decisions evolve, run the restraint audit, and verify the
feature at representative states, viewports, input modes, and accessibility
configurations.

## Reference routing

Read only the references relevant to the current work:

- Before planning or approving any feature, read
  [references/experience-principles.md](references/experience-principles.md)
  completely and apply its decision tests.
- For platform choice, mobile, tablet, desktop, web, responsive adaptation,
  viewing distance, windowing, touch, gestures, stylus, pointer, keyboard,
  focus, remote, wearable, or spatial input, read
  [references/platform-and-input.md](references/platform-and-input.md)
  completely before making or reviewing those decisions.
- For inclusive content, semantics, screen readers, keyboard-only operation,
  target sizes, text scaling, zoom, reduced motion, alternative perception,
  localization, or right-to-left behavior, read
  [references/accessibility-and-inclusion.md](references/accessibility-and-inclusion.md)
  completely before making or reviewing those decisions.
- For color models, palette and shade construction, neutral or accent families,
  text tones, colored surfaces, opacity, or contrast, read
  [references/color.md](references/color.md) completely before making or
  reviewing those decisions.
- For prominence, de-emphasis, labels and values, semantic headings, visual
  weight, action priority, image selection, text over images,
  media scaling, screenshots, or user-uploaded imagery, read
  [references/visual-hierarchy.md](references/visual-hierarchy.md) completely
  before making or reviewing those decisions.
- For density, whitespace, spacing or sizing scales, content width, columns,
  grids, responsive sizing, or grouping through proximity, read
  [references/layout-and-spacing.md](references/layout-and-spacing.md)
  completely before making or reviewing those decisions.
- For typeface selection, type scales, text measure, line height, baseline
  alignment, text alignment, link treatment, or letter spacing, read
  [references/typography.md](references/typography.md) completely before making
  or reviewing those decisions.
- For light direction, raised or inset surfaces, shadows, elevation levels,
  layered interaction, flat depth, or overlapping elements, read
  [references/depth-and-elevation.md](references/depth-and-elevation.md)
  completely before making or reviewing those decisions.
- For component composition, custom controls, empty states, separators,
  decorative accents or backgrounds, and departures from familiar component
  layouts, read
  [references/component-composition-and-states.md](references/component-composition-and-states.md)
  completely before making or reviewing those decisions.
- For icon necessity, metaphor, source family, optical size and weight,
  icon-only controls, icon and label pairing, target size, state variants,
  accessibility, or right-to-left behavior, read
  [references/icons.md](references/icons.md) completely before making or
  reviewing those decisions.
- For feedback, loading and progress, errors, recovery, undo, modality,
  onboarding, data entry, permissions, interaction writing, motion, haptics, or
  settings, or generative interface behavior, read
  [references/interaction-and-feedback.md](references/interaction-and-feedback.md)
  completely before making or reviewing those decisions.
- Before polishing or reviewing any visually styled interface, read
  [references/designrules.md](references/designrules.md) completely and run its
  restraint audit.
- Before creating, regenerating, or reviewing `DESIGN.html`, read
  [references/design-html.md](references/design-html.md) completely.

Load both references when color is being used to establish visual hierarchy.
Apply every relevant rule from a loaded reference. Store the resulting project-specific choices in the design-system artifacts, not in these reusable references.

Use [references/apple-hig-research.md](references/apple-hig-research.md) only
when maintaining this skill, checking source coverage, or resolving whether a
rule is universal or Apple-platform-specific. It is a provenance map of every
current HIG collection, not a runtime checklist for ordinary interface work.

## Design-system artifacts

Create `DESIGN.md` after the core flows work. Create canonical `DESIGN.html`
after the visual direction is approved:

- `DESIGN.md` is the agent-facing source of truth. Record product intent,
  personality, platform and input contexts, tokens, component rules, states,
  accessibility constraints, and reasons behind consequential decisions. It
  may begin as a draft containing accepted facts and clearly labeled unresolved
  questions. Read it before planning or changing UI, and update it when a
  design decision changes.
- `DESIGN.html` is the human- and agent-readable visual reference. Render the
  project's actual colors, accent roles, type, spacing, radii, components,
  states, and other accepted decisions so they can be inspected and reused. It
  must reflect `DESIGN.md`, not become a separate design.

Treat disagreement between the canonical files as a defect: confirm the
intended decision and synchronize both. Keep each decision in one authoritative
place rather than re-deciding it inside individual features. Temporary
comparison HTML is disposable and does not become a third source of truth.

Start new artifacts from [assets/DESIGN.md](assets/DESIGN.md) and
[assets/DESIGN.html](assets/DESIGN.html). Copy them into the project and
populate their commented slots from accepted project decisions. The scaffolds
contain no default theme: derive their content and presentation from the
product, remove sections the product does not need, and keep headings, tokens,
roles, and values synchronized.

## Completion

The workflow is complete when the plan is feature-first, core behavior works
before decoration, purpose and supported contexts are explicit, `DESIGN.md`
exists, a new visual direction has user approval, every applicable loaded
reference has been followed, high-fidelity styling preserves tested behavior
and access across representative contexts, the restraint audit passes, and
canonical `DESIGN.md` and `DESIGN.html` describe the same accepted system.
