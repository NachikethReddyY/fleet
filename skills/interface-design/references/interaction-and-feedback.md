# Interaction and Feedback

Design the full loop: available, initiated, in progress, completed, failed, interrupted, reversed, and unavailable.

## Feedback and progress

Place feedback near the action or object. Match interruption to consequence:

- subtle local feedback for routine changes;
- persistent progress for noticeable waits;
- confirmation for consequential or otherwise uncertain success;
- warning before unexpected irreversible loss;
- modal alerts only for critical information requiring immediate choice.

Every activation responds immediately. Show useful content early and keep unrelated work usable when safe. Use determinate progress when measurable; otherwise describe what is happening without fake precision. Provide cancellation when interruption is safe and useful.

Routine success already visible in the interface needs no confirmation. Keep local changes local instead of using a global toast.

Design applicable initial, empty, partial, loading, stale, offline, success, failure, retry, and unavailable states. Feedback never relies on sound, color, motion, or haptics alone.

## Recovery and modality

Prefer undo and reversible actions. Preserve valid work. Errors sit near their cause, explain what happened without blame, distinguish input from system failure, and state the next action. Announce or focus errors without disorientation.

Confirm actions that are irreversible, costly, externally visible, or likely to cause unexpected loss. Confirmation is not a substitute for undo.

A modal earns its interruption by completing a focused task, requiring a choice, or protecting against serious consequence. Keep it short, preserve parent state, provide an obvious exit, and avoid modal stacks. Use a full surface when a task needs navigation, space, or comparison.

## Learning, entry, and language

Make core use understandable without a mandatory tour. Keep onboarding contextual, brief, and skippable; defer setup and permission until relevant. Teach changed or genuinely complex behavior, not standard controls.

Ask only for information the current outcome needs. Prefer known data or constrained selection when suitable. Label fields outside placeholders, identify requirements before submission, validate when correction is useful, and avoid declaring an unfinished field wrong too early.

Use consistent terms, action-result button labels, descriptive links, and concrete recovery copy. Empty states explain why and what can happen next.

## Motion, settings, and AI

Motion explains continuity, confirms input, shows state, or directs attention. Keep frequent actions responsive. Respect reduced-motion settings and protect comfort. Haptics reinforce a visible or audible event; they never carry meaning alone.

Choose strong defaults. Put task-specific options beside the task; reserve settings for persistent broader preferences.

Delay account creation until the feature requires identity. Keep account recovery and deletion discoverable, and explain long-running or delayed status clearly.

Make generative behavior recognizable. Set accurate expectations and support cancel, retry, refine, compare, edit, or revert as appropriate. Preserve source material; design for latency, partial output, refusal, unsafe results, and failure. Minimize private data and keep a usable non-generative path when AI is supplementary.

## Gate

- Every action produces timely, proportional, perceivable feedback.
- Progress is honest; work survives waits, errors, and interruption.
- Applicable states explain what happened and provide a useful next step.
- Consequential actions have suitable recovery or warning.
- Modality is brief, dismissible, justified, and never stacked.
- Onboarding, entry, and permissions introduce only necessary friction.
- Labels and errors state outcomes and recovery directly.
- Motion and haptics have a job and accessible alternatives.
- Defaults and in-context options minimize configuration.
- Generative behavior preserves disclosure, control, correction, privacy, and failure recovery.
