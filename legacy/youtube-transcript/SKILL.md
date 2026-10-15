---
name: youtube-transcript
description: Retrieve a YouTube video's captions from the terminal with yt-dlp when a transcript, transcript-backed summary, or timestamped video notes are requested.
---

# YouTube transcript

Use `yt-dlp` as the default transcript source. It reads YouTube's public caption tracks without an API key and avoids opening a browser.

## Workflow

1. Extract the video URL or ID from the user's request and keep the URL as the source identity.
2. Confirm the prerequisite with `command -v yt-dlp`. If it is unavailable, report that prerequisite and suggest installing it with the user's package manager; do not install packages silently.
3. Inspect metadata and available captions:

   ```sh
   yt-dlp --no-warnings --skip-download --print '%(title)s\n%(channel)s\n%(upload_date)s\n%(duration_string)s\n%(webpage_url)s' "$VIDEO_URL"
   yt-dlp --no-warnings --skip-download --list-subs "$VIDEO_URL"
   ```

4. Download English captions without downloading the video. Prefer original/manual English captions when available; otherwise request automatic English captions:

   ```sh
   yt-dlp --no-warnings --skip-download --write-auto-subs --sub-lang 'en.*' --sub-format vtt -o "$OUTPUT_DIR/%(id)s.%(ext)s" "$VIDEO_URL"
   ```

5. Preserve the raw `.vtt` file as evidence when the user asks for a sourced artifact. When producing notes or HTML, summarize and timestamp the captions instead of reproducing the full transcript.
6. If captions are unavailable, say so clearly and stop the transcript path. Do not silently substitute a guessed summary or download audio for transcription without user approval.

## Output rules

- Keep generated caption files in the user's requested location; otherwise use a temporary directory and report its path.
- Preserve timestamps for notes, citations, and follow-up questions.
- State whether the source was manual or automatic captions, the language selected, and any retrieval limitation.
- Treat the linked video as the primary source. Do not claim that a caption transcript is a word-perfect record of the audio.
- Browser/API fallbacks require a concrete reason, such as missing captions or a user request; report the reason before using one.
