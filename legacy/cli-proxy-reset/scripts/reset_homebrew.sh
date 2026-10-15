#!/bin/sh
set -eu

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is unavailable; cannot manage the cliproxyapi service." >&2
  exit 1
fi

if [ "${1:-}" = "--dry-run" ]; then
  echo "Would run: brew services restart cliproxyapi"
  exit 0
fi

if [ "$#" -ne 0 ]; then
  echo "Usage: $0 [--dry-run]" >&2
  exit 2
fi

old_pid=$(pgrep -x cliproxyapi 2>/dev/null || true)

brew services restart cliproxyapi

new_pid=$(pgrep -x cliproxyapi 2>/dev/null || true)
if [ -z "$new_pid" ]; then
  echo "CLIProxyAPI restart returned, but no live cliproxyapi process was found." >&2
  exit 1
fi

if ! kill -0 "$new_pid" 2>/dev/null; then
  echo "CLIProxyAPI process $new_pid is not alive after restart." >&2
  exit 1
fi

echo "CLIProxyAPI management ban reset."
echo "Previous PID: ${old_pid:-not running}"
echo "Current PID: $new_pid"
