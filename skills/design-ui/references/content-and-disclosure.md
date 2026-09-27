# Content and progressive disclosure

Read for dashboards, dense workspaces, mobile adaptation, and secondary actions. Choose form from the information and the user's task before arranging containers.

## Let the data determine the view

Use tables for comparing records across shared attributes, timelines for event order, lists for scanning, and charts for a specific trend or comparison. A chart must answer a question that the raw values make harder to answer. Keep the underlying values accessible. Do not add a chart merely to fill a dashboard.

Align comparable numbers by place value and make units explicit. Use categorical styling only for meaningful states, with text or symbols as well as color. Truncate only when the full value remains available through an accessible interaction. Preserve distinction between missing data, zero, loading, and failure.

## Reveal secondary actions without hiding the task

Keep the primary action apparent. Place secondary operations near the content they affect, in a popover, menu, or drawer when this preserves context. Every concealed action needs a discoverable trigger and keyboard/touch access; hover-only revelation is insufficient. Design the opened state, dismissal, focus return, and result, not just the closed screen.

Sequence onboarding around the first useful action. Add instruction at the point it becomes necessary, and allow experienced users to proceed. Do not turn a tutorial's tooltip example into a mandatory tour.

## Adapt mobile composition

Reprioritize desktop content instead of shrinking it. Give a task screen one main job while keeping other required functions reachable. Prefer one scrolling direction per ordinary content section; complex tables and canvases need their own deliberate navigation rather than an indiscriminate ban on two-axis movement.

Use a sheet for a bounded subtask that benefits from keeping the parent in view, such as choosing a template during editing. Use a separate destination for an independent task. Preserve draft data, make confirm/cancel consequences clear, and restore focus. Group by spacing before nesting another card that consumes the remaining width.

Distinguish first use from no results. First use should lead to creating or importing useful content. No results should preserve the query, explain the scope searched, and offer a relevant recovery such as clearing a filter. A service failure needs retry or recovery, not an empty-state illustration.

## Gate

- Each view's form supports a named question or action.
- Representative long, missing, zero, and failed values remain distinguishable.
- Secondary actions work with keyboard and touch as well as pointer.
- Mobile adaptation preserves capabilities, readable type, and reachable content.
- Sheets and menus preserve context and restore focus after dismissal.
- First use, no results, and failure each provide the appropriate next action.

Sources: [Kole Jain dashboard walkthrough](https://www.youtube.com/watch?v=Ksx9C2-3yMo), 00:22–02:22, 02:27–04:18, and 05:02–05:58; [mobile walkthrough](https://www.youtube.com/watch?v=Gfsd8NNuD9g), 02:03–04:32 and 06:27–07:09; [Apple design foundations](https://www.youtube.com/watch?v=dGcqqA3Sl-o), 06:17–07:01 and 09:09–10:31. Accessibility and recovery requirements are skill adaptations, not claims that every video demonstrates them.
