# Using Claude and Codex sub-agents

This guide covers two related workflows:

1. Open the WebUI and add a Claude sub-agent.
2. Use Claude and Codex sub-agents from Claude Code and Codex.

The exact button names can change between WebUI releases. Use the provider and model names shown by your installation instead of copying an unavailable model ID.

## 1. Open the WebUI and add a Claude sub-agent

### Open the WebUI

1. Open the WebUI URL for your workspace. Use the private URL supplied by your administrator or the link in the app where you run Codex. Do not publish that URL if it is private.
2. Sign in with the account that has access to the workspace.
3. Open the project or conversation where you want to work.
4. Confirm that the workspace shows the sub-agent or delegation controls. If those controls are missing, your account, provider connection, or workspace may not have delegation enabled.

### Add Claude

1. Open **Settings**, **Providers**, **Models**, or the equivalent provider-management screen.
2. Choose **Add provider** or **Add model**.
3. Select **Claude** or **Anthropic**.
4. Choose the authentication method required by the WebUI:
   - an existing connected Anthropic account, or
   - an Anthropic API key stored in the WebUI's secret store.
5. Select a Claude model that the account can use. Copy the model ID from the WebUI rather than guessing it.
6. Save the provider, then run a small test prompt such as:

   ```text
   Reply with exactly: claude-connected
   ```

7. Check the run details. The provider should be Claude or Anthropic, and the model should match the model you selected.

### Create the Claude sub-agent

1. Open the WebUI's **Agents**, **Sub-agents**, or **Delegation** panel.
2. Choose **New sub-agent**.
3. Give it a narrow role, for example `claude-reviewer`.
4. Set its provider to Claude and select the connected Claude model.
5. Give it a focused instruction. A useful starting prompt is:

   ```text
   Review the requested change for correctness and missing edge cases.
   Do not edit files. Return findings with file names and line numbers.
   ```

6. Set the permissions and working directory deliberately. Read-only review is a good first test.
7. Save the sub-agent and run it on a small task. Record the sub-agent name and model ID so you can refer to them from Claude Code or Codex.

Keep API keys in the WebUI's secret store or your local credential manager. Do not put keys in Markdown, prompts, screenshots, shell history, or the repository.

## 2. Use Codex and Claude sub-agents in Claude Code and Codex

There are two parts to a delegated run:

- The **parent** is the agent you are currently talking to.
- The **sub-agent** is a child run with its own provider, model, instructions, and permissions.

Ask the parent to delegate a bounded job. Include the files or symbols to inspect, the output you want, and whether the child may edit files.

### Use a Claude sub-agent from Codex

In Codex, ask for delegation explicitly. For example:

```text
Use the WebUI sub-agent `claude-reviewer` to review src/auth.ts.
Read-only review. Report concrete bugs, security concerns, and missing tests.
Do not change files.
```

If you are using the T3 Code orchestration tools directly, the sequence is:

1. Discover the available provider instances and model IDs.
2. Delegate the task to the Claude provider and selected model.
3. Keep the returned task ID.
4. Poll the task status until it completes or fails.
5. Read the child result and verify its claims against the repository.

Do not invent a provider instance ID or model ID. If Claude is not listed, return to the WebUI setup and connect the provider first.

### Use a Codex sub-agent from Claude Code

In Claude Code, ask Claude to delegate a separate, focused job to the Codex sub-agent configured in the WebUI. For example:

```text
Use the Codex sub-agent `codex-implementer` to update the parser in src/parser.ts.
First inspect the existing tests. Keep the change limited to the parser and its tests.
Return the files changed and the verification command.
```

The Codex child should work in the intended repository and branch or worktree. Before it edits, check that the parent and child agree on:

- the repository and worktree,
- the allowed files,
- whether commits are allowed,
- the verification command, and
- the stop condition.

After the child returns, inspect the diff and run the focused check yourself. A child report is evidence about what it did, not proof that the change works.

### Use both sub-agents for one task

For a change that benefits from implementation and review, use a simple sequence:

1. Ask the Codex sub-agent to implement the smallest requested change.
2. Inspect the diff and run the focused test.
3. Ask the Claude sub-agent to review the diff and test result in read-only mode.
4. Fix valid findings in the parent session.
5. Run the focused test again and inspect the final diff.

Example request to the parent:

```text
Have `codex-implementer` make the smallest implementation for this issue.
After I inspect and test the diff, have `claude-reviewer` review the final diff
read-only. Do not commit or publish anything unless I explicitly ask.
```

### Troubleshooting

| Symptom | What to check |
| --- | --- |
| Claude is not available | The Anthropic provider is not connected, the model is unavailable, or delegation is disabled for the workspace. |
| Codex is not available | The Codex provider or model is not configured in the WebUI, or the current account cannot use it. |
| The child edits the wrong files | Restate the repository, worktree, allowed files, and permission boundary before delegating. |
| The child task never finishes | Keep the task ID, inspect its status, and cancel the task if the orchestration UI provides cancellation. Do not start a duplicate task without checking the first one. |
| The result looks correct but the feature fails | Reproduce the behavior in the real project and run the focused verification yourself. |

