#!/usr/bin/env python3
"""Score manually supplied, redacted, comparable user-task episodes locally."""

import argparse
import json
import math
import sys
from collections import defaultdict
from pathlib import Path

EPISODE_FIELDS = {"id", "episode_key", "revision", "classification", "assignment", "acceptance", "revised_acceptance", "comparison_group", "status", "outcome", "outcome_proof", "hints", "retries", "tool_failure", "harness", "model", "response_count", "usage", "cost", "notes"}
COST_FIELDS = {"amount", "kind", "currency", "window", "source", "price_date"}
DISALLOWED = {"raw_log", "raw_prompt", "raw_response", "transcript", "messages", "credential", "credentials", "secret", "api_key"}
OUTCOMES = {"pass", "fail", "partial", "unknown"}
STATUSES = {"assessed", "interrupted", "tool_blocked", "unassessed"}
CLASSES = {"root", "child", "metadata"}
KINDS = {"billed", "rate_card_estimate"}


class ValidationError(ValueError):
    pass


def require_string(value, path):
    if not isinstance(value, str) or not value:
        raise ValidationError(f"{path} must be a non-empty string")


def require_count(value, path):
    if not isinstance(value, int) or isinstance(value, bool) or value < 0:
        raise ValidationError(f"{path} must be a non-negative integer")


def reject_raw(value, path=""):
    if isinstance(value, dict):
        for key, nested in value.items():
            nested_path = f"{path + '.' if path else ''}{key}"
            if key.lower() in DISALLOWED:
                raise ValidationError(f"disallowed field: {nested_path}")
            reject_raw(nested, nested_path)
    elif isinstance(value, list):
        for index, nested in enumerate(value):
            reject_raw(nested, f"{path}[{index}]")


def validate_cost(cost, path):
    if not isinstance(cost, dict) or set(cost) - COST_FIELDS:
        raise ValidationError(f"{path} has invalid fields")
    amount = cost.get("amount")
    if not isinstance(amount, (int, float)) or isinstance(amount, bool) or not math.isfinite(amount) or amount < 0:
        raise ValidationError(f"{path}.amount must be finite and non-negative")
    if not isinstance(cost.get("kind"), str) or cost["kind"] not in KINDS:
        raise ValidationError(f"{path}.kind must be billed or rate_card_estimate")
    for name in ("currency", "window"):
        require_string(cost.get(name), f"{path}.{name}")
    for name in ("source", "price_date"):
        if name in cost:
            require_string(cost[name], f"{path}.{name}")
    if cost["kind"] == "rate_card_estimate":
        for name in ("source", "price_date"):
            require_string(cost.get(name), f"{path}.{name}")


def validate(document):
    if not isinstance(document, dict) or type(document.get("schema_version")) is not int or document["schema_version"] != 1:
        raise ValidationError("schema_version must be 1")
    if set(document) - {"schema_version", "comparison_groups", "episodes"}:
        raise ValidationError("document has unknown fields")
    groups, episodes = document.get("comparison_groups"), document.get("episodes")
    if not isinstance(groups, list) or not groups:
        raise ValidationError("comparison_groups must be a non-empty array")
    if not isinstance(episodes, list):
        raise ValidationError("episodes must be an array")
    group_map = {}
    for index, group in enumerate(groups):
        path = f"comparison_groups[{index}]"
        if not isinstance(group, dict) or set(group) != {"id", "acceptance"}:
            raise ValidationError(f"{path} must contain only id and acceptance")
        require_string(group.get("id"), f"{path}.id")
        require_string(group.get("acceptance"), f"{path}.acceptance")
        if group["id"] in group_map:
            raise ValidationError(f"duplicate comparison group: {group['id']}")
        group_map[group["id"]] = group
    reject_raw(document)
    identifiers = set()
    for index, episode in enumerate(episodes):
        path = f"episodes[{index}]"
        if not isinstance(episode, dict):
            raise ValidationError(f"{path} must be an object")
        unknown = set(episode) - EPISODE_FIELDS
        if unknown:
            raise ValidationError(f"unknown field: {path}.{sorted(unknown)[0]}")
        require_string(episode.get("id"), f"{path}.id")
        if episode["id"] in identifiers:
            raise ValidationError(f"duplicate id: {episode['id']}")
        identifiers.add(episode["id"])
        if not isinstance(episode.get("classification"), str) or episode["classification"] not in CLASSES:
            raise ValidationError(f"{path}.classification must be root, child, or metadata")
        require_string(episode.get("comparison_group"), f"{path}.comparison_group")
        if episode["comparison_group"] not in group_map:
            raise ValidationError(f"{path}.comparison_group is not predeclared")
        for name in ("episode_key", "acceptance", "revised_acceptance", "assignment", "harness", "tool_failure", "notes"):
            if name in episode:
                require_string(episode[name], f"{path}.{name}")
        for name in ("revision", "hints", "retries", "response_count"):
            if name in episode:
                require_count(episode[name], f"{path}.{name}")
        status = episode.get("status", "assessed")
        if not isinstance(status, str) or status not in STATUSES:
            raise ValidationError(f"{path}.status is invalid")
        proof = episode.get("outcome_proof", [])
        if not isinstance(proof, list) or not all(isinstance(item, str) and item for item in proof):
            raise ValidationError(f"{path}.outcome_proof must be an array of redacted evidence pointers")
        if "outcome" in episode and (not isinstance(episode["outcome"], str) or episode["outcome"] not in OUTCOMES):
            raise ValidationError(f"{path}.outcome is invalid")
        if "model" in episode:
            model = episode["model"]
            if not isinstance(model, dict) or set(model) - {"exact_id", "reasoning_effort"}:
                raise ValidationError(f"{path}.model has invalid fields")
            for name, value in model.items():
                require_string(value, f"{path}.model.{name}")
        if "usage" in episode:
            usage = episode["usage"]
            if not isinstance(usage, dict) or set(usage) - {"cached_input", "uncached_input", "output"}:
                raise ValidationError(f"{path}.usage has invalid fields")
            for name, value in usage.items():
                require_count(value, f"{path}.usage.{name}")
        if "cost" in episode:
            validate_cost(episode["cost"], f"{path}.cost")
    return episodes, group_map


def select_latest(episodes):
    buckets = defaultdict(list)
    excluded = {"duplicate": 0, "metadata": 0, "unassigned_child": 0}
    for episode in episodes:
        if episode["classification"] == "metadata":
            excluded["metadata"] += 1
        elif episode["classification"] == "child" and not episode.get("assignment"):
            excluded["unassigned_child"] += 1
        else:
            buckets[episode.get("episode_key", episode["id"])].append(episode)
    selected = []
    for key, records in buckets.items():
        revisions = defaultdict(list)
        for record in records:
            revisions[record.get("revision", 0)].append(record)
        for revision, same_revision in revisions.items():
            facts = {json.dumps({name: value for name, value in record.items() if name != "id"}, sort_keys=True) for record in same_revision}
            if len(facts) > 1:
                raise ValidationError(f"conflicting records for episode_key {key} revision {revision}")
        selected.append(revisions[max(revisions)][0])
        excluded["duplicate"] += len(records) - 1
    return selected, excluded


def assess(episode):
    status = episode.get("status", "assessed")
    if status != "assessed":
        return status, None
    if not episode.get("acceptance") and not episode.get("revised_acceptance"):
        return "unassessed", "missing acceptance criterion"
    if "outcome" not in episode:
        return "unassessed", "missing outcome"
    if not episode.get("outcome_proof"):
        return "unassessed", "missing outcome_proof"
    return episode["outcome"], None


def score(episodes, groups):
    selected, excluded = select_latest(episodes)
    reports = {identifier: {"id": identifier, "acceptance": group["acceptance"], "counts": dict.fromkeys(["eligible", "pass", "fail", "partial", "unknown", "interrupted", "tool_blocked", "unassessed"], 0), "cost_coverage": {"eligible_assessed": 0, "with_cost": 0, "missing_cost": 0}} for identifier, group in groups.items()}
    results, costs = [], defaultdict(lambda: {"amount": 0, "attempted_items": 0, "accepted_items": 0})
    for episode in selected:
        outcome, note = assess(episode)
        report = reports[episode["comparison_group"]]
        report["counts"]["eligible"] += 1
        report["counts"][outcome] += 1
        record = {"id": episode["id"], "episode_key": episode.get("episode_key", episode["id"]), "revision": episode.get("revision", 0), "comparison_group": episode["comparison_group"], "assessed_outcome": outcome}
        if note:
            record["assessment_note"] = note
        results.append(record)
        if outcome not in {"pass", "fail"}:
            continue
        coverage = report["cost_coverage"]
        coverage["eligible_assessed"] += 1
        if "cost" not in episode:
            coverage["missing_cost"] += 1
            continue
        coverage["with_cost"] += 1
        cost = episode["cost"]
        key = (episode["comparison_group"], cost["kind"], cost["currency"], cost["window"])
        costs[key]["amount"] += cost["amount"]
        costs[key]["attempted_items"] += 1
        costs[key]["accepted_items"] += outcome == "pass"
    for report in reports.values():
        counts = report["counts"]
        denominator = counts["pass"] + counts["fail"]
        report["pass_rate"] = {"numerator": counts["pass"], "denominator": denominator, "value": counts["pass"] / denominator if denominator else None}
    cost_groups = []
    for (group, kind, currency, window), values in sorted(costs.items()):
        cost_groups.append({"comparison_group": group, "kind": kind, "currency": currency, "window": window, **values, "cost_per_accepted_item": values["amount"] / values["accepted_items"] if values["accepted_items"] else None})
    return {"schema_version": 1, "excluded": excluded, "comparison_groups": list(reports.values()), "episodes": results, "cost_groups": cost_groups}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    args = parser.parse_args()
    try:
        document = json.loads(args.input.read_text(encoding="utf-8"))
        print(json.dumps(score(*validate(document)), indent=2, sort_keys=True))
    except (OSError, json.JSONDecodeError, ValidationError) as error:
        print(f"score-episodes: {error}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
