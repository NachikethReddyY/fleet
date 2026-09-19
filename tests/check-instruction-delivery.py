#!/usr/bin/env python3
"""Verify the installed Codex loader, without running inference or printing its prompt."""
import json
import shutil
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def text_values(value):
    if isinstance(value, str):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from text_values(item)
    elif isinstance(value, dict):
        for item in value.values():
            yield from text_values(item)


def count_payload(cwd, global_text, project_text):
    result = subprocess.run(
        ["codex", "debug", "prompt-input"], cwd=cwd,
        capture_output=True, text=True, timeout=60, check=True,
    )
    payload = "\n".join(text_values(json.loads(result.stdout)))
    return {
        "global_copies": payload.count(global_text),
        "fleet_context_copies": payload.count(project_text),
    }


def main():
    if not shutil.which("codex"):
        raise SystemExit("Unverified: installed Codex CLI unavailable")
    global_text = (ROOT / "core-files/AGENTS.md").read_text().strip()
    project_text = (ROOT / "core-files/FLEET.md").read_text().strip()
    fleet = count_payload(ROOT, global_text, project_text)
    with tempfile.TemporaryDirectory(prefix="fleet-instructions-") as other:
        nonfleet = count_payload(other, global_text, project_text)
    expected = {"global_copies": 1, "fleet_context_copies": 1}
    if fleet != expected or nonfleet != {"global_copies": 1, "fleet_context_copies": 0}:
        raise SystemExit(f"Instruction delivery failed: Fleet={fleet}; outside Fleet={nonfleet}")
    print(json.dumps({"fleet": fleet, "outside_fleet": nonfleet,
                      "method": "installed Codex loader; no inference",
                      "limit": "does not prove other harness or already-open session reload"}, indent=2))


if __name__ == "__main__":
    main()
