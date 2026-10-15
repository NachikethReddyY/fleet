---
name: html-communicator
description: Invoke when the user asks for an HTML artifact, spec, plan, report, write-up, or UI mock.
---

# HTML Communication

## When to Use
Use this skill when the user wants a plan, spec, write-up, findings, summary,
report, comparison, tutorial, data analysis, or set of UI mocks presented as
readable HTML. Do not use it for HTML that ships as part of a product.

## Purpose
The artifact is a self-contained visual document for learning, analyzing,
planning, and comparing. Instead of walls of text, translate concepts into
visual primitives: inline SVG architecture diagrams, comparison matrices, data
charts, step-by-step trace flows, and interactive toggles or calculators when
helpful.

## Visual System (Monochrome-First Minimal)
Design like an IETF RFC meets Linear/Vercel documentation: ultra-clean,
high-density, typographic, strictly monochrome by default.

### Tokens
- **Canvas:** `#000000`
- **Elevated blocks** (`pre`, `figure`, panels): `#080808`; secondary surface: `#0d0d0d`
- **Hover/active states, bar tracks:** `#111111` to `#141414`
- **Borders:** `1px solid #1a1a1a` for section dividers and table rows; `1px solid #2a2a2a` for containers and diagram nodes
- **Primary text and headings:** `#ffffff` / `#ededed`
- **Secondary text, captions, table headers:** `#888888`
- **Labels, section numbers, subtle metadata:** `#555555`

### Design Philosophy: Monochrome Chrome, Chromatic Data
- **UI chrome (90% of the page):** backgrounds, surfaces, borders, headings, body text, and standard tables stay strictly black, white, and gray. Never put colored dots on `<h2>` headings or random colors on plain table text.
- **Data and semantic states (10%):** charts, graphs, architecture diagrams, active roadmap gates, and pass/fail/warning states MUST use the accent palette below so data parses at a glance.
- **Never replace a visual primitive with a plain table.** If a section describes a process, comparison, or quantities, it renders as a pipeline, grid, chart, or diagram, not a 2-column table.

### Accent Palette (Data Only)
Define these exact CSS variables in `:root` and use them ONLY inside charts, SVG diagrams, active states, and semantic callouts:
```css
:root {
  --accent-blue: #3b82f6;   /* primary data series, active/core nodes, focus highlights */
  --accent-green: #10b981;  /* pass states, low-cost/safe tiers, positive comparisons */
  --accent-amber: #f59e0b;  /* decision gates, "you are here" markers, warnings, human handoff */
  --accent-red: #ef4444;    /* error/crash paths, high-risk modes, negative comparisons */
  --accent-purple: #8b5cf6; /* secondary data series, advanced/stealth tiers */
}
```

### Color Gate (Strict)
- Default to **0 chromatic colors** outside the accents above. Encode hierarchy with contrast (`#fff` vs `#888` vs `#555`), font weight, monospace vs sans-serif, and stroke style (solid vs dashed).
- Use an accent **ONLY** when:
  1. A chart compares quantities or series where color speeds reading (bars, multi-series lines).
  2. Marking an active state, decision gate, or "you are here" node.
  3. Showing literal pass/fail, diff (`+`/`-`), or high-severity security boundaries.
- Never run rainbow sequences across headings, badges, or steps. One accent per meaning, reused consistently.

### Typography
- **Body:** `15px/1.65 -apple-system, BlinkMacSystemFont, "Inter", "Segoe UI", Roboto, sans-serif`
- **Monospace:** `ui-monospace, SFMono-Regular, Menlo, Consolas, monospace` for `code`, `pre`, CLI flags, state names, and numbers.
- **Hierarchy:** weight, tracking (`letter-spacing: -0.02em` on headings), and grayscale contrast. Never color.
- **Section numbers:** prefix `<h2>` with a monospace index (`00`, `01`) in `#555555`.

### Layout
- **Container:** `main { max-width: 56rem; margin: 0 auto; padding: 2.5rem 1.5rem 6rem; }`. Never leave `<main>` unconstrained.
- **No `100vw` hacks** (causes horizontal scrollbar bugs). Keep navigation and headers inside the main container flow.
- **Sections:** `border-top: 1px solid #1a1a1a; padding-top: 2rem; margin-top: 2.5rem;`.

### Components and Data
- **No dashboard bloat:** no pill badges, colored status chips, multi-colored progress bars, or marketing widgets.
- **Header metadata:** horizontal row or `<dl>` with `#888` labels and monospace `#ededed` values.
- **Tables:** horizontal hairlines only; header row `border-bottom: 1px solid #333`; no vertical borders, no zebra striping. Left-align text; right-align numbers with `font-variant-numeric: tabular-nums`.
- **Diagrams (inline SVG):** fills `#080808`, strokes `#333` or `#666`, text `#ededed` / `#888` for peripheral nodes. Key nodes and edges MUST use accents (e.g. focal service in `--accent-blue`, failure paths in `--accent-red` dashed). Arrow paths must align to box edges and reflect accurate transitions; every arrow must touch both boxes it connects.
- **Timelines:** 1px `#262626` rail with small `#000` / `#888` nodes. The single active gate node uses `--accent-amber`; no glowing circles.
- **Bar charts:** CSS grid (`label | track | value`) on a `#111111` track, bars in intentional accents (one accent per series, documented in a caption), right-aligned `tabular-nums` values. Bar length must stay proportional to the data.
- **Line/scatter charts:** inline SVG, gridlines `#161616`, axis labels `#666`, primary line `#fff`, comparison line dashed `#666`.
- **Interactivity:** minimal vanilla JS in a classic `<script>` only (tabs, step-through simulators, sliders, filterable tables). The page must read 100% without JS.
- **CSS hygiene:** zero unused selectors. Keep `<style>` compact.

### Visual Variety and Charting Mandate
- Never put more than 2 plain tables in a row without breaking up the page with a chart, SVG diagram, comparison grid, or visual pipeline.
- Whenever quantities are compared (budgets, benchmarks, latencies, percentages, token counts), ALWAYS render a visual bar chart, sparkline, or SVG graph in the accent palette. Never list compared numbers as text only.
- Whenever a multi-step process, escalation path, or state machine is described, ALWAYS render a visual pipeline or SVG flow diagram with accent colors on the key states and nodes.

## Document Rules
Create one self-contained HTML file, capped at 512 KB.

- Write it like an engineering spec, not a landing page: dense, scannable, no hero, no decorative chrome, no marketing voice, and no em dashes.
- Make it mobile-readable with a responsive viewport and no fixed-width layout.
- Use semantic HTML, inline CSS, inline SVG, and HTTPS or data-URL images.
- Use an inline classic script only when interactivity materially helps. Keep scripted pages useful without JavaScript; the sandbox blocks storage, fetch, workers, frames, forms, and popups.
- In script-free files, give external links `target="_blank"` and `rel="noopener noreferrer"`. If any script exists, omit `target="_blank"`.

Never include external or module scripts, inline event handlers, `javascript:` URLs, forms, frames, embeds, objects, applets, meta refresh, linked stylesheets, secrets, private URLs, or local filesystem paths.

## UI Mocks
When the user asks for variants:
- Render real styled variants, not descriptions.
- Label them 'A', 'B', 'C'... for easy selection.
- Lay them out for direct comparison.
- Keep one file across iterations so its URL stays stable.

Open it up in a browser once it is done.
