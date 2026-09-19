#!/usr/bin/env python3
"""Check maintained local skill links and mandatory workflow skill routes."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


LOCAL_LINK = re.compile(r"\[[^\]]+\]\(([^)]+)\)")
MANDATORY_ROUTES = {
    Path("workflows/thread-analysis.md"): {"thread-analysis"},
    Path("workflows/weekly-skill-health.md"): {"skill-audit"},
}


def local_markdown_targets(source: Path) -> list[Path]:
    targets: list[Path] = []
    for raw_target in LOCAL_LINK.findall(source.read_text(encoding="utf-8")):
        target = raw_target.split("#", 1)[0]
        if not target or "://" in target or target.startswith(("#", "mailto:")):
            continue
        # Check path-shaped documentation links, not prose placeholders such as
        # `(canonical URL)` or shell syntax that happens to use parentheses.
        if " " in target or not (
            target.startswith(".")
            or Path(target).suffix.lower() in {".md", ".json", ".yaml", ".yml", ".toml"}
        ):
            continue
        targets.append((source.parent / target).resolve())
    return targets


def check(root: Path) -> list[str]:
    errors: list[str] = []
    skills_root = root / "skills"
    for docs_root in (skills_root, root / "workflows"):
        if not docs_root.is_dir():
            continue
        for source in sorted(docs_root.rglob("*.md")):
            for target in local_markdown_targets(source):
                if not target.exists():
                    display = target.relative_to(root) if target.is_relative_to(root) else target
                    errors.append(f"{source.relative_to(root)}: missing local link {display}")

    for workflow, routes in MANDATORY_ROUTES.items():
        workflow_path = root / workflow
        if not workflow_path.is_file():
            errors.append(f"missing mandatory workflow {workflow}")
            continue
        text = workflow_path.read_text(encoding="utf-8")
        for route in routes:
            if not re.search(rf"^\s*target:\s*{re.escape(route)}\s*$", text, re.MULTILINE):
                errors.append(f"{workflow}: missing mandatory route declaration '{route}'")
            if not (skills_root / route / "SKILL.md").is_file():
                errors.append(f"{workflow}: mandatory skill route '{route}' is unavailable")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    root = args.root.resolve()
    errors = check(root)
    if errors:
        print("Skill reference check failed:")
        for error in errors:
            print(f"- {error}")
        return 1
    print("Skill reference check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
