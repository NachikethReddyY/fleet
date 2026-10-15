---
name: postplan-read
description: Fetch and read an uploaded Postplan draft's raw HTML from its draft URL using curl. Use when the user supplies a postplan.dev or custom draft URL and wants the HTML content.
---

# Postplan Read

Read a Postplan draft through its shell-facing raw URL. Do not use web search or a browser for this.

1. Start with the supplied URL.
2. Remove one trailing slash if present.
3. Append `/raw` unless the URL already ends in `/raw`.
4. Run exactly:

```sh
curl --fail --silent --show-error --location --max-time 30 --output /tmp/postplan.html '<raw-url>'
```

5. Read `/tmp/postplan.html`.
6. If `curl` fails, report the actual HTTP status or network error. Do not substitute search results or guessed content.

Use `<raw-url>` as the rewritten URL, not the original draft URL.

For an HTML draft, use the exact file content returned by `curl`; do not summarize it unless asked.