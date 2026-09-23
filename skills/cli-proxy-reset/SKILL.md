---
name: cli-proxy-reset
description: Reset a CLIProxyAPI management-IP lockout by safely restarting the owning service. Use when CLI Proxy reports HTTP 403 with "IP banned due to too many failed attempts" or the user asks to reset or unban CLI Proxy; do not use for provider rate limits or account bans.
---

# CLI Proxy Reset

Clear CLIProxyAPI's in-memory management authentication ban without handling the management key.

## Authorization and impact

A direct request to reset or unban CLI Proxy authorizes restarting only the identified CLIProxyAPI service. A restart briefly interrupts requests through the proxy. If the user is only asking why the error occurred or how resets work, explain without restarting anything.

Do not read, request, print, store, or test the management key. Do not probe a protected management endpoint without a key: a missing or invalid credential can add another failed attempt.

## Reset

1. Identify the running CLIProxyAPI process and its supervisor with read-only checks. On this Mac, the expected service is Homebrew `cliproxyapi`, process `cliproxyapi`, and launchd label `sh.brew.cliproxyapi`.
2. If Homebrew owns it, run [`scripts/reset_homebrew.sh`](scripts/reset_homebrew.sh). Use `--dry-run` when the request does not authorize a restart.
3. If another supervisor owns the process, restart only that specific service using its normal non-destructive restart command. Do not kill unrelated proxy processes or guess a container/service name.
4. Verify that the supervisor reports the service running and that a live `cliproxyapi` process exists. A changed PID is direct evidence that an already-running process restarted.
5. Tell the user the reset state and ask them to retry with their existing key. Do not claim authenticated management access works unless it was tested with a credential the user deliberately supplied for that test.

## Boundaries

- A service restart clears the temporary in-memory IP ban; it does not change the failed-attempt threshold, management configuration, or key.
- Do not weaken or disable authentication, remote-management restrictions, or rate limiting as part of a reset.
- If the process immediately exits or the supervisor cannot restart it, report the exact service state and stop. Do not loop restarts.
- If lockouts recur, diagnose missing-key requests, reverse-proxy client-IP handling, or stale browser credentials as a separate task.
