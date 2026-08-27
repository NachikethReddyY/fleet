---
name: greenfield
description: Route a new project from idea through evidence-backed specification, dependent tickets, implementation, and review using Fleet's existing skills.
disable-model-invocation: true
---

# Greenfield

Use this user-invoked router when a project starts without an accepted specification. It coordinates the existing skills; each referenced skill remains the source of truth for its work. Read [the state contract](references/state.md) when starting or resuming an effort.

## Operating rule

1. Read or create the one state file for this project and select one current stage.
2. Work only on that stage. Reach the linked skill when its condition below is true.
3. Advance only when the stage completion criterion is evidenced. If a stage fails, keep it current and report the missing evidence.
4. A skipped stage needs a note in `Accepted decisions` explaining why its completion criterion already holds.
5. The user owns product meaning, visual direction, protected behavior, and architecture decisions with lasting consequences. Record their approvals in `Accepted decisions` before crossing a gate.

This is a routing checklist, not a workflow engine, scheduler, or project-management system.

## Route

1. **Frame the problem.** Establish the user, problem, desired outcome, constraints, protected behavior, and unresolved product decisions. For an ambiguous idea, invoke [grill-with-docs](../grill-with-docs/SKILL.md) to run the existing grilling and domain-modeling discovery. If the open question is specifically a module/interface/seam choice, consult [codebase-design](../codebase-design/SKILL.md) after discovery; the user still decides. Complete when the product direction is explicit enough to specify and the unresolved decisions are named.

2. **Research when evidence is needed.** Invoke [research](../research/SKILL.md) only for an unanswered external or repository evidence question. It owns source-based investigation and the findings document; keep only its pointer in state. If the current evidence already answers the questions, record the skip and why. Complete when every required evidence question has a cited findings pointer or a recorded satisfied skip.

3. **Specify the accepted direction.** Invoke [to-spec](../to-spec/SKILL.md) after framing and any required research. If tracker or domain configuration is missing, invoke [setup-matt-pocock-skills](../setup-matt-pocock-skills/SKILL.md), then resume this stage. Require a specification pointer with observable acceptance criteria, explicit non-goals, and testing/seam decisions. Complete when the user accepts the product direction and the specification is available to the next stage.

4. **Ticket the approved specification.** Require explicit user approval before advancing here. Invoke [to-tickets](../to-tickets/SKILL.md) to turn the specification into approved tracer-bullet slices with genuine blocking edges and a visible frontier; it publishes them through the configured tracker. For work too large or too foggy for one session, invoke [wayfinder](../wayfinder/SKILL.md) first to map unresolved decisions; use it for the decision map, not as a substitute for executable tickets. Complete when the ticket pointer, dependencies, independent work, and user-approved granularity are recorded, with no implementation started.

5. **Implement approved tickets.** Require explicit user approval before advancing here. Invoke [implement-spec](../implement-spec/SKILL.md) for the full specification/task graph and its frontier, or [implement](../implement/SKILL.md) for one bounded piece. When test-first work or an integration test seam is required, reach for [tdd](../tdd/SKILL.md) at the pre-agreed seam. Let the implementation skill own contract preservation, testing, verification, and any implementation changes. Complete when the implementation evidence pointer covers the approved tickets and their acceptance checks.

6. **Review the completed work.** Invoke [code-review](../code-review/SKILL.md) with a resolved fixed point and the specification pointer; it owns the separate Standards and Spec review. Route real findings back to implementation and return to this stage. Complete only when acceptance evidence exists and review findings are resolved or a concrete blocker is reported; otherwise keep `Current stage: review`.

## Handoff

At every transition, update only the state fields in [the state contract](references/state.md). Link research, specification, tickets, and implementation/review evidence; do not paste their contents into the router state. A finished effort has `Next stage: —`. A blocked effort stays at the failing stage and names the missing evidence or external blocker.
