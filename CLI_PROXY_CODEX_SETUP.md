# Use Codex through the team proxy

CLIProxyAPI runs on Nachiketh's Mac. Tailscale Serve makes it available to devices on the same Tailnet at:

```text
https://nachikeths-macbook-air.tailaf0363.ts.net/v1
```

Your Codex process runs on your own computer. Model requests go through the proxy. The host Mac must be awake, connected to Tailscale, and running CLIProxyAPI. The proxy shares its configured upstream accounts and limits across clients.

## 1. Get access

1. Install Tailscale and sign in with an account that has access to the host Mac's Tailnet. Ask Nachiketh for access if the host does not appear in your Tailscale devices.
2. Install the Codex CLI on your computer using the [official CLI instructions](https://learn.chatgpt.com/docs/codex/cli).
3. Get the CLIProxyAPI client API key from Nachiketh through a private channel. Do not put the key in this guide, a repository, a screenshot, or a chat with wider access.

Check network access first:

```sh
curl -i https://nachikeths-macbook-air.tailaf0363.ts.net/v1/models
```

An HTTP `401` response means you reached the proxy and need the API key. A DNS, connection, or TLS error means the Tailnet connection or host needs attention.

## 2. Set the key for your terminal session

On macOS or Linux, run this in the terminal where you will start Codex. The prompt hides what you type:

```sh
read -r -s 'CLIPROXY_API_KEY?Proxy API key: '
export CLIPROXY_API_KEY
printf '\n'
```

For Bash on Linux, use `read -r -s -p 'Proxy API key: ' CLIPROXY_API_KEY` instead of the first line. Then run the `export` and `printf` lines.

On Windows PowerShell, run:

```powershell
$secret = Read-Host 'Proxy API key' -AsSecureString
$ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secret)
try { $env:CLIPROXY_API_KEY = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr) }
finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr) }
Remove-Variable secret, ptr
```

These commands set the key only for the current terminal session. Start Codex from that same terminal. For a desktop app, configure the key in an appropriate user-level secret or environment setting before launching the app. A terminal-only variable may not reach an app launched from the Dock or Start menu.

## 3. Configure Codex

Edit `~/.codex/config.toml` on macOS or Linux, or `%USERPROFILE%\.codex\config.toml` on Windows. Create the file and parent directory if needed. Add these settings, or update the corresponding values if you already have them:

```toml
model_provider = "cliproxyapi"
model = "gpt-6-astra"

[model_providers.cliproxyapi]
name = "CLIProxyAPI"
base_url = "https://nachikeths-macbook-air.tailaf0363.ts.net/v1"
env_key = "CLIPROXY_API_KEY"
wire_api = "responses"
```

Keep your other Codex settings. TOML allows only one `[model_providers.cliproxyapi]` table, so edit an existing table instead of adding a second one. The `model` shown above is currently available on this proxy; you can select another available model later. Codex's [configuration reference](https://learn.chatgpt.com/docs/config-file/config-reference) documents `model_provider`, `base_url`, `env_key`, and `wire_api`.

## 4. Test Codex

From the same terminal, go to a local Git project and run:

```sh
codex exec 'Reply with exactly: proxy-ok'
```

The run should show `provider: cliproxyapi` and reply `proxy-ok`. To check the API key and available models directly, macOS and Linux users can run:

```sh
curl -fsS https://nachikeths-macbook-air.tailaf0363.ts.net/v1/models \
  -H "Authorization: Bearer $CLIPROXY_API_KEY"
```

On PowerShell, use:

```powershell
Invoke-RestMethod 'https://nachikeths-macbook-air.tailaf0363.ts.net/v1/models' `
  -Headers @{ Authorization = "Bearer $env:CLIPROXY_API_KEY" }
```

## If it does not work

| Symptom | Check |
| --- | --- |
| DNS, connection, or TLS error | Confirm Tailscale is connected on both machines and that the host Mac is awake. |
| HTTP `401` | Check that `CLIPROXY_API_KEY` is set in the same terminal and that you received the current client key. |
| Codex uses a different provider | Check `model_provider` in your active `config.toml` and any Codex profile or command-line override. |
| Model unavailable or upstream limit | List `/v1/models`; ask the proxy owner about account availability or limits. |

This address is private to the Tailnet. Do not use Tailscale Funnel or expose port `8317` to the public internet.
