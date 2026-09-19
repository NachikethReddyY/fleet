import subprocess
import tempfile
import unittest
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
CHECKER = REPO_ROOT / "scripts" / "check-skill-references.py"


class SkillReferenceCheckerTest(unittest.TestCase):
    def run_checker(self, root: Path) -> subprocess.CompletedProcess[str]:
        return subprocess.run(
            ["python3", str(CHECKER), "--root", str(root)],
            text=True,
            capture_output=True,
            check=False,
        )

    def test_accepts_resolving_local_markdown_links_and_routes(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "skills" / "thread-analysis").mkdir(parents=True)
            (root / "skills" / "skill-audit").mkdir(parents=True)
            (root / "workflows").mkdir()
            (root / "skills" / "thread-analysis" / "SKILL.md").write_text(
                "[audit](../skill-audit/SKILL.md)\n", encoding="utf-8"
            )
            (root / "skills" / "skill-audit" / "SKILL.md").write_text(
                "# Audit\n", encoding="utf-8"
            )
            (root / "workflows" / "thread-analysis.md").write_text(
                "target: thread-analysis\n", encoding="utf-8"
            )
            (root / "workflows" / "weekly-skill-health.md").write_text(
                "target: skill-audit\n", encoding="utf-8"
            )

            result = self.run_checker(root)

            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_rejects_a_missing_relative_markdown_link(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "skills" / "thread-analysis").mkdir(parents=True)
            (root / "skills" / "skill-audit").mkdir(parents=True)
            (root / "workflows").mkdir()
            (root / "skills" / "thread-analysis" / "SKILL.md").write_text(
                "[missing](../missing/SKILL.md)\n", encoding="utf-8"
            )
            (root / "skills" / "skill-audit" / "SKILL.md").write_text(
                "# Audit\n", encoding="utf-8"
            )
            (root / "workflows" / "thread-analysis.md").write_text(
                "target: thread-analysis\n", encoding="utf-8"
            )
            (root / "workflows" / "weekly-skill-health.md").write_text(
                "target: skill-audit\n", encoding="utf-8"
            )

            result = self.run_checker(root)

            self.assertNotEqual(result.returncode, 0)
            self.assertIn("skills/missing/SKILL.md", result.stdout)

    def test_rejects_a_missing_relative_json_resource(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "skills" / "thread-analysis").mkdir(parents=True)
            (root / "skills" / "skill-audit").mkdir(parents=True)
            (root / "workflows").mkdir()
            (root / "skills" / "thread-analysis" / "SKILL.md").write_text(
                "[schema](references/episode.schema.json)\n", encoding="utf-8"
            )
            (root / "skills" / "skill-audit" / "SKILL.md").write_text(
                "# Audit\n", encoding="utf-8"
            )
            (root / "workflows" / "thread-analysis.md").write_text(
                "target: thread-analysis\n", encoding="utf-8"
            )
            (root / "workflows" / "weekly-skill-health.md").write_text(
                "target: skill-audit\n", encoding="utf-8"
            )

            result = self.run_checker(root)

            self.assertNotEqual(result.returncode, 0)
            self.assertIn("references/episode.schema.json", result.stdout)

    def test_rejects_a_missing_mandatory_workflow_skill(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "skills" / "thread-analysis").mkdir(parents=True)
            (root / "workflows").mkdir()
            (root / "skills" / "thread-analysis" / "SKILL.md").write_text(
                "# Thread analysis\n", encoding="utf-8"
            )
            (root / "workflows" / "thread-analysis.md").write_text(
                "target: thread-analysis\n", encoding="utf-8"
            )
            (root / "workflows" / "weekly-skill-health.md").write_text(
                "target: skill-audit\n", encoding="utf-8"
            )

            result = self.run_checker(root)

            self.assertNotEqual(result.returncode, 0)
            self.assertIn("mandatory skill route 'skill-audit'", result.stdout)


if __name__ == "__main__":
    unittest.main()
