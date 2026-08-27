---
name: monorepo
description: Evaluate or change a repository whose products, packages, or deployables may belong in one workspace. Decide between one package, a monorepo, and separate repositories; use pnpm and Turborepo for compatible JavaScript or TypeScript workspaces.
---

# Monorepo

Choose the smallest repository boundary that supports atomic changes without
combining unrelated ownership or release lifecycles.

## Decide the repository boundary

Inspect the deployable applications, CLIs, workers, published libraries,
shared contracts, ownership, release boundaries, language toolchains, package
manager configuration, and units that repeatedly change together.

Recommend one of three shapes:

- **Single package** when there is one coherent code unit or deployable.
  Documents, scripts, skills, and folders do not independently justify package
  boundaries.
- **Monorepo** when two or more real code units share ownership and need atomic
  changes, stable contracts, or coordinated verification. Preserve independent
  deployment and release boundaries where the product requires them.
- **Separate repositories** when units rarely change together or their
  ownership, security, compliance, tooling, or release lifecycles are more
  important than atomic cross-unit changes.

Treat independent release needs as a boundary inside a monorepo only after
shared ownership or atomic changes justify keeping the units together.

For a decision-only request, report the observed units, coupling evidence,
constraints, one recommendation, and its main tradeoff. Stop without changing
the repository.

## Preserve or choose tooling

Preserve an established package manager and task orchestrator unless the user
authorizes a migration and a concrete repository constraint or measured
benefit justifies it.

For a new or compatible JavaScript or TypeScript workspace without an
established constraint, use pnpm workspaces and Turborepo. Use ecosystem-native
workspace tooling for non-JavaScript repositories; introduce a cross-language
orchestrator only when one task graph must coordinate those toolchains.

Before editing, name the proposed units, public entrypoints, dependency
direction, release boundaries, chosen tooling, and any tooling migration.

## Shape the package graph

Package by ownership and deployability, not by file type. Create a package only
when it has a stable public entrypoint, a distinct dependency boundary, at
least two consumers of a shared contract, or an independent build or release
role.

Make dependency direction explicit. Prefer applications depending on domain or
contract packages, which may depend on infrastructure adapters. Every
cross-package import must use a declared workspace dependency and public
export. Keep the package graph acyclic and name any exception to the preferred
layering.

Keep runtime dependencies in the package that uses them and root dependencies
limited to repository-wide tooling. Each package owns the commands appropriate
to its role, such as `dev`, `check`, `test`, `build`, and `format`.

Add an adapter after a second genuine integration needs variation. Add a
generic shared package after two consumers need a stable contract.

## Configure Turborepo

When Turborepo is selected, let it own task ordering, caching, filtering, and
deployment pruning. Root package scripts delegate to `turbo run`; direct shell
commands use the repository-local binary through `pnpm exec turbo`.

Make `turbo.json` reflect the real task graph:

- use `dependsOn` for task ordering;
- declare file `outputs` for cacheable tasks;
- include environment variables and non-default inputs that affect outputs;
- mark persistent development tasks with `persistent: true` and `cache: false`.

Use the narrow filter that proves the change:

```sh
pnpm exec turbo run check test --filter=<package>...
pnpm exec turbo run check test --filter=...<changed-package>
pnpm exec turbo run build --filter=<app>...
```

The suffix includes a package's dependencies; the prefix includes its
dependents. Use `--dry=json` when the selected task scope is uncertain. Run
workspace-wide checks only when the change crosses the whole workspace or
before release.

Use `pnpm exec turbo prune` only when a deployment needs a partial workspace,
such as a container build.

## Make structural changes safely

State the behavior, data, public API, and release invariants that must survive.
Move one thin vertical slice at a time while preserving package entrypoints and
dependency direction.

For a conversion that relocates packages, configuration, dependencies, or
public APIs, use the migration workflow. Keep a rollback path until the
repository's lockfile-enforcing install, focused checks, affected-consumer
checks, and affected application build pass. Use a temporary compatibility
entrypoint when dependents cannot migrate atomically.

Record the affected package, old and new public entrypoints, dependents,
release boundary, rollback step, and preservation proof.

## Completion

For an authorized workspace change, finish when:

- the package manager recognizes every intended workspace;
- declared dependencies and public exports resolve without package cycles;
- focused checks pass for changed packages and affected consumers;
- each affected application builds or runs through its declared entrypoint;
- the lockfile is consistent and commands work without globally installed
  repository tools.

Match proof to the requested outcome. Directly verify user-visible behavior
when the changed application has an interface; report unavailable proof as
unverified. Stop at the requested stage without implicitly migrating tooling,
release configuration, or deployment infrastructure.
