# Experience Principles

Use these principles before choosing layout, components, or visual styling.
They are decision tests, not aesthetic presets. When principles compete, favor
the option that best serves the user's core job while protecting agency,
safety, and access.

## Start with purpose

Name the product's useful purpose and the user's immediate job. Give the most
important features disproportionate care and remove features or interface
elements that do not strengthen that purpose. Study existing solutions to
understand expectations, then solve the product's actual problem instead of
reproducing another interface.

For each feature, be able to state:

- who benefits;
- what outcome it enables;
- why it belongs in this product;
- what can be omitted without weakening that outcome.

## Preserve agency

Take people directly to their content or task. Guided flows may help, but they
must not trap people in a mode or force unnecessary steps. Make escape,
cancel, back, and skip behavior clear where applicable.

Design forgiving interactions. Preserve work through validation errors,
interruptions, navigation, and recoverable failures. Prefer undo or reversible
state when feasible. Warn before unexpected irreversible loss, not before every
routine action. Keep people informed so they can predict the consequence of
acting and recover without paying with lost time or data.

## Act responsibly

Earn trust through transparent behavior. Explain why a permission or sensitive
piece of data is needed at the moment it becomes relevant. Request and retain
only what the feature requires. Respect refusal, protect stored information,
and consider how a feature could be misused or cause unintended harm.

Do not use confusing copy, disguised controls, artificial urgency, or visual
hierarchy to push someone toward an outcome they would not freely choose.
Ensure that destructive, financial, privacy-sensitive, and externally visible
actions communicate their real consequence.

## Build on familiarity

Use concepts, control behavior, navigation models, and platform conventions
that the intended audience already understands. Elements that look alike
should behave alike. The same action should use consistent language and
feedback throughout the product.

Depart from a familiar pattern only when the change improves a named user task.
Preserve the pattern's semantic role, input behavior, state model, and recovery
expectations. Novel appearance does not justify surprising behavior.

## Design for flexibility

Assume people will use the product in different contexts, configurations,
languages, abilities, and input modes. Treat accessibility and inclusion as
initial constraints, not post-polish checks. Preserve recognizable content,
controls, and task state as the interface adapts across viewport, orientation,
theme, text size, input, and supported platform.

Give every supported platform intentional care. Shared identity does not
require identical composition. Adapt density, navigation, input feedback, and
presentation to the context while preserving the product's purpose and mental
model. Follow [platform-and-input.md](platform-and-input.md) and
[accessibility-and-inclusion.md](accessibility-and-inclusion.md).

## Make simplicity useful

Simplicity means removing friction, not removing needed context. Keep the
important task close, organize information logically, use concise language,
and make the next action recognizable. Let secondary material recede or appear
when relevant.

Every visible element must earn its place through meaning, hierarchy, grouping,
state, identity, comprehension, or action. Adding an explanation can be the
simpler design when omission would make a control ambiguous. Use
[designrules.md](designrules.md) to audit unearned treatments.

## Practice craft

Prototype early, test with real content and realistic constraints, and discard
directions that do not work. Quality includes precise language, reliable
behavior, legible typography, appropriate feedback, performance, and the
details of every supported state—not visual polish alone.

Inspect the product in real contexts, at target sizes, with supported input and
accessibility settings. Continue maintaining the design system after release;
new capabilities and content must meet the same quality bar.

## Create delight as a consequence

Choose the emotion appropriate to the product: confidence, calm, energy,
focus, warmth, play, or another intentional quality. Express it in useful
moments such as responsive feedback, thoughtful recovery, clear writing, and
well-resolved transitions.

Do not bolt on confetti, novelty, excessive motion, or decoration and call it
delight. A product becomes satisfying when it respects people's goals, gives
them control, feels safe and familiar, adapts to their needs, and demonstrates
care.

## Maintain hierarchy, harmony, and consistency

Across the principles above:

- **Hierarchy:** distinguish content, controls, and levels of importance so the
  path through the task is clear.
- **Harmony:** make visual form and interaction feel appropriate to the device,
  environment, product purpose, and system around it.
- **Consistency:** follow established platform conventions and keep the
  product's own behaviors predictable as windows, displays, and contexts
  change.

## Review gate

Before approving a feature direction, verify:

1. Its purpose and user outcome are explicit.
2. It gets people to the task without avoidable steps or traps.
3. Mistakes and interruptions do not unnecessarily destroy work.
4. Permissions, data use, and consequential actions are transparent.
5. Familiar controls behave as people expect.
6. The design adapts without losing context or identity.
7. Every element contributes useful meaning or action.
8. Accessibility, language, performance, and edge states receive the same care
   as the ideal path.
9. The intended emotion follows from the complete experience rather than
   decoration.
10. Project-specific consequences are recorded in `DESIGN.md`.

## Apple source basis

This reference generalizes Apple's current [Design
principles](https://developer.apple.com/design/human-interface-guidelines/design-principles)
and the hierarchy, harmony, and consistency guidance on the [Human Interface
Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
landing page. Apply Apple-only conventions only when the target includes an
Apple platform.
