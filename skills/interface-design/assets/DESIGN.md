# [Product] Design System

<!--
AGENT: This is the project-specific source of truth, not an example theme.
Replace bracketed fields with accepted decisions derived from the product.
Duplicate table rows only for tokens, roles, and components the product uses.
Keep names, values, and roles synchronized with DESIGN.html.
-->

## Document status

- Product: [name]
- Status: [draft or accepted]
- Last updated: [date]
- Applies to: [packages, applications, or surfaces]
- Implementation sources: [token, style, and component paths]

## 1. Product direction

- Primary user: [user]
- Core job: [job]
- Context: [environment and constraints]
- Personality: [intended qualities]
- Interface voice: [attitude and language]
- Avoid: [conflicting visual or tonal directions]

### Design principles

<!-- AGENT: Record only principles that change project decisions. -->

1. [Principle and its consequence]

### Supported contexts

<!--
AGENT: Record conditions that materially change design. Viewport and input are
independent: do not infer touch or pointer from width alone. Remove contexts the
product does not support.
-->

| Platform or context | Viewport and viewing distance | Primary and alternate input | Session and interruption pattern | Required adaptation |
| --- | --- | --- | --- | --- |
| [mobile/web/desktop/etc.] | [range and distance] | [touch/pointer/keyboard/etc.] | [brief/deep/shared/etc.] | [navigation, density, state continuity] |

### Trust and agency

- User control and escape: [cancel, back, skip, or mode-exit rules]
- Recovery and work preservation: [undo, retry, draft, or interruption rules]
- Permissions and data use: [what is requested, why, when, and denial behavior]
- Consequential actions: [warning, confirmation, reversal, and transparency]

## 2. Foundations

### Color

<!--
AGENT: List every accepted color. Preserve the project's token model instead of
forcing generic names. Each token needs an exact value, role, allowed use,
pairing, state relationship, and implementation source where useful.
-->

- Working color space: [HSL, OKLCH, or project model]
- Output notation: [notation stored in production tokens]
- Supported gamut: [sRGB, Display P3, or project target]
- Themes or modes: [list]

| Token | Value | Group | Role | Allowed uses | Pairing or state | Source |
| --- | --- | --- | --- | --- | --- | --- |
| [token] | [exact value] | [neutral/brand/etc.] | [role] | [where used] | [related tokens] | [path] |

#### Accent map

<!--
AGENT: Add one row per accent family. Make ownership explicit when multiple
accents serve different features, navigation areas, data, tenants, or states.
-->

| Accent | Owns | Default | Hover/active | Selected/subtle | Foreground | Focus | Exclusions |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [accent family] | [part of product] | [token] | [tokens] | [tokens] | [token] | [token] | [where not used] |

#### Supported pairings

| Foreground | Surface | Use | Contrast or constraint |
| --- | --- | --- | --- |
| [token] | [token] | [text/icon/control use] | [verified result or rule] |

### Typography

#### Families

| Role | Family and fallbacks | Available styles | Source | Reason |
| --- | --- | --- | --- | --- |
| [interface/display/code] | [stack] | [weights and italics] | [asset or import] | [decision] |

#### Type scale

<!--
AGENT: Include every accepted role from the smallest text to the largest text
used by the product. DESIGN.html must render each row at its actual size.
-->

| Token | Size | Line height | Weight | Letter spacing | Use | Responsive behavior |
| --- | ---: | ---: | ---: | ---: | --- | --- |
| [token] | [size] | [line height] | [weight] | [tracking] | [role] | [changes] |

- Paragraph measure: [range]
- Numeric treatment: [alignment and numeral style]
- Mixed inline sizes: [alignment rule]

### Spacing and sizing

| Token | Value | Typical use | Exceptions |
| --- | ---: | --- | --- |
| [token] | [value] | [use] | [exception, if any] |

### Layout and density

| Decision | Value | Applies to | Reason |
| --- | --- | --- | --- |
| [content width/grid/density/breakpoint] | [value] | [surface] | [reason] |

Describe fixed, constrained, and fluid regions. Record intentional density
changes and representative narrow and wide behavior.

### Shape and depth

<!--
AGENT: Record one consistent light direction and the project's bounded elevation
levels. Each level needs a visual cue, owned surfaces, and interaction behavior.
-->

- Light direction: [direction or flat-depth rule]

| Token | Value | Use | Exclusions |
| --- | --- | --- | --- |
| [border/radius/shadow/overlay token] | [value] | [allowed use] | [where not used] |

#### Elevation map

| Level or token | Visual cues | Used by | Enter/exit behavior | Stacking rule |
| --- | --- | --- | --- | --- |
| [level] | [shadow/border/color/overlap] | [surfaces] | [interaction] | [z-axis relationship] |

### Motion

| Token or pattern | Value | Trigger | Purpose | Reduced-motion behavior |
| --- | --- | --- | --- | --- |
| [motion decision] | [duration/easing/etc.] | [interaction] | [meaning] | [alternative] |

## 3. Components

### Inventory

| Component | Variants | States | Tokens | Implementation | Usage rule |
| --- | --- | --- | --- | --- | --- |
| [component] | [variants] | [states] | [tokens] | [path] | [when used] |

### Component specifications

<!--
AGENT: Add one subsection per recurring component. Describe structure, content,
semantic role, visual character, variants, states, accessibility, responsive
behavior, and prohibited uses. When a component departs from a familiar
pattern, record the user benefit and the behavioral contract it preserves.
-->

#### [Component name]

- Purpose:
- Semantic role and behavioral contract:
- Anatomy:
- Visual character:
- Variants:
- States:
- Content rules:
- Accessibility:
- Responsive behavior:
- Avoid:

## 4. Content and behavior

### Interaction and feedback

<!--
AGENT: Record complete action loops for consequential or recurring behavior.
Feedback intensity must match consequence. Preserve work and define recovery.
-->

| Action or pattern | Immediate feedback | Progress or result | Failure and recovery | Cancellation or undo | Input and accessibility notes |
| --- | --- | --- | --- | --- | --- |
| [submit/sync/delete/etc.] | [local response] | [status] | [message and next step] | [behavior] | [focus, announcement, alternative input] |

### Voice

- [Project-specific language rule]

### System states

<!--
AGENT: Include each applicable first-use, no-results, cleared/completed,
unavailable/unauthorized, loading, failure, and success state. Distinguish a
legitimate empty state from an error. Record which surrounding controls remain,
which are withheld, and the useful next step.
-->

| State | User meaning | Visual treatment | Content | Recovery or next step |
| --- | --- | --- | --- | --- |
| [state and cause] | [meaning] | [tokens/components and surrounding controls] | [copy rule] | [behavior] |

### Icons

<!--
AGENT: Record only governed icons. Separate glyph size from interactive target
size. An icon-only control needs a familiar metaphor and accessible name; use a
visible label when recognition or consequence requires it.
-->

| Concept or category | Family and source | Style and optical weight | Glyph sizes | Target sizes by input | Label rule | States | Accessibility, localization, and RTL |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [action/object/category] | [system/library/custom path] | [outline/fill/stroke/etc.] | [sizes] | [touch/pointer/etc.] | [visible/contextual/accessible-only] | [selected/focus/etc.] | [name, decorative rule, mirroring] |

### Imagery and data visualization

<!--
AGENT: Keep only categories governed by this system. Record production asset
sources rather than placeholders. For imagery, define crop and focal-point
behavior, target display sizes, text-contrast treatments, responsive behavior,
and fallbacks. For user uploads, include aspect-ratio and containment rules,
boundary treatment, and extreme-input behavior. Distinguish informative,
functional, and decorative assets for accessibility.
-->

| Asset system | Role and style | Source | Size and crop rules | Treatment and states | Accessibility |
| --- | --- | --- | --- | --- | --- |
| [photos/screenshots/uploads/charts/etc.] | [purpose and visual rules] | [path or provider] | [rendered sizes, aspect ratio, focal point] | [contrast, boundary, fallback, responsive rules] | [informative/functional/decorative treatment] |

## 5. Accessibility and responsiveness

<!--
AGENT: Record requirements and test evidence, not statements like "accessible."
Use platform values only for the platforms they govern. Demonstrate the
applicable cases in DESIGN.html.
-->

| Area | Accepted requirement | Verification and evidence |
| --- | --- | --- |
| Semantics and reading order | [roles, names, landmarks, order] | [test] |
| Keyboard and focus | [reachability, order, visibility, shortcuts] | [test] |
| Touch, pointer, and alternate input | [targets, spacing, equivalents] | [test] |
| Text scaling, zoom, and reflow | [supported range and behavior] | [test] |
| Contrast and non-color cues | [requirements and pairings] | [test] |
| Motion, flashing, audio, and haptics | [preferences and alternatives] | [test] |
| Localization and right-to-left | [expansion, formats, mirroring] | [test] |
| Screen reader and announcements | [names, states, live feedback] | [test] |
| Supported themes and preferences | [modes and system settings] | [test] |

### Responsive behavior

| Context change | Preserved content and state | Layout or navigation adaptation | Input adaptation |
| --- | --- | --- | --- |
| [narrow/wide/rotation/resize/multitask/etc.] | [what remains stable] | [change] | [touch/pointer/keyboard/focus behavior] |

## 6. Decision log

| Date | Decision | Reason | Evidence | Affects |
| --- | --- | --- | --- | --- |
| [date] | [accepted decision] | [trade-off] | [source or observation] | [tokens/components] |

## 7. Deferred decisions

| Question | Evidence needed | Revisit when | Current fallback |
| --- | --- | --- | --- |
| [unresolved question] | [needed evidence] | [observable trigger] | [temporary behavior] |
