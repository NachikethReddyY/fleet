# Visual Hierarchy

Visual hierarchy communicates the relative importance of interface elements.
Rank information and actions deliberately so the user can identify what matters
first, what supports it, and what can wait. When everything competes equally,
the interface becomes noisy even when its individual styles are polished.

## Use size, weight, and contrast together

Create primary, secondary, and tertiary levels with a combination of:

- size;
- font or border weight;
- foreground-to-background contrast;
- position and surrounding space.

Avoid making primary text enormous and secondary text too small. Preserve
readable sizes, then use stronger weight or contrast for emphasis and softer
contrast for supporting content. When choosing the actual colors or text tones,
follow [color.md](color.md). When using space to establish importance or
grouping, follow [layout-and-spacing.md](layout-and-spacing.md).

Two text weights usually cover ordinary interface work:

- 400 or 500 for most text;
- 600 or 700 for emphasis.

Weights below 400 are often difficult to read at small sizes. De-emphasize
small text with restrained contrast or size before reaching for a lighter
weight.

## Emphasize by reducing competition

When the primary element still does not stand out, reduce the prominence of
nearby elements before adding more decoration to it. Examples include softening
inactive navigation items or removing a sidebar surface that competes with the
main content.

The test is relational: inspect an element against its neighbors, not in
isolation.

## Present labels according to the user's scan

This guidance applies to displayed data, not accessible labels for form
controls.

Prefer the value alone when its format or context identifies it clearly, such
as an email address, phone number, or price. When a short phrase is clearer than
a label-value pair, combine them:

- `In stock: 12` becomes `12 left in stock`.
- `Bedrooms: 3` becomes `3 bedrooms`.

When a label is necessary, decide whether the user scans for the value or the
label:

- If the value carries the meaning, keep the label smaller, lighter, or lower
  contrast.
- If users scan for named fields among similar specifications, give the label
  slightly more prominence while keeping the value readable.

Do not default every data point to equally weighted `label: value` rows. That
structure hides the information's real priority.

## Separate semantic and visual hierarchy

Choose HTML elements for meaning and accessibility, then style them for the
interface's actual visual hierarchy. An `h1` remains the page's semantic
heading even when the page title should be compact. A section title may behave
visually like a supporting label when the section content deserves more
attention.

Browser default heading sizes are not design requirements. Preserve a logical
document outline and accessible names without allowing tag choice to dictate
prominence.

## Balance visual weight and contrast

Visual weight comes from the amount and density of pixels an element occupies.
Balance it against contrast:

- Lower the contrast of a heavy or solid icon beside text so the icon does not
  dominate.
- Increase the width of a low-contrast border when darkening it would make the
  interface harsh.
- Evaluate icons, borders, text, and filled surfaces as one composition rather
  than assigning each the same contrast.

## Rank actions by importance

Style actions by their importance in the current context, not only by semantic
type:

- **Primary:** the page's main next step; obvious and high contrast.
- **Secondary:** available and clear without competing with the primary action.
- **Tertiary:** discoverable but quiet, often using link-like treatment.

Most views need one primary action. Severity and priority are separate axes: a
destructive action does not automatically deserve the strongest treatment. It
may remain secondary or tertiary on the normal page, then become the primary,
clearly destructive action inside its confirmation step.

## Use elevation as hierarchy

Elements that appear closer attract more attention. Give higher elevation only
to content or interaction that must temporarily sit above its surroundings,
such as a menu, dragged item, or modal. Keep ordinary content near the base
plane so elevation retains meaning.

Visual prominence and stacking order must agree: a high shadow on a low-priority
element creates false hierarchy. Follow
[depth-and-elevation.md](depth-and-elevation.md) for the light, shadow, layer,
and interaction system.

## Use imagery as part of the hierarchy

Treat imagery as content with its own visual weight, not as decoration that can
be swapped after layout is complete. A photograph, illustration, screenshot,
or icon can dominate the composition, change perceived color, and determine
where text can sit.

### Design with representative final assets

Use production-quality, project-appropriate imagery while establishing the
layout. Resolution alone is insufficient: composition, crop, subject, lighting,
and palette must support the product and the element's intended priority.

When final assets are unavailable, use substitutes with the same subject,
aspect ratio, brightness range, and focal placement. Mark them as temporary and
recheck the composition with the final assets. A neutral placeholder does not
expose real cropping, contrast, or visual-weight problems.

### Preserve text contrast across the whole image

Text over imagery must remain readable across the entire text area, every
responsive crop, and every permitted image. Choose the least destructive
solution that produces stable contrast:

1. Select or crop to a visually quiet region.
2. Reposition the focal point so subject and text do not compete.
3. Add a light or dark overlay that reduces the image's tonal range beneath the
   text.
4. Adjust image contrast and compensate with brightness when an overlay changes
   the whole image too much.
5. Desaturate and tint or colorize the image when that also supports the brand.
6. Add a restrained, diffuse text shadow only as local reinforcement.

Test the actual text and worst permitted image rather than a favorable sample.
If stable contrast still depends on a particular crop or pixel region, move the
text onto its own surface. Follow [color.md](color.md) for foreground, overlay,
and accessibility decisions.

### Match every asset to its rendered size

Vector format preserves edge sharpness, not an asset's visual suitability at
every size. Detail, stroke weight, spacing, and silhouette must suit the size at
which the asset is rendered.

- Use an icon or illustration drawn for the intended scale. To give a small
  icon more presence, retain its suitable size inside a larger supporting shape
  instead of enlarging its strokes and limited detail.
- Provide simplified small-size variants for detailed marks and icons. Let the
  designer control what disappears instead of leaving detail loss to the
  renderer.
- Capture screenshots at an appropriate viewport and reserve enough space for
  legible detail. When space is limited, crop to the relevant region or create
  a faithful simplified view that communicates structure without pretending
  tiny text is readable.

Inspect assets at their real rendered size and target pixel density. Do not
approve them only in a zoomed design canvas.

### Constrain unpredictable imagery

User-uploaded or externally supplied images need a layout contract because
their aspect ratio, crop, background, and quality are unknown:

- give each context a defined container and aspect-ratio policy;
- choose crop-to-fill or fit-within based on whether losing image content is
  acceptable;
- preserve or collect a focal point when the subject must survive cropping;
- provide explicit missing, loading, broken, and unsupported-image states;
- separate pale, transparent, or background-matched images from the interface
  with a restrained inner ring or inset shadow when needed;
- test extreme portrait, landscape, transparent, low-contrast, and low-quality
  inputs.

The separation treatment belongs to the image container and should follow the
project's [depth-and-elevation.md](depth-and-elevation.md) system. Avoid a strong
border whose color competes with arbitrary image content.

### Preserve the image's meaning

Decide whether each image is informative, functional, or decorative. Provide a
useful accessible name or alternative for informative and functional imagery;
keep decorative imagery out of the accessibility tree. Keep essential text and
controls in the interface rather than baking them into an image.

## Review gate

Before completing an interface-design pass, verify:

1. The intended primary element is identifiable without explanation.
2. Secondary and tertiary content remains readable but does not compete.
3. Labels reflect what the user scans for.
4. Semantic structure and visual prominence are independently correct.
5. Icons, borders, and text feel balanced by weight and contrast.
6. One action is primary where the view has a clear main next step.
7. Destructive styling reflects both severity and contextual priority.
8. Elevation reinforces importance and stacking order instead of decoration.
9. Imagery has been judged at its final crop, size, and density.
10. Text remains readable over every supported image and responsive crop.
11. Icons, marks, and screenshots are designed for their rendered scale.
12. User-supplied imagery cannot break layout or erase its own boundaries.
13. Informative, functional, and decorative images have the correct accessible
    treatment.
