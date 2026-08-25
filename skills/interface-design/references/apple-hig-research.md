# Apple Human Interface Guidelines research

Research date: 2026-08-25

Use this note as source material, not as a substitute for the project workflow or
Apple's current documentation. The guidance below is paraphrased from Apple's
Human Interface Guidelines (HIG) and excludes Swift and API mechanics unless they
change a design decision.

## Source and scope

Apple's public HIG pages require JavaScript. This review used the rendered pages
and Apple's own documentation data, but cites only stable, public Apple URLs.
Platform tabs on shared articles use one canonical URL; platform-specific advice
usually appears under **Platform considerations** rather than at separate URLs.

Apple has no HIG branch for web design. Apply the universal principles,
accessibility guidance, adaptive-layout rules, and input guidance to the web, but
don't present Apple-platform dimensions or components as web standards.

## Navigation coverage

Every current top-level HIG collection and every item listed by those collections
was inspected. This map records the taxonomy separately from the portable findings.

### Getting started

- [Design principles](https://developer.apple.com/design/human-interface-guidelines/design-principles)
- [Designing for iOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios)
- [Designing for iPadOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados)
- [Designing for macOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos)
- [Designing for tvOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-tvos)
- [Designing for visionOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-visionos)
- [Designing for watchOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-watchos)
- [Designing for games](https://developer.apple.com/design/human-interface-guidelines/designing-for-games)

### Foundations

[Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility),
[App icons](https://developer.apple.com/design/human-interface-guidelines/app-icons),
[Branding](https://developer.apple.com/design/human-interface-guidelines/branding),
[Color](https://developer.apple.com/design/human-interface-guidelines/color),
[Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode),
[Icons](https://developer.apple.com/design/human-interface-guidelines/icons),
[Images](https://developer.apple.com/design/human-interface-guidelines/images),
[Immersive experiences](https://developer.apple.com/design/human-interface-guidelines/immersive-experiences),
[Inclusion](https://developer.apple.com/design/human-interface-guidelines/inclusion),
[Layout](https://developer.apple.com/design/human-interface-guidelines/layout),
[Materials](https://developer.apple.com/design/human-interface-guidelines/materials),
[Motion](https://developer.apple.com/design/human-interface-guidelines/motion),
[Privacy](https://developer.apple.com/design/human-interface-guidelines/privacy),
[Right to left](https://developer.apple.com/design/human-interface-guidelines/right-to-left),
[SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols),
[Spatial layout](https://developer.apple.com/design/human-interface-guidelines/spatial-layout),
[Typography](https://developer.apple.com/design/human-interface-guidelines/typography), and
[Writing](https://developer.apple.com/design/human-interface-guidelines/writing).

### Patterns

[Charting data](https://developer.apple.com/design/human-interface-guidelines/charting-data),
[Collaboration and sharing](https://developer.apple.com/design/human-interface-guidelines/collaboration-and-sharing),
[Drag and drop](https://developer.apple.com/design/human-interface-guidelines/drag-and-drop),
[Entering data](https://developer.apple.com/design/human-interface-guidelines/entering-data),
[Feedback](https://developer.apple.com/design/human-interface-guidelines/feedback),
[File management](https://developer.apple.com/design/human-interface-guidelines/file-management),
[Going full screen](https://developer.apple.com/design/human-interface-guidelines/going-full-screen),
[Launching](https://developer.apple.com/design/human-interface-guidelines/launching),
[Live-viewing apps](https://developer.apple.com/design/human-interface-guidelines/live-viewing-apps),
[Loading](https://developer.apple.com/design/human-interface-guidelines/loading),
[Managing accounts](https://developer.apple.com/design/human-interface-guidelines/managing-accounts),
[Managing notifications](https://developer.apple.com/design/human-interface-guidelines/managing-notifications),
[Modality](https://developer.apple.com/design/human-interface-guidelines/modality),
[Multitasking](https://developer.apple.com/design/human-interface-guidelines/multitasking),
[Offering help](https://developer.apple.com/design/human-interface-guidelines/offering-help),
[Onboarding](https://developer.apple.com/design/human-interface-guidelines/onboarding),
[Playing audio](https://developer.apple.com/design/human-interface-guidelines/playing-audio),
[Playing haptics](https://developer.apple.com/design/human-interface-guidelines/playing-haptics),
[Playing video](https://developer.apple.com/design/human-interface-guidelines/playing-video),
[Printing](https://developer.apple.com/design/human-interface-guidelines/printing),
[Ratings and reviews](https://developer.apple.com/design/human-interface-guidelines/ratings-and-reviews),
[Searching](https://developer.apple.com/design/human-interface-guidelines/searching),
[Settings](https://developer.apple.com/design/human-interface-guidelines/settings),
[Undo and redo](https://developer.apple.com/design/human-interface-guidelines/undo-and-redo), and
[Workouts](https://developer.apple.com/design/human-interface-guidelines/workouts).

### Components

- [Content](https://developer.apple.com/design/human-interface-guidelines/content):
  [Charts](https://developer.apple.com/design/human-interface-guidelines/charts),
  [Image views](https://developer.apple.com/design/human-interface-guidelines/image-views),
  [Text views](https://developer.apple.com/design/human-interface-guidelines/text-views), and
  [Web views](https://developer.apple.com/design/human-interface-guidelines/web-views).
- [Layout and organization](https://developer.apple.com/design/human-interface-guidelines/layout-and-organization):
  [Boxes](https://developer.apple.com/design/human-interface-guidelines/boxes),
  [Collections](https://developer.apple.com/design/human-interface-guidelines/collections),
  [Column views](https://developer.apple.com/design/human-interface-guidelines/column-views),
  [Disclosure controls](https://developer.apple.com/design/human-interface-guidelines/disclosure-controls),
  [Labels](https://developer.apple.com/design/human-interface-guidelines/labels),
  [Lists and tables](https://developer.apple.com/design/human-interface-guidelines/lists-and-tables),
  [Lockups](https://developer.apple.com/design/human-interface-guidelines/lockups),
  [Outline views](https://developer.apple.com/design/human-interface-guidelines/outline-views),
  [Split views](https://developer.apple.com/design/human-interface-guidelines/split-views), and
  [Tab views](https://developer.apple.com/design/human-interface-guidelines/tab-views).
- [Menus and actions](https://developer.apple.com/design/human-interface-guidelines/menus-and-actions):
  [Activity views](https://developer.apple.com/design/human-interface-guidelines/activity-views),
  [Buttons](https://developer.apple.com/design/human-interface-guidelines/buttons),
  [Context menus](https://developer.apple.com/design/human-interface-guidelines/context-menus),
  [Dock menus](https://developer.apple.com/design/human-interface-guidelines/dock-menus),
  [Edit menus](https://developer.apple.com/design/human-interface-guidelines/edit-menus),
  [Home Screen quick actions](https://developer.apple.com/design/human-interface-guidelines/home-screen-quick-actions),
  [Menus](https://developer.apple.com/design/human-interface-guidelines/menus),
  [Ornaments](https://developer.apple.com/design/human-interface-guidelines/ornaments),
  [Pop-up buttons](https://developer.apple.com/design/human-interface-guidelines/pop-up-buttons),
  [Pull-down buttons](https://developer.apple.com/design/human-interface-guidelines/pull-down-buttons),
  [The menu bar](https://developer.apple.com/design/human-interface-guidelines/the-menu-bar), and
  [Toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars).
- [Navigation and search](https://developer.apple.com/design/human-interface-guidelines/navigation-and-search):
  [Path controls](https://developer.apple.com/design/human-interface-guidelines/path-controls),
  [Search fields](https://developer.apple.com/design/human-interface-guidelines/search-fields),
  [Sidebars](https://developer.apple.com/design/human-interface-guidelines/sidebars),
  [Tab bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars), and
  [Token fields](https://developer.apple.com/design/human-interface-guidelines/token-fields).
- [Presentation](https://developer.apple.com/design/human-interface-guidelines/presentation):
  [Action sheets](https://developer.apple.com/design/human-interface-guidelines/action-sheets),
  [Alerts](https://developer.apple.com/design/human-interface-guidelines/alerts),
  [Page controls](https://developer.apple.com/design/human-interface-guidelines/page-controls),
  [Panels](https://developer.apple.com/design/human-interface-guidelines/panels),
  [Popovers](https://developer.apple.com/design/human-interface-guidelines/popovers),
  [Scroll views](https://developer.apple.com/design/human-interface-guidelines/scroll-views),
  [Sheets](https://developer.apple.com/design/human-interface-guidelines/sheets), and
  [Windows](https://developer.apple.com/design/human-interface-guidelines/windows).
- [Selection and input](https://developer.apple.com/design/human-interface-guidelines/selection-and-input):
  [Color wells](https://developer.apple.com/design/human-interface-guidelines/color-wells),
  [Combo boxes](https://developer.apple.com/design/human-interface-guidelines/combo-boxes),
  [Digit entry views](https://developer.apple.com/design/human-interface-guidelines/digit-entry-views),
  [Image wells](https://developer.apple.com/design/human-interface-guidelines/image-wells),
  [Pickers](https://developer.apple.com/design/human-interface-guidelines/pickers),
  [Segmented controls](https://developer.apple.com/design/human-interface-guidelines/segmented-controls),
  [Sliders](https://developer.apple.com/design/human-interface-guidelines/sliders),
  [Steppers](https://developer.apple.com/design/human-interface-guidelines/steppers),
  [Text fields](https://developer.apple.com/design/human-interface-guidelines/text-fields),
  [Toggles](https://developer.apple.com/design/human-interface-guidelines/toggles), and
  [Virtual keyboards](https://developer.apple.com/design/human-interface-guidelines/virtual-keyboards).
- [Status](https://developer.apple.com/design/human-interface-guidelines/status):
  [Activity rings](https://developer.apple.com/design/human-interface-guidelines/activity-rings),
  [Gauges](https://developer.apple.com/design/human-interface-guidelines/gauges),
  [Progress indicators](https://developer.apple.com/design/human-interface-guidelines/progress-indicators), and
  [Rating indicators](https://developer.apple.com/design/human-interface-guidelines/rating-indicators).
- [System experiences](https://developer.apple.com/design/human-interface-guidelines/system-experiences):
  [App Shortcuts](https://developer.apple.com/design/human-interface-guidelines/app-shortcuts),
  [Complications](https://developer.apple.com/design/human-interface-guidelines/complications),
  [Controls](https://developer.apple.com/design/human-interface-guidelines/controls),
  [Live Activities](https://developer.apple.com/design/human-interface-guidelines/live-activities),
  [Notifications](https://developer.apple.com/design/human-interface-guidelines/notifications),
  [Snippets](https://developer.apple.com/design/human-interface-guidelines/snippets),
  [Status bars](https://developer.apple.com/design/human-interface-guidelines/status-bars),
  [Top Shelf](https://developer.apple.com/design/human-interface-guidelines/top-shelf),
  [Watch faces](https://developer.apple.com/design/human-interface-guidelines/watch-faces), and
  [Widgets](https://developer.apple.com/design/human-interface-guidelines/widgets).

### Inputs

[Action button](https://developer.apple.com/design/human-interface-guidelines/action-button),
[Apple Pencil and Scribble](https://developer.apple.com/design/human-interface-guidelines/apple-pencil-and-scribble),
[Camera Control](https://developer.apple.com/design/human-interface-guidelines/camera-control),
[Digital Crown](https://developer.apple.com/design/human-interface-guidelines/digital-crown),
[Eyes](https://developer.apple.com/design/human-interface-guidelines/eyes),
[Focus and selection](https://developer.apple.com/design/human-interface-guidelines/focus-and-selection),
[Game controls](https://developer.apple.com/design/human-interface-guidelines/game-controls),
[Gestures](https://developer.apple.com/design/human-interface-guidelines/gestures),
[Gyroscope and accelerometer](https://developer.apple.com/design/human-interface-guidelines/gyro-and-accelerometer),
[Keyboards](https://developer.apple.com/design/human-interface-guidelines/keyboards),
[Nearby interactions](https://developer.apple.com/design/human-interface-guidelines/nearby-interactions),
[Pointing devices](https://developer.apple.com/design/human-interface-guidelines/pointing-devices), and
[Remotes](https://developer.apple.com/design/human-interface-guidelines/remotes).

### Technologies

[AirPlay](https://developer.apple.com/design/human-interface-guidelines/airplay),
[Always On](https://developer.apple.com/design/human-interface-guidelines/always-on),
[App Clips](https://developer.apple.com/design/human-interface-guidelines/app-clips),
[Apple Pay](https://developer.apple.com/design/human-interface-guidelines/apple-pay),
[Augmented reality](https://developer.apple.com/design/human-interface-guidelines/augmented-reality),
[CareKit](https://developer.apple.com/design/human-interface-guidelines/carekit),
[CarPlay](https://developer.apple.com/design/human-interface-guidelines/carplay),
[Game Center](https://developer.apple.com/design/human-interface-guidelines/game-center),
[Generative AI](https://developer.apple.com/design/human-interface-guidelines/generative-ai),
[HealthKit](https://developer.apple.com/design/human-interface-guidelines/healthkit),
[HomeKit](https://developer.apple.com/design/human-interface-guidelines/homekit),
[iCloud](https://developer.apple.com/design/human-interface-guidelines/icloud),
[ID Verifier](https://developer.apple.com/design/human-interface-guidelines/id-verifier),
[iMessage apps and stickers](https://developer.apple.com/design/human-interface-guidelines/imessage-apps-and-stickers),
[In-app purchase](https://developer.apple.com/design/human-interface-guidelines/in-app-purchase),
[Live Photos](https://developer.apple.com/design/human-interface-guidelines/live-photos),
[Mac Catalyst](https://developer.apple.com/design/human-interface-guidelines/mac-catalyst),
[Machine learning](https://developer.apple.com/design/human-interface-guidelines/machine-learning),
[Maps](https://developer.apple.com/design/human-interface-guidelines/maps),
[NFC](https://developer.apple.com/design/human-interface-guidelines/nfc),
[Photo editing](https://developer.apple.com/design/human-interface-guidelines/photo-editing),
[ResearchKit](https://developer.apple.com/design/human-interface-guidelines/researchkit),
[SharePlay](https://developer.apple.com/design/human-interface-guidelines/shareplay),
[ShazamKit](https://developer.apple.com/design/human-interface-guidelines/shazamkit),
[Sign in with Apple](https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple),
[Siri](https://developer.apple.com/design/human-interface-guidelines/siri),
[Tap to Pay on iPhone](https://developer.apple.com/design/human-interface-guidelines/tap-to-pay-on-iphone),
[VoiceOver](https://developer.apple.com/design/human-interface-guidelines/voiceover), and
[Wallet](https://developer.apple.com/design/human-interface-guidelines/wallet).

Most technology pages describe a particular Apple capability, entitlement, or
system surface. Do not generalize their branded flows into unrelated products.
The portable exception is Generative AI: disclose AI, preserve agency, offer
revert/retry/refine controls, explain limitations, minimize private data, design
for latency and failure, and provide a non-AI path when AI is supplementary.
[Source](https://developer.apple.com/design/human-interface-guidelines/generative-ai)

## Universal principles

Use Apple's eight principles as decision tests rather than as a visual style:

1. **Purpose:** identify the value people seek and make the core use excellent.
2. **Agency:** allow exploration, informed choices, escape, and recovery.
3. **Responsibility:** protect safety and privacy; explain collection and effects.
4. **Familiarity:** reuse known concepts and keep appearance, behavior, and
   feedback consistent.
5. **Flexibility:** design inclusively, preserve context through adaptation, and
   support different devices and input methods.
6. **Simplicity:** include what the task needs, use concise language, and expose a
   clear hierarchy. Simplicity is focus, not visual emptiness.
7. **Craft:** prototype, test in realistic conditions, iterate, and maintain the
   quality after release.
8. **Delight:** choose an appropriate emotion and express it through useful
   moments; decoration must never obstruct the task.

[Source: Design principles](https://developer.apple.com/design/human-interface-guidelines/design-principles)

## Platform and input differences

- **Handheld touch:** iPhone supports both brief checks and longer sessions. Keep
  primary content dominant, secondary actions quickly discoverable, and frequent
  controls within comfortable reach. Adapt to orientation, type size, and
  appearance changes. [Source](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios)
- **Tablet and hybrid input:** iPad supports touch, pointer, keyboard, Pencil,
  variable posture, multitasking, and resizable windows. Use the larger canvas to
  reduce nesting and modality, but let density respond to distance and input.
  [Source](https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados)
- **Desktop:** macOS favors precision, keyboard acceleration, multiple windows,
  resizing, deeper work, menu access, and customization. Show more without
  crowding and don't hide essential commands behind touch-first patterns.
  [Source](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos)
- **Remote and focus:** tvOS is read at room distance and navigated through a
  focus system. Make focus unmistakable, protect spacing as focused elements
  grow, and test legibility on real televisions.
  [Source](https://developer.apple.com/design/human-interface-guidelines/designing-for-tvos)
- **Spatial:** visionOS prioritizes visual and physical comfort. Use the least
  immersion necessary, familiar windows for ordinary tasks, indirect gestures,
  restrained motion, and content within the comfortable field of view.
  [Source](https://developer.apple.com/design/human-interface-guidelines/designing-for-visionos)
- **Glanceable:** watchOS favors single-screen, short, targeted interactions and
  shallow navigation. Notifications and complications may matter more than the
  app's full interface.
  [Source](https://developer.apple.com/design/human-interface-guidelines/designing-for-watchos)
- **Web translation:** treat viewport size and input as independent variables.
  A wide touchscreen is not a mouse desktop; a narrow viewport may still have a
  keyboard. Preserve one task model while providing touch, keyboard, and pointer
  affordances. [Sources: Layout](https://developer.apple.com/design/human-interface-guidelines/layout),
  [Keyboards](https://developer.apple.com/design/human-interface-guidelines/keyboards),
  [Pointing devices](https://developer.apple.com/design/human-interface-guidelines/pointing-devices)

Across inputs, keep the action model consistent. Use familiar gestures, provide
immediate feedback, never make a custom gesture the only route to an important
action, respect standard shortcuts, support keyboard-only use, keep focus order
logical, and avoid moving focus without user action.
[Sources: Gestures](https://developer.apple.com/design/human-interface-guidelines/gestures),
[Keyboards](https://developer.apple.com/design/human-interface-guidelines/keyboards),
[Focus and selection](https://developer.apple.com/design/human-interface-guidelines/focus-and-selection)

## Actionable rules by likely skill destination

### `SKILL.md`: workflow and intent

- Begin with purpose, audience, task, context, expected session length, platform,
  viewport range, and available inputs. Ask when these are unknown.
- Prototype the working task before decoration. Test early in real contexts and
  across supported devices, inputs, appearances, locales, and text sizes.
- Preserve agency: provide escape, cancellation, undo, retry, and recovery where
  an action has cost or uncertainty.
- Treat privacy, accessibility, and inclusion as design inputs, not final audits.
- Adapt each platform intentionally rather than scaling one composition unchanged.

[Sources: Design principles](https://developer.apple.com/design/human-interface-guidelines/design-principles),
[Layout](https://developer.apple.com/design/human-interface-guidelines/layout),
[Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)

### `designrules.md`: restraint and earned styling

- Every element must earn its place through task value, hierarchy, state,
  navigation, or feedback.
- Use decoration only when it creates an appropriate emotional moment without
  reducing clarity or speed.
- Keep content distinct from controls. Use materials and translucency sparingly;
  choosing them for appearance alone creates weak hierarchy.
- Limit prominent actions to one or two in a view. Distinguish a preferred choice
  by style, not arbitrary size, and never make a destructive action primary.
- Avoid gratuitous motion and pointer effects. Frequent interactions should feel
  immediate, not performative.

[Sources: Design principles](https://developer.apple.com/design/human-interface-guidelines/design-principles),
[Materials](https://developer.apple.com/design/human-interface-guidelines/materials),
[Buttons](https://developer.apple.com/design/human-interface-guidelines/buttons),
[Motion](https://developer.apple.com/design/human-interface-guidelines/motion)

### `visual-hierarchy.md` and `layout-and-spacing.md`

- Group related items using spacing first; introduce backgrounds, separators, or
  color only when the relationship still needs reinforcement.
- Give essential content room and place it early in the current reading order.
  Use alignment and indentation to improve scanning.
- Reveal secondary content progressively while leaving a visible cue that more
  exists. Progressive disclosure must not make necessary actions undiscoverable.
- Preserve recognizable positions and relationships when layouts adapt. Respect
  safe areas and test the smallest and largest layouts, text sizes, orientations,
  and translated content.
- On iPad and desktop-sized web layouts, keep the full composition until it no
  longer fits, then collapse lower-priority regions. Avoid breakpoint churn.
- On desktop, don't put the only critical control at the bottom edge of a window.

[Source: Layout](https://developer.apple.com/design/human-interface-guidelines/layout)

### `typography.md` and writing guidance

- Use readable sizes and weights at the actual viewing distance. Avoid light
  weights for small text and test the composition rather than trusting a mockup.
- Keep the typeface set small. Express hierarchy with a coherent combination of
  size, weight, color, and spacing; preserve the relationships as text enlarges.
- Let important text grow, reflow, and stack. Reduce columns before truncating
  meaningful content. Meaningful icons should scale with related text.
- Establish voice and terminology, adapt tone to the situation, write plainly,
  lead control labels with verbs, and use consistent capitalization.
- Put errors next to their cause, avoid blame, and provide a concrete correction.

[Sources: Typography](https://developer.apple.com/design/human-interface-guidelines/typography),
[Writing](https://developer.apple.com/design/human-interface-guidelines/writing),
[Inclusion](https://developer.apple.com/design/human-interface-guidelines/inclusion)

### `color.md`

- Give a color one semantic meaning and use that meaning consistently. Never use
  color as the only signal for status, selection, interactivity, or errors.
- Define and test light, dark, and increased-contrast variants. Dark appearance is
  not a mechanical inversion of light appearance.
- Test contrast in context, on actual displays, and with imagery or translucency
  behind the interface. Use semantic colors where the platform provides them.
- Reserve accent color for meaningful emphasis, status, or primary actions. A
  colorful content layer usually needs quieter controls.
- Consider cultural interpretation and attach color profiles to image assets.

[Sources: Color](https://developer.apple.com/design/human-interface-guidelines/color),
[Dark Mode](https://developer.apple.com/design/human-interface-guidelines/dark-mode),
[Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)

### `icons.md` or the icon section

- Prefer a familiar symbol or a short verb label, whichever communicates the
  action faster. Use icon-only controls only when the symbol is widely understood
  or space truly requires it.
- Keep the icon family consistent in size, detail, weight, stroke, and perspective.
  Match adjacent text weight unless one intentionally has more emphasis.
- Center optically, not only mathematically. Asymmetric icons may need tiny padding
  corrections; small sizes may need simplified drawings rather than scaled detail.
- Use vector assets for interface icons, provide accessible names for functional
  icons, localize essential text within icons, and consider cultural meaning.
- Flip navigation, reading-direction, and progress symbols for RTL. Do not flip
  logos, universal marks, photographs, or real-world objects without a directional
  meaning.
- Design selected variants only when the component doesn't already provide the
  state. Always show press, hover, focus, disabled, and destructive states where
  those inputs or roles exist.

[Sources: Icons](https://developer.apple.com/design/human-interface-guidelines/icons),
[SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols),
[Right to left](https://developer.apple.com/design/human-interface-guidelines/right-to-left),
[Buttons](https://developer.apple.com/design/human-interface-guidelines/buttons)

### Images and depth references

- Use resolution-appropriate assets and test them on representative real devices.
  Prefer vectors when substantial scaling is expected; attach color profiles.
- Keep essential image content inside a crop-safe region and never distort aspect
  ratio merely to fit a container.
- If depth or parallax is used, assign clear foreground, middle, and background
  roles. Keep the effect subtle and preview cropping, focus, and movement.
- Keep text on a reliably legible plane or surface instead of trusting a particular
  photograph or crop to maintain contrast.

[Sources: Images](https://developer.apple.com/design/human-interface-guidelines/images),
[Layout](https://developer.apple.com/design/human-interface-guidelines/layout),
[Motion](https://developer.apple.com/design/human-interface-guidelines/motion)

### `component-composition-and-states.md`

- Prefer conventional components when their semantics match. Familiar behavior,
  complete states, input support, and accessibility are more valuable than visual
  novelty. Customize only after preserving the contract.
- Buttons need a clear purpose, adequate separation and hit region, visible press
  feedback, and a concise label or familiar symbol.
- Ask for no data the system can safely supply. Prefer selection over typing, label
  fields outside placeholders, validate while correction is easy, and clearly mark
  what must be complete before continuing.
- Show content or a meaningful placeholder quickly. Use determinate progress when
  duration is known, allow other work during waits, and describe AI processing
  specifically rather than displaying vague activity.
- Put ordinary status near the affected content. Interrupt only for critical,
  actionable information or unexpected irreversible loss.
- Keep modal tasks short and focused, provide an obvious exit, avoid stacked
  modals, and confirm dismissal only when it risks losing work.
- Teach through use and contextual tips. Keep prerequisite onboarding short,
  skippable when possible, and free of nonessential setup or permission prompts.
- Delay account requirements until they are necessary. Keep account deletion and
  recovery discoverable and explain long-running status.
- Provide useful defaults, keep settings few, and place task-specific options next
  to the task rather than in a distant settings screen.
- Make undo predictable, support multiple steps where practical, and visibly show
  the result when it occurs outside the current viewport.

[Sources: Components](https://developer.apple.com/design/human-interface-guidelines/components),
[Buttons](https://developer.apple.com/design/human-interface-guidelines/buttons),
[Entering data](https://developer.apple.com/design/human-interface-guidelines/entering-data),
[Loading](https://developer.apple.com/design/human-interface-guidelines/loading),
[Feedback](https://developer.apple.com/design/human-interface-guidelines/feedback),
[Modality](https://developer.apple.com/design/human-interface-guidelines/modality),
[Onboarding](https://developer.apple.com/design/human-interface-guidelines/onboarding),
[Managing accounts](https://developer.apple.com/design/human-interface-guidelines/managing-accounts),
[Settings](https://developer.apple.com/design/human-interface-guidelines/settings),
[Undo and redo](https://developer.apple.com/design/human-interface-guidelines/undo-and-redo)

### New accessibility and interaction reference

This material is broad enough to justify a focused accessibility and interaction
reference instead of duplicating it across visual topics:

- Support text enlargement and reflow, meaningful icon scaling, sufficient
  contrast, and alternatives to color-only information.
- Provide screen-reader names and semantic order. Pair audio information with text
  or visuals and pair visual-only feedback with another perceivable channel.
- Use comfortably sized targets. Apple's default targets are 44×44 pt for iOS,
  iPadOS, and watchOS; 28×28 pt for macOS; 66×66 pt for tvOS; and 60×60 pt for
  visionOS. Treat these as platform values, not universal CSS dimensions.
- Leave enough separation to prevent accidental activation. Apple suggests roughly
  12 pt around controls with a bezel and 24 pt around unbezeled visible edges.
- Offer simple gestures and visible alternatives; support keyboard-only, Voice
  Control, Switch Control, and relevant assistive inputs.
- Avoid timed dismissal for content people must process. Provide media controls,
  respond to reduced-motion preferences, and avoid flashing or sustained rapid
  animation.

[Source: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)

## Gaps and cautions

- Public HIG content is JavaScript-rendered; nonbrowser crawlers can receive only a
  JavaScript requirement. Recheck important rules in a rendered browser.
- There is no Apple HIG web-platform branch. `Web views` describes embedded web
  content in Apple apps; it is not a responsive-web design standard.
- Shared articles often cover multiple platforms at one URL. Preserve the platform
  qualifier when importing a rule; don't promote platform values to universal law.
- The HIG changes over time. Keep this retrieval date and revisit Apple sources
  before treating dimensions or component behavior as current.
- This review intentionally does not import Swift, UIKit, AppKit, SwiftUI,
  entitlement, or App Store implementation mechanics unless they alter the user
  experience.
