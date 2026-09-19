---
name: source-notes
description: Turn a supplied or clipped source into durable, source-backed Markdown notes focused on the user's question. Use when the user provides a URL, video, article, document, transcript, image, excerpt, or pasted text and asks to save, analyze, explain, extract ideas from, or take notes on it.
---

# Source notes

Create a reusable note from evidence, not a generic summary. Preserve the source separately, analyze the user's requested focus, and make it easy to trace important claims back to the original.

## Resolve the note contract

Identify:

- **Source:** the URL, local file, image, pasted excerpt, or clipped content.
- **Focus:** the question, concept, argument, comparison, or information the user wants notes about.
- **Destination:** use the user's requested location. Otherwise use `notes/` in the current project when one exists, or `~/notes/` for cross-project personal notes.
- **Proof:** source coverage plus locators—timestamps, page numbers, section names, or short quotations where useful.
- **Stop when:** the preserved source and focused note exist, source-backed claims are traceable, and important uncertainty is labeled.

If the user supplies a source without a focus, default to its central claim, supporting ideas, and practical implications when those are clear. Ask one blocking question only when several materially different note interpretations are equally plausible.

## Retrieve the source through its owner workflow

Do not duplicate format-specific retrieval logic when another skill owns it.

- **YouTube:** load and follow the `youtube-transcript` skill. Prefer original/manual captions; otherwise use original-language automatic captions. Do not download audio or invent a transcript when captions are unavailable without approval.
- **Web page or article:** retrieve the supplied URL directly. Use web search only when the source itself or necessary context cannot be reached directly.
- **Local text or document:** read the named file. Preserve useful headings, page markers, and metadata.
- **Image or screenshot:** inspect the image; distinguish visible text from interpretation. Use OCR only when needed.
- **Pasted or clipped text:** treat exactly what the user supplied as the source. Do not silently complete missing context from memory or search.

Before relying on a retrieval tool, check its binary, access, authentication, or network prerequisite. Report a concrete blocker instead of guessing.

## Preserve the source

Create `notes/sources/` when needed and save a Markdown source artifact with a descriptive kebab-case filename, for example:

```text
notes/sources/the-psychology-trick-that-makes-any-app-feel-better-transcript.md
```

Include:

- source title;
- creator, author, or publisher when known;
- canonical URL or original file path;
- publication date and retrieval date when available;
- source type and retrieval method;
- limitations such as automatic captions, OCR, clipping, missing sections, or inaccessible media;
- the full retrieved source when the user supplied or requested the full source, otherwise the complete relevant excerpt with its boundaries stated.

For transcripts, convert rolling captions into readable paragraphs without dropping spoken content. Preserve timestamps at useful paragraph boundaries and verify the normalized transcript against every non-empty caption segment.

Never place credentials, private identifiers, or unrelated local paths into the note.

## Analyze around the requested focus

Read the relevant source completely enough to understand the requested topic in context. Broaden only when the local evidence is insufficient.

Separate three kinds of content:

1. **Source-backed claims** — what the source explicitly says or demonstrates.
2. **Interpretation** — what those claims mean, how they connect, or the best mental model.
3. **Extension** — examples, implications, critiques, or recommendations not directly stated by the source.

Label interpretation and extension when a reader could otherwise mistake them for the creator's words. Do not invent missing definitions, examples, certainty, or consensus.

Prefer explanatory notes over chronological play-by-play. Preserve important disagreements, caveats, assumptions, and limitations instead of flattening the source into confident bullet points.

## Write the note

Use a descriptive kebab-case Markdown filename under `notes/`. A useful default structure is:

```markdown
# Focused note title

## In one sentence

The clearest answer to the user's question.

> Source: [Title](canonical URL), relevant locator. Retrieval limitation if any.

## What it is

A direct explanation grounded in the source.

## How it works

The mechanism, sequence, or argument.

## Examples

Concrete examples from the source; clearly label added examples.

## Why it matters

Implications and practical use.

## Limits and cautions

What the source does not establish and where the idea can fail.

## Source map

- `[timestamp/page/section]` — claim supported there
```

Adapt headings to the user's focus; do not force irrelevant sections. Link the preserved source artifact with a relative Markdown link.

## Validate

Run focused checks that match the source type and note claim:

- source and note files exist at the intended paths;
- title, creator, canonical identity, and retrieval limitations are present;
- the preserved source covers the promised range;
- transcript normalization contains every non-empty caption segment in order;
- each important source-backed claim has a locator or is easy to find in the linked source;
- interpretations and added examples are not presented as quotations or source claims;
- the note directly answers the user's requested focus rather than merely summarizing the source;
- no existing notes were overwritten unless explicitly requested.

Report exact file paths and mark unavailable proof as unverified.
