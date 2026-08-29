# BDSR lesson follow-up

## Native mosaic plot

- [x] Add a native BioLang mosaic plot and replace the lesson's explicitly labelled heatmap alternative.

Why: the BDSR chapter visualizes categorical association with R's `mosaicplot()`. The current BioLang lesson calculates the same Race x Insured contingency table and chi-square statistic, but displays cell counts as a heatmap. That is useful, but it is a different visual encoding and is not visual parity.

Acceptance criteria:

1. [x] Introduce renderer-neutral mosaic geometry derived from a contingency table; rectangle area must be proportional to observed counts.
2. [x] Preserve row and column labels, zero-count cells, deterministic ordering, and missing-value disclosure.
3. [x] Support count, row-proportion, and column-proportion views; optionally shade standardized residuals to show cells driving association.
4. [x] Render publication-quality SVG plus the existing HTML/canvas fallback and compact terminal rendering.
5. [x] Include accessible descriptions, legends, tooltips/labels, themes, and downloadable output through the normal BioLang plot contract.
6. [ ] Validate rectangle geometry and counts against R `mosaicplot()` on synthetic tables and the BDSR Race x Insured table without copying R or BDSR source code.
7. [ ] Add an image snapshot and large-table stress test. Unit geometry, malformed-input, zero-cell, replay, and fallback tests are implemented.
8. [x] Update `lesson.bln` and `validation.json` while retaining attribution to the original BDSR chapter.

Likely ownership: the renderer-neutral plot specification and renderers belong in BioLang core; the real-data parity check and lesson replacement belong in this content repository.
