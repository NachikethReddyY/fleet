# YouTube research: building an agentic engineering workflow

## Scope and source method

This note covers the four supplied videos. Titles, creators, durations, descriptions, and publication status were taken from each video's YouTube metadata. The substantive notes were checked against the English auto-generated captions, with timestamped links to the official YouTube video as the source. Captions are imperfect in places (for example, “Slop Watch” is sometimes rendered as “Stopwatch” or “Slot Watch”), so product names and highly specific claims should be checked against the recording before publication.

## Executive synthesis

Together, the videos describe an operating system for agent-assisted software work:

1. **Encode know-how in small, intentional skills.** A skill needs a clear trigger, a compact procedure, and only the supporting reference material required for its current branch.
2. **Put related deployables in one navigable codebase.** A modern monorepo can share types and domain logic across a web app, CLI, extension, worker, and backend while still deploying them independently.
3. **Make agent behavior observable.** If sessions, turns, model requests, tool calls, cost, and outcomes are captured consistently, teams can debug and improve their use of agents instead of relying on anecdotes.
4. **Let agents run loops, but bound the loops.** Automation, isolated worktrees, skills, connectors, and independent checking increase autonomy; they also increase the chance that an unattended error compounds.

The practical through-line is **structured autonomy**: clarify the domain and vocabulary, isolate changes, instrument the workflow, and preserve human or independent review at the points where risk matters.

## Per-video takeaways

### 1. Building Great Agent Skills: The Missing Manual — AI Engineer

**Source:** [YouTube video](https://www.youtube.com/watch?v=UNzCG3lw6O0) · 20:43 · [description/checklist overview](https://www.youtube.com/watch?v=UNzCG3lw6O0&t=132s)

Matt Pocock frames the problem as “skill hell”: many available skills, but no shared rubric for judging whether one is useful, maintainable, or correctly invoked.

- **Trigger (03:16–07:25):** Decide whether the skill is user-invoked or model-invoked. Model invocation is flexible but adds a description to every request, increasing context load and unpredictability. User invocation reduces agent-side load and makes activation explicit, but shifts cognitive load to the person operating the agent. See [trigger discussion](https://www.youtube.com/watch?v=UNzCG3lw6O0&t=196s).
- **Structure (07:29–11:53):** Treat a skill as two units: executable **steps** and supporting **reference**. Keep the main `SKILL.md` small; put branch-specific templates and explanations behind context pointers so irrelevant material is not loaded on every path. See [steps/reference and branching](https://www.youtube.com/watch?v=UNzCG3lw6O0&t=449s).
- **Steering (11:54–16:47):** Use compact “leading words” that encode a larger operating concept and repeat them consistently. “Vertical slice” is the example: it nudges the agent toward a thin, end-to-end increment rather than implementing one technical layer at a time. When a phase needs more investigation, split it into a separate skill so the agent cannot eagerly jump to a later goal. See [leading words](https://www.youtube.com/watch?v=UNzCG3lw6O0&t=714s) and [separate skills for more legwork](https://www.youtube.com/watch?v=UNzCG3lw6O0&t=895s).
- **Pruning (16:48–19:05):** Remove duplicated guidance, stale “sediment,” irrelevant material, and “no-ops”—instructions whose deletion does not change behavior. Keep one source of truth for each rule or template. See [pruning and deletion test](https://www.youtube.com/watch?v=UNzCG3lw6O0&t=1008s).

**Actionable rule:** For every skill, write down the trigger, the steps, the references each branch actually needs, the few leading terms that should steer behavior, and a deletion test for unnecessary prose.

### 2. I Hated Monorepos, Now I Can’t Build Without Them — Ben Davis

**Source:** [YouTube video](https://www.youtube.com/watch?v=ezb2neX9pIU) · 16:18 · [official description and linked example repositories](https://www.youtube.com/watch?v=ezb2neX9pIU)

The author’s change of mind is driven by reduced coordination friction: one repository can contain several pieces of a product that have different runtimes, deployment targets, and release cadence.

- A single product example combines a SvelteKit web app, a Raycast extension, a Cloudflare image-optimizer worker, and a shared Convex package. The shared package exports the API, data model, and server types, so the web and extension consume one local contract rather than duplicating generated paths. See [multi-app example and shared package](https://www.youtube.com/watch?v=ezb2neX9pIU&t=20s).
- **Bun workspaces** provide the package manager/runtime/script runner. A root `package.json` declares `apps/*` and `packages/*`; internal packages are addressed by their package names and linked locally with `bun install`. See [Bun workspace setup](https://www.youtube.com/watch?v=ezb2neX9pIU&t=293s).
- **Turborepo** coordinates dev commands, displays logs, caches builds, and understands dependency order. Its filtering lets the developer run only the checks/builds for one app plus the packages it depends on, instead of rechecking the whole repository. See [Turbo dev/caching](https://www.youtube.com/watch?v=ezb2neX9pIU&t=403s) and [filtered checks](https://www.youtube.com/watch?v=ezb2neX9pIU&t=822s).
- The same repo can deploy separate units independently. The example uses a web app and background worker deployed separately, and Turbo’s pruning can assemble only the dependencies needed for one target image. See [separate deployables and pruning](https://www.youtube.com/watch?v=ezb2neX9pIU&t=738s).
- The agent is given package-aware instructions: after changing a package, run that package’s check and format scripts. This narrows feedback and avoids making the agent validate the entire codebase after every edit. See [agent-specific checks](https://www.youtube.com/watch?v=ezb2neX9pIU&t=850s).

**Actionable rule:** Use a monorepo when several components share a product boundary or domain logic; make package entrypoints explicit, give every package focused `dev`/`check`/`format` scripts, and retain independent deployment boundaries.

### 3. LIVE: Watch me build a brand-new project from scratch — Matt Pocock

**Source:** [YouTube livestream](https://www.youtube.com/watch?v=K-mA3MZ_EzU) · 1:47:30 · [official description](https://www.youtube.com/watch?v=K-mA3MZ_EzU)

This is principally a greenfield discovery and domain-modeling session, not a completed implementation. The working concept is an open-source, self-hosted/on-premises coding-agent observability tool; the name settles informally on **Slop Watch** near 00:37. The captions alternate between similar spellings.

- **Start with the problem and user:** The initial constraints are everyday usefulness, front-end and back-end complexity, and relevance to AI-assisted coding. The proposed product should show token/cost usage, model and context-window usage, session outcomes, and enough detail for a team’s AI owner/DRI to inspect or debug sessions. See [initial constraints](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=65s) and [user/UX fork](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=678s).
- **Research before committing to ingestion:** Claude Code, Codex, Pi, Open Code, and GitHub Copilot CLI expose different hook/plugin surfaces and different on-disk JSONL formats. The session’s research conclusion is that a per-agent adapter is unavoidable: use each agent’s best live-event surface, use transcript/JSONL tailing as a backstop, and normalize into one internal event schema. See [agent-agnostic ingestion research](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=1069s) and [adapter conclusion](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=1538s).
- **Capture architecture:** A hook can start a short-lived, per-session capture process (“sidecar”/listener) rather than requiring a machine-wide daemon that users may forget to run. Hooks alone are insufficient because they may lack full message content; the capture process also reads local JSONL/transcript data. This remains an implementation direction, not a production-proven design. See [per-session capture decision](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=3075s).
- **Privacy and ownership are product constraints:** Coding sessions may contain secrets, PII, and unfinished thoughts. The stream considers consent and visibility explicitly, favors organization-owned on-prem data, and places OIDC/enterprise identity in a later version. A simpler v1 idea is an admin-minted, revocable per-user token. See [consent and visibility](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=813s), [self-hosting](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=926s), and [v1 auth/v2 OIDC](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=3650s).
- **Use precise domain language:** The emerging model is a `session` (one logical run of one coding agent attached to one developer, working directory, and agent version); a `turn` (one user message plus the full assistant response); and a `model request` (one HTTP call to the model during a turn). Sessions can contain a DAG of turns; sub-agents are child sessions with a parent ID. Resume/compaction semantics are intentionally left open until real data exposes the right shape. See [session/turn/model-request glossary](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=5190s) and [fork scenarios](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=4660s).
- **Proposed V1 shape:** A local listener reports events to a self-hosted server; the server stores them in Postgres and serves a dashboard/admin plane per organization. Polling every few seconds is considered adequate for an initial live view. See [architecture summary](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=5780s) and [simple polling option](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=4010s).
- **Workflow lesson:** Research documents preserve the useful decisions; a compact `context.md`/ubiquitous-language file keeps later sessions aligned; ADRs capture architectural decisions. The speaker repeatedly prefers validating a thin working version over endlessly resolving abstract questions. See [research-to-domain-model transition](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=2320s), [context language](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=5090s), and [get to an asset](https://www.youtube.com/watch?v=K-mA3MZ_EzU&t=4210s).

**Actionable rule:** Before building an agent platform, define the user and decision it supports, research each integration surface, write a canonical event model, make ownership/auth explicit, and defer uncertain semantics until a small real-data slice can test them.

### 4. What is Loop Engineering? — KodeKloud

**Source:** [YouTube video](https://www.youtube.com/watch?v=yvP_AAirOQc) · 6:47 · [official description and chapter list](https://www.youtube.com/watch?v=yvP_AAirOQc)

The video uses “loop engineering” for the shift from human-initiated, one-task-at-a-time prompting toward systems where an agent can decide and execute the next step with less direct human initiation.

It presents five supporting components:

1. **Automation:** scheduled/self-prompted work, such as checking CI failures, triaging issues, or hunting bugs.
2. **Git worktrees:** separate directories/branches so concurrent agent work does not corrupt another task’s runtime or files.
3. **Skills:** job-specific procedures and know-how that persist outside the immediate prompt.
4. **Plugins/connectors:** access to external systems such as Notion or Stripe through integrations/MCP.
5. **Sub-agents:** decomposition into focused workers, including an independent checker that improves safety and stability.

See the [five-component explanation](https://www.youtube.com/watch?v=yvP_AAirOQc&t=90s), [skills/connectors](https://www.youtube.com/watch?v=yvP_AAirOQc&t=213s), and [sub-agent checker](https://www.youtube.com/watch?v=yvP_AAirOQc&t=296s).

The video emphasizes that “loop engineering” has no governing definition, and that optional memory may be layered on top. The core trade-off is increasing agent initiative versus increasing the risk of unattended errors compounding; checks and balances are therefore part of the design, not an afterthought. See [definition limits and safety warning](https://www.youtube.com/watch?v=yvP_AAirOQc&t=328s).

**Actionable rule:** Do not call a workflow autonomous until it has an explicit trigger, isolated execution environment, required skills/connectors, an independent check, and a way to stop or review failures.

## Cross-video themes

### 1. Reduce ambiguity before increasing autonomy

Skills use explicit triggers and compact terminology; monorepos use package boundaries and entrypoints; Slop Watch uses `session`, `turn`, and `model request`; loops use named components. The common move is to make the system’s units legible to both humans and agents before asking the agent to act independently.

### 2. Keep the hot path small and put detail behind stable seams

Branch-specific skill references stay outside the main `SKILL.md`; shared domain logic sits behind package APIs; agent-specific formats are hidden behind adapters; a loop’s components separate scheduling, isolation, expertise, reach, and review. This limits context load and makes replacement easier.

### 3. Human control moves to higher-leverage checkpoints

The skills talk balances explicit user activation against model activation. The livestream uses grilling, research, glossary review, and ADRs to align the human and agent before implementation. Loop engineering moves routine execution away from the human but restores safety through independent checks, worktree isolation, and reviewable artifacts.

### 4. Observability is part of the product and the workflow

The monorepo workflow narrows checks to the changed package. Slop Watch treats sessions and costs as first-class data. Loop engineering needs checks that detect compounded errors. “It ran” or “the build passed” is not enough evidence that the work was useful or safe.

### 5. Autonomy without isolation is a liability

Worktrees isolate concurrent code changes; per-session listeners isolate capture processes; self-hosting keeps sensitive session data within the organization; auth and revocation bound access; independent sub-agents challenge the main agent. These are complementary controls for the same risk: unattended actions can propagate farther than expected.

## Practical adoption sequence

1. **Name the domain:** write a short glossary and identify the user decision the workflow supports.
2. **Create the smallest seam:** define one package/module or one skill with a clear input, output, and focused verification command.
3. **Instrument one real slice:** capture the minimum event data needed to explain cost, outcome, and failure; normalize vendor-specific formats behind adapters.
4. **Add isolation:** use a worktree or equivalent sandbox for concurrent/autonomous changes; keep deployable units independently releasable.
5. **Add the loop last:** schedule a narrow task, provide only the necessary skill/connectors, require an independent check, and retain a human approval gate for external or destructive actions.
6. **Prune continuously:** delete duplicated, stale, irrelevant, or behaviorally inert instructions and simplify modules that become hard to change.

## Limitations and confidence

- **Source confidence:** High for titles, descriptions, chapters, and claims directly stated in the videos; medium for wording reconstructed from YouTube auto-captions.
- **Livestream status:** The Matt Pocock video is exploratory. It records research, naming, domain modeling, and tentative V1 decisions; it does not demonstrate a finished observability product. Treat the proposed adapter/capture/auth architecture as hypotheses to validate.
- **Implementation claims:** The monorepo video is a personal workflow demonstration, not a comparative benchmark. Bun/Turborepo suitability depends on repository size, team conventions, CI, and deployment environment.
- **Terminology:** “Loop engineering” is presented as an emerging, non-governed term. The five components are a useful framing, not a universal standard.
- **Evidence gap:** None of the videos supplies controlled measurements proving that a particular skill invocation mode, monorepo layout, polling interval, or model/tool combination is always superior. Validate locally with focused user-visible checks and cost/outcome measurements.
