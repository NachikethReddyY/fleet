#!/usr/bin/env python3
"""Focused regression tests for the manual episode scorer."""

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "score-episodes.py"


def episode(identifier, **extra):
    record = {"id": identifier, "classification": "root", "comparison_group": "report", "acceptance": "renders report", "outcome": "pass", "outcome_proof": [f".evidence/{identifier}.txt"]}
    record.update(extra)
    return record


def document(*episodes):
    return {"schema_version": 1, "comparison_groups": [{"id": "report", "acceptance": "renders report"}], "episodes": list(episodes)}


class ScoreEpisodesTests(unittest.TestCase):
    def invoke(self, payload):
        with tempfile.TemporaryDirectory() as directory:
            source = Path(directory) / "episodes.json"
            source.write_text(json.dumps(payload), encoding="utf-8")
            return subprocess.run([sys.executable, str(SCRIPT), str(source)], capture_output=True, text=True)

    def report(self, payload):
        result = self.invoke(payload)
        self.assertEqual(result.returncode, 0, result.stderr)
        return json.loads(result.stdout)

    def test_latest_revision_is_cumulative_snapshot_and_same_revision_conflicts_reject(self):
        old = episode("old", episode_key="task", revision=0, outcome="fail", cost={"amount": 2, "kind": "billed", "currency": "USD", "window": "2026-09"})
        new = episode("new", episode_key="task", revision=1, cost={"amount": 5, "kind": "billed", "currency": "USD", "window": "2026-09"})
        report = self.report(document(old, new))
        self.assertEqual(report["episodes"][0]["id"], "new")
        self.assertEqual(report["cost_groups"][0]["amount"], 5)
        self.assertEqual(report["excluded"]["duplicate"], 1)
        conflicting = self.invoke(document(episode("a", episode_key="task"), episode("b", episode_key="task")))
        self.assertIn("conflicting records", conflicting.stderr)

    def test_missing_acceptance_or_proof_and_blocked_states_are_not_failures(self):
        missing_acceptance = episode("missing-acceptance")
        del missing_acceptance["acceptance"]
        omitted_proof = episode("missing-proof")
        del omitted_proof["outcome_proof"]
        report = self.report(document(missing_acceptance, omitted_proof, episode("blocked", status="tool_blocked", outcome="fail"), episode("interrupted", status="interrupted", outcome="fail")))
        counts = report["comparison_groups"][0]["counts"]
        self.assertEqual((counts["fail"], counts["unassessed"], counts["tool_blocked"], counts["interrupted"]), (0, 2, 1, 1))
        self.assertEqual(report["comparison_groups"][0]["pass_rate"]["denominator"], 0)

    def test_metadata_unassigned_children_and_wrong_types_are_handled_safely(self):
        report = self.report(document(episode("metadata", classification="metadata"), episode("child", classification="child"), episode("assigned", classification="child", assignment="locate one caller")))
        self.assertEqual(report["excluded"], {"duplicate": 0, "metadata": 1, "unassigned_child": 1})
        self.assertEqual(report["comparison_groups"][0]["counts"]["pass"], 1)
        for field, value in (("episode_key", 3), ("acceptance", []), ("outcome", [])):
            result = self.invoke(document(episode("bad", **{field: value})))
            self.assertNotEqual(result.returncode, 0)
            self.assertIn(field, result.stderr)

    def test_model_usage_and_operational_metadata_are_allowed(self):
        report = self.report(document(episode("metadata", harness="codex", model={"exact_id": "gpt-x", "reasoning_effort": "high"}, response_count=2, usage={"cached_input": 1, "uncached_input": 2, "output": 3}, hints=1, retries=0, tool_failure="timeout", notes="redacted summary")))
        self.assertEqual(report["comparison_groups"][0]["counts"]["pass"], 1)
        raw = document(episode("unsafe"))
        raw["episodes"][0]["raw_log"] = "private"
        self.assertIn("disallowed field: episodes[0].raw_log", self.invoke(raw).stderr)

    def test_costs_remain_isolated_and_disclose_missing_eligible_cost(self):
        def cost(amount, kind="billed", currency="USD", window="2026-09", **more):
            return {"amount": amount, "kind": kind, "currency": currency, "window": window, **more}

        report = self.report(document(episode("pass", cost=cost(2)), episode("fail", outcome="fail", cost=cost(4)), episode("missing", outcome="fail"), episode("estimate", cost=cost(9, "rate_card_estimate", source="rate-card", price_date="2026-09-01")), episode("eur", cost=cost(8, currency="EUR")), episode("later", cost=cost(5, window="2026-10"))))
        billed = next(group for group in report["cost_groups"] if group["kind"] == "billed" and group["currency"] == "USD" and group["window"] == "2026-09")
        self.assertEqual((billed["amount"], billed["attempted_items"], billed["accepted_items"], billed["cost_per_accepted_item"]), (6, 2, 1, 6.0))
        self.assertEqual(len(report["cost_groups"]), 4)
        self.assertEqual(report["comparison_groups"][0]["cost_coverage"], {"eligible_assessed": 6, "with_cost": 5, "missing_cost": 1})
        invalid = self.invoke(document(episode("negative", cost=cost(-1))))
        self.assertIn("finite and non-negative", invalid.stderr)
        invalid_kind = self.invoke(document(episode("bad-kind", cost=cost(1, kind=[]))))
        self.assertIn("cost.kind", invalid_kind.stderr)
        estimate = self.invoke(document(episode("unpriced", cost=cost(1, "rate_card_estimate", source="rate-card"))))
        self.assertIn("price_date", estimate.stderr)

    def test_schema_version_is_not_boolean(self):
        payload = document(episode("a"))
        payload["schema_version"] = True
        result = self.invoke(payload)
        self.assertEqual(result.returncode, 2)
        self.assertIn("schema_version", result.stderr)

    def test_predeclared_groups_are_required(self):
        result = self.invoke(document(episode("other", comparison_group="different")))
        self.assertIn("not predeclared", result.stderr)


if __name__ == "__main__":
    unittest.main()
