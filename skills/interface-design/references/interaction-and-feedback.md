# Interaction and Feedback

Every action needs a predictable result, timely feedback, and a recovery path.
Design the complete interaction loop rather than an ideal static state:
available, initiated, in progress, completed, failed, interrupted, reversed, or
unavailable.

## Keep people informed without interrupting them

Put feedback near the action or object it describes. Match prominence and
interruption to consequence:

- use subtle local feedback for routine input and state changes;
- use persistent progress when a task takes noticeable time;
- use a confirmation when success is consequential or otherwise uncertain;
- use a warning before unexpected irreversible loss;
- reserve modal alerts for critical information that requires immediate
  attention or choice.

Do not confirm every ordinary success or use a global toast for a local change
that is already visible. Do not display a disabled action without explaining
why when the reason is not apparent and the action matters.

Feedback must not rely on sound, color, animation, or haptics alone. Use the
smallest combination that makes status perceivable in supported contexts.

## Show progress honestly

Display useful content or structure as soon as possible and load additional
work in the background when safe. Keep unrelated parts of the interface usable
during a long task.

Use determinate progress when total work can be measured. Use indeterminate
progress only when it cannot. Do not fake precision, restart progress without
explanation, or let a control appear inert after activation. State what is
happening, preserve entered work, and provide cancellation when interruption is
safe and useful.

Design explicit initial, empty, partial, loading, stale, offline, success,
failure, and retry states as applicable. Follow
[component-composition-and-states.md](component-composition-and-states.md) for
empty-state causes.

## Make recovery part of the action

Prefer reversible actions and clear undo where feasible. Label undo and redo so
people can predict what will change, and show the resulting state. Preserve a
useful history for repeated changes when the product supports it.

For errors:

- place the message near the problem;
- explain what happened in direct, nonblaming language;
- retain valid input and work;
- state the next action when recovery exists;
- distinguish user-correctable input from system failure;
- move focus or announce the message without disorienting the user.

Confirmation is not a substitute for undo. Use confirmation when the action is
irreversible, costly, externally visible, or likely to cause unexpected loss.

## Use modality only for a clear benefit

A modal experience temporarily restricts other work and therefore needs a
specific reason: completing a focused task, making a required choice, or
protecting against a serious consequence. Keep it short, preserve the parent
task's identity and state, and provide an explicit way to dismiss or complete
it.

Avoid modal stacks. Do not turn ordinary navigation, reference information, or
multi-step exploration into a modal flow merely to keep it visually contained.
If a task needs space, navigation, or comparison, give it a full surface.

## Let people learn by doing

Make the primary experience understandable without a mandatory tour. When
onboarding is useful, keep it brief, contextual, interactive where practical,
and skippable. Defer instruction and setup until the feature becomes relevant.
Do not teach standard platform gestures or controls unless the product changes
their normal meaning.

Use progressive help for genuinely complex concepts. Let experienced people go
directly to their task. Empty and first-use states should explain value and
offer the next useful action, not present a marketing slideshow.

## Minimize data entry and permission friction

Ask only for information the current outcome requires. Use available system or
account data with permission when it reduces effort. Prefer a constrained
choice to typing when the option set is known, but do not hide a large or
searchable set behind an unsuitable picker.

Use clear labels, examples, formats, and input types. Identify required fields
before submission. Validate when feedback can help without interrupting entry;
do not mark an incomplete field as erroneous before a person has had a chance
to finish it. Keep sensitive data protected and explain why it is needed.

Request permissions at the point where the related feature provides context.
Explain the benefit and consequence of granting or declining. Respect denial
and provide a valid alternative or recovery path when possible.

## Write for action and recovery

Give each screen or surface a clear purpose and put important information
first. Prefer direct, action-oriented labels and descriptive links. Use the
same term for the same concept throughout a multistep flow.

Empty states explain why content is absent and what can happen next. Error
messages identify the problem and repair. Button labels describe the immediate
result rather than vague intent. Keep copy concise without removing context
needed to act safely.

## Use motion and haptics purposefully

Motion may explain spatial continuity, confirm input, reveal status, or direct
attention. Keep it brief, responsive, and proportionate. Frequent interactions
must not wait for decorative animation, and cancellable actions must not become
locked behind a transition.

Respect reduced-motion preferences. Replace large movement, depth shifts,
flashing, or repeated peripheral motion with a calmer transition or immediate
state change. In spatial contexts, protect visual and physical comfort.

Use haptics only when they have a consistent causal relationship to an action
or event. Match intensity to significance and avoid repetition. Haptics support
visible or audible feedback; they do not carry meaning alone.

## Keep settings near the decision

Choose strong defaults and minimize required configuration. Put an option near
the task it changes when people need it in context. Reserve a settings area for
persistent preferences that affect broader behavior. Do not make people search
through settings to complete a normal task.

## Make generative behavior explicit

When a feature generates or transforms content with AI, make that behavior
recognizable and set accurate expectations. Preserve agency with controls to
cancel, retry, refine, compare, edit, or revert when those actions fit the
task. Explain consequential limitations and keep generated output distinct from
confirmed user-authored or authoritative content.

Minimize private data sent to the system and explain relevant use. Design for
latency, partial results, refusal, unsafe output, and failure without losing the
person's source material. If generation is only an enhancement, preserve a
usable non-generative path.

## Review gate

Before completing an interaction pass, verify:

1. Every action produces immediate, proportional, and perceivable feedback.
2. Progress is honest, work is preserved, and cancellation exists when useful.
3. Empty, loading, success, failure, offline, and unavailable states have clear
   next steps where applicable.
4. Destructive or consequential actions have suitable recovery or warning.
5. Modality is brief, dismissible, and justified; modals do not stack.
6. Onboarding is contextual and skippable rather than a barrier to the product.
7. Data entry and permissions ask only for what the current feature needs.
8. Labels, errors, and recovery copy say what happens and what to do next.
9. Motion and haptics communicate a purpose and have accessible alternatives.
10. Defaults and in-context options reduce unnecessary settings.
11. Generative behavior is disclosed and supports control, correction,
    recovery, privacy, and failure when applicable.
12. Decisions are recorded in `DESIGN.md` and relevant states are demonstrated
    in `DESIGN.html`.

## Apple source basis

This reference generalizes Apple HIG guidance for
[Feedback](https://developer.apple.com/design/human-interface-guidelines/feedback),
[Loading](https://developer.apple.com/design/human-interface-guidelines/loading),
[Undo and redo](https://developer.apple.com/design/human-interface-guidelines/undo-and-redo),
[Modality](https://developer.apple.com/design/human-interface-guidelines/modality),
[Onboarding](https://developer.apple.com/design/human-interface-guidelines/onboarding),
[Entering data](https://developer.apple.com/design/human-interface-guidelines/entering-data),
[Privacy](https://developer.apple.com/design/human-interface-guidelines/privacy),
[Writing](https://developer.apple.com/design/human-interface-guidelines/writing),
[Motion](https://developer.apple.com/design/human-interface-guidelines/motion),
[Playing haptics](https://developer.apple.com/design/human-interface-guidelines/playing-haptics),
and [Generative AI](https://developer.apple.com/design/human-interface-guidelines/generative-ai).
