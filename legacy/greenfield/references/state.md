# Greenfield state contract

Keep one state file at `.scratch/<project-slug>/greenfield-state.md`. The state is an index, not a copy of the linked artifacts. Keep values short and use paths or URLs for detail.

The file may contain only these fields:

```md
# Greenfield state

- Current stage: frame | research | specify | ticket | implement | review
- Project outcome: <desired outcome; include material constraints here>
- Protected behavior: <behavior to preserve>
- Accepted decisions: <decisions, direction approvals, and skip reasons>
- Unresolved decisions: <open product or architecture decisions>
- Research: <pointer or —>
- Specification: <pointer or —>
- Tickets: <pointer or —>
- Implementation evidence: <implementation, review, and acceptance-evidence pointers or —>
- Current completion criterion: <the evidence required to leave the current stage>
- Next stage: <frame | research | specify | ticket | implement | review | —>
```

Use `Accepted decisions` to record why a skipped stage already satisfies its completion criterion and to record the explicit approvals required before ticketing and implementation. Do not add fields for status, logs, history, or copied artifact content.
