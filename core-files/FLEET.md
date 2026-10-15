## Project context — Fleet

### What this is

Fleet is the shared home for Nachiketh's cross-project agent guidance, global skills, and workflows. It is not an application; its product is how agents behave on this machine.

### What matters

- One authoritative home per rule. Copies must be symlinks or generated, never hand-edited duplicates.
- Proof over assertion. A claim of done needs user-visible or focused-check evidence.
- Smallest complete work. Broad skills and processes only after simpler boundaries fail.
- Artifacts stay out of git. `artifacts/`, `.evidence/`, and generated reports are local-only.

### How to verify

- `sh tests/check-symlink-health.test.sh` — fixture suite for the symlink layout rules.
- `sh scripts/check-symlink-health.sh` — real-environment health report; runs automatically on commit via `.githooks/`.

- `python3 tests/check-instruction-delivery.py` — optional installed Codex loader check, without inference.
- `python3 -m unittest discover -s tests -p 'test_*.py'` — focused reference and episode-measurement fixtures.
- `python3 scripts/check-skill-references.py` — maintained local references and mandatory workflow routes; also runs on commit.

### Where to look

- `core-files/AGENTS.md` — canonical shared guidance, delivered globally.
- `core-files/FLEET.md` — Fleet-only context (this file); repository `AGENTS.md` links here.
- `skills/<provider-or-bucket>/<name>/SKILL.md` — globally synchronized skills (`universal` and `command-center` apply to every agent; provider buckets apply only to that provider); `.agents/skills/<name>/SKILL.md` — Fleet-only skills.
- `scripts/` — sync and health tooling; `workflows/` — repeatable process specs; `research/` — captured findings.

### Shared language

- **Contract** — one-line outcome scope (`Outcome | Allowed changes | Protected behavior | Proof | Stop when`).
- **Proof** — evidence matched to the claim; agent assertion is not proof.
- **Seam** — in learning mode, the one piece the user must produce himself.
- **Fleet-local** — not synchronized to other harnesses or machines.

## Local report lifecycle

- `.analy/` holds stable manual reports; `.evidence/<task>/` holds per-task proof and redacted fixtures. `artifacts/` holds generated presentation files. All remain ignored and local-only; do not migrate historical reports just to rename them.
- Validate guidance and workflow references with `python3 scripts/check-skill-references.py`; evaluate recorded episodes only when requested, following `workflows/references/episode-measurement.md`.
- Resolve the Fleet root from the real path of the installed global instruction link (`core-files/AGENTS.md`), not a literal home-directory alias or the current project's root.
