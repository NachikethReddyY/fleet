# App polish through the full flow

Use this when the task asks why an app feels polished or premium, or when reviewing the quality of a flow across multiple states. These are design prompts from [Wyatt Feaster, *The Reason Why Some Apps Feel Expensive, But Most Don’t*](https://www.youtube.com/watch?v=SAxKK5fbjbc) (2026-09-22). The source is the original-language English automatic captions, retrieved 2026-09-23. Treat its claims about perceived quality as the creator's perspective, not measured user research.

## What the video contributes

- **Anticipate the next need** (0:32–1:17). The video names recommendations, known-information prefill, and delivery windows as ways to remove friction. In a real flow, offer the next likely action or known value when context supports it; let the user inspect and change any consequential prefill. This last safeguard is our application of the idea.
- **Design the handoff between states** (1:17–2:08). The creator asks how long a transition should take and what happens while it runs. Check the path from action to progress to result: continuity should clarify what changed, while the user should never wait only for an animation.
- **Spend delight selectively** (2:22–3:41, 5:29–6:04). The video points to feedback on small interactions, completion moments, and an unexpected post-booking postcard. Put a restrained moment where it acknowledges progress or rewards exploration; keep repeated entry and critical tasks immediate. The video specifically warns against animation on every credit-card entry step.
- **Make the system feel coherent** (3:42–4:28). Audit icon family, type, color, spacing, and interaction behavior across the actual flow. A filled icon mixed with otherwise stroked icons is the video's concrete example. Fix inconsistencies with the project's existing tokens and components before inventing new treatments.
- **Give every stop a next step** (4:29–5:28, 6:05–6:33). The creator contrasts dead-end empty screens and vague errors with useful alternatives and instructions. Match the action to the cause: first use can invite creation, completion can lead to the next destination, and an error should state how to recover. An upsell is mentioned in the video as one possible empty-state use; it is not a universal default.

## Apply it without over-designing

Walk one realistic task from entry through completion, then its empty and failure paths. At each state, ask: What can the product already know? What changed? Is the response immediate? Is any motion helping orientation or feedback? Are the visual and interaction rules consistent? Can the user continue or recover? Fix the first concrete break in that path before adding decorative polish.

Use [interaction-and-feedback.md](interaction-and-feedback.md) for state, motion, and recovery rules; [component-composition-and-states.md](component-composition-and-states.md) for empty states; and the visual references for consistency. This note adds a flow-level review lens rather than replacing their gates.
