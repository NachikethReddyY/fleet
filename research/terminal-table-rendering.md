# Terminal table rendering: width-aware CLI output

## Finding

The symlink checker currently computes each column from its longest value and
then draws a complete box. With full absolute paths, the resulting line is
wider than a split terminal pane, so the right side is clipped or wraps. This
is a layout problem, not a symlink-health problem.

## Relevant guidance

| Concern | Source-backed guidance | Implication for the checker |
|---|---|---|
| Discover the available width | `tput cols` reports the current terminal's column count. ncurses first considers terminal data, then asks the OS for the size, and then considers `LINES`/`COLUMNS`; `COLUMNS` is explicitly the screen width in characters. ([ncurses `tput` manual](https://invisible-island.net/ncurses/man/tput.1.html#h3-Terminal-Size)) | Ask `tput cols` when available, with a numeric `COLUMNS` override and a conservative fallback for redirected/non-interactive output. |
| Make overrides testable | POSIX defines `COLUMNS` as a preferred terminal/window width and says it may intentionally describe an area smaller than the terminal. ([POSIX environment variables](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap08.html#tag_08_03)) | Tests can set `COLUMNS=60` or `COLUMNS=120` without resizing a real terminal. |
| Measure display cells, not bytes | POSIX defines a column position from character widths and notes that display width is not necessarily related to internal representation. ([POSIX column position](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap03.html#tag_3_75)) | Do not use byte length. For this shell checker, keep the table payload ASCII and use character lengths; do not claim full arbitrary-Unicode alignment. |
| Treat Unicode width carefully | Unicode classifies characters as narrow, wide, or context-dependent; ambiguous characters should default to narrow when context cannot be established reliably. ([Unicode UAX #11](https://www.unicode.org/reports/tr11/#Recommendations)) Unicode's terminal-support paper also notes that Unix-like terminals commonly use `wcwidth`, but one-codepoint width is insufficient for complex grapheme clusters. ([Unicode terminal support](https://www.unicode.org/L2/L2023/23107-terminal-suppt.pdf#page=9)) | Keep box glyphs optional and use ASCII fallback if needed. A future multilingual renderer should use a real display-width implementation rather than `awk length()`. |

## Recommended implementation

Keep the current POSIX `sh` + `awk` implementation and add a width budget:

1. Resolve the width as `COLUMNS` (when it is a positive integer), otherwise
   `tput cols`, otherwise a safe fallback such as `80`.
2. Reserve space for borders, separators, `STATUS`, `SCOPE`, and their
   minimum readable widths.
3. Give the remaining width to `LINK` and `RESOLVED TARGET`, splitting it
   deterministically between those two columns.
4. If a value is too long, middle-truncate it (`prefix…suffix`) so the link
   root and final skill/file name remain visible. Never let a data cell force
   the table wider than the measured budget.
5. If the available width is below the minimum four-column layout, emit a
   compact two-line-per-record view or a clearly bounded narrow table; do not
   print a box that overruns the terminal.
6. Keep a `--plain`/non-TTY path or ASCII border fallback for logs and pasted
   output. Width detection must never make health status depend on whether
   stdout is interactive.

This adds no runtime dependency. The key invariant is:

```text
rendered line width <= detected output width
```

## Verification matrix

Run the checker with `COLUMNS=60`, `COLUMNS=80`, and `COLUMNS=120`, plus output
redirected to a file. Assert that every border, header, and data row is no
longer than the selected width and that the status/target values are still
present. Run the existing broken, missing, wrong-target, and healthy fixtures
as well; width handling must not change exit status or health counts.

## Recommendation

Implement terminal-width budgeting and middle truncation in the existing
script, driven by `COLUMNS`/`tput cols`, with tests at narrow and wide widths.
Avoid adding a table library for this checker. If Fleet later needs arbitrary
Unicode labels, move rendering to a runtime/library that exposes grapheme-aware
display width; shell + `awk length()` is not sufficient for that requirement.
