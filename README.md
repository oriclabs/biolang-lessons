# BioLang Lessons

Installable, executable learning material for biology and biomedical data work
with BioLang. Lessons live here rather than in language, package, Studio, or
workflow repositories.

## Organisation

```text
lessons/
  biostatistics/
  data-quality/
  ecology/
  epidemiology/
  genomics/
  machine-learning/
  microbiology/
  phylogenetics/
  sequence-analysis/
  single-cell/
  transcriptomics/
  visualization/
```

Each lesson directory owns its notebooks, manifest, source datasets, validation,
and attribution notice. A schema-1 manifest opens one notebook; a schema-2
manifest is an ordered collection shown as one Studio tab with a selectable
active section. Each child notebook keeps independent cells, results, and
replayable execution progress without crowding the tab strip. Large or
independently hosted data is declared by URL and checksum and is downloaded
only when the learner asks for it.

Independent lessons from one external book use optional `series` metadata.
Studio groups them under one book heading and orders them by chapter, while
each lesson can still be installed, updated, shared, or removed on its own.

The [BioLang registry](https://registry.lang.bio/) is the discovery layer. It
points to versioned lesson manifests in this repository; Studio remains a
generic editor and does not bundle these lessons.

## Discoverability contract

Every lesson manifest must include a `discoverability` object with six
duplicate-free arrays: `problems`, `methods`, `plots`, `terms`, `aliases`, and
`functions`. The first, second, fourth, and fifth are non-empty; `plots` and
`functions` may be empty when the lesson genuinely contains none. Write problem entries in the words a learner might
search (for example, `compare survival between patient groups`), not only as
technical labels. Keep `tags` short and visible; discoverability can be richer.

Schema-2 collections provide an aggregate object for Registry search and one
object on each child lesson for precise section discovery. `npm test` rejects a
new lesson that omits any part of this contract. When a notebook gains an
important method, plot, or BioLang function, update its discoverability terms
in the same change.

Every schema-2 notebook also ends with in-content Previous and/or Next links to
its adjacent section, using `#lesson-section=<section-id>`. Studio handles these
links without leaving the collection; the section selector remains available
for jumping directly to any notebook. `npm test` verifies the adjacent links.

## Current collections

- `lessons/biostatistics/little-book-biomedical`: eight connected biomedical
  statistics lessons adapted from Avril Coghlan's CC BY 3.0 booklet.
- `lessons/biostatistics/little-book-r-multivariate`: four connected notebooks
  port the complete multivariate-analysis sequence over the exact UCI Wine
  data, with all nine source figures, source-matching summaries and PCA, and a
  transparent replay of the published LDA coefficients and downstream results.
- `lessons/sequence-analysis/little-book-r-bioinformatics`: the first two DNA
  Sequence Statistics chapters from *A Little Book of R for Bioinformatics*.
  Together with `little-book-r-gene-finding`, this source now exposes three
  notebooks under one series; the two-notebook collection also has in-content
  Previous/Next links.
- Priority-1 source ports, each deliberately bounded to verified workflows:
  - `lessons/genomics/computational-genomics-intervals`: GRanges construction
    and the first two Chapter 6 exercises.
  - `lessons/genomics/computational-genomics-refseq-tss`: the exact real RefSeq
    hg19 chromosome 21 BED import and strand-aware TSS transformation.
  - `lessons/biostatistics/msmb-discrete-models`: the opening Poisson and
    binomial examples, with exact published chapter figures.
  - `lessons/biostatistics/msmb-celegans-mitochondrial-composition`: the real
    UCSC ce2 chromosome M composition exercise, stopping before simulation.
  - `lessons/biostatistics/rmrwr-sample-size`: the opening A1c study-planning
    example, including the source's attrition-arithmetic discrepancy.
  - `lessons/biostatistics/rmrwr-blood-storage-columns`: exact selection from
    the de-identified 316-patient blood-storage cohort.
  - `lessons/ecology/data-carpentry-ecology`: grouped species/sex summaries
    using the exact Portal Project teaching CSV.
  - `lessons/ecology/data-carpentry-daily-counts`: exact daily-by-sex counts
    from the same field data and the byte-for-byte published solution plot.
- Priority-2 source ports that passed the strict one-to-one fidelity gate:
  - `lessons/biostatistics/bdsr-nhanes-eda`: the bounded NHANES descriptive
    and EDA sequence with source-hosted data and six exact published PNGs.
  - `lessons/biostatistics/bdsr-nhanes-group-tests`: exact Welch, ANOVA, and
    Tukey results with the published smoking/BMI boxplot.
  - `lessons/biostatistics/bdsr-nhanes-regression`: exact height-weight OLS
    and both published regression figures.
  - `lessons/biostatistics/bdsr-lung-survival`: exact `survival::lung`
    observations, source Kaplan-Meier calculations, and all three canonical
    PNGs from the selected survival sections.
  - `lessons/phylogenetics/treedata-metadata-attachment`: Chapter 7 Figure 7.1
    using the exact tree, tip, node, and published SVG assets.
  - `lessons/phylogenetics/treedata-snp-traits`: Chapter 7 Figure 7.2 using
    the exact official package objects and byte-for-byte published figure.
  - `lessons/ecology/stats4nr-fishing-dispersion`: the exact fishing-count
    dispersion check and source histogram, stopping before unsupported models.
  - `lessons/ecology/stats4nr-redpine-ols`: exact correlation, OLS, and AIC
    over 450 real field observations; the source table's intercept typo is
    disclosed rather than forced by changing data.
- Priority-3 source ports that passed the same gate:
  - `lessons/visualization/dataviz-protocols`: three connected protocols over
    exact plot-ready experimental tables—fluorescent-protein spectra,
    differential-expression volcano ranking, and CFP/YFP co-expression—with
    all three canonical source PNGs copied byte for byte.
- Cross-category source ports selected from the full Big Book of R catalogue:
  - `lessons/ecology/fish-forecast-anchovy`: exact Hellenic landings data,
    opening anchovy regression/forecast, and both canonical source plots.
  - `lessons/epidemiology/beyondmlr-birdkeeping`: exact 147-person
    case-control table and years-smoking-adjusted logistic model; the selected
    exercise publishes no answer figure, so no substitute is drawn.
  - `lessons/machine-learning/aml4td-cell-tabularization`: the exact four-cell
    feature table and both byte-for-byte biological source images.
  - `lessons/data-quality/validate-cars-rules`: exact `cars` data, all four
    source rules and results, and the canonical validation plot.
  - `lessons/microbiology/mswr-bacteria-extrapolation`: exact 241-point
    bacterial-growth data and observations 45–90 fit; the source code disables
    figure rendering, so the lesson remains numerical rather than redrawing it.

The current P1–P3 re-audit, including additions, exclusions, and capability
holds, is recorded in [`PRIORITY_AUDIT.md`](PRIORITY_AUDIT.md). Priority is an
adoption order, not a quota or a promise to port every chapter.

## No-synthetic-data audit

- `archive/p1-synthetic-exclusions/epir-standardised-rates` is not published:
  the EpiR source explicitly labels its country population and death tables
  fictitious.
- The MSMB mitochondrial lesson stops before its multinomial simulation.
- The Stats4NR falcon candidate is archived because its source explicitly says
  those observations were simulated.
- A source exercise without a canonical output figure does not receive a
  locally redrawn substitute. Such lessons remain numeric/tabular only.

## Priority-2 fidelity audit

- Five earlier, broader *Biological Data Science with R* companions are retained under
  `archive/p2-non-fidelity-bdsr`, but are no longer published or registered.
  They used independently redrawn plots or substituted analysis paths rather
  than one-to-one source outputs. The three bounded NHANES replacements and
  bounded lung-survival replacement listed above are the active lessons from
  that book.
- The broader *Statistics in Natural Resources* fishing-model candidate is
  retained under `archive/p2-non-fidelity-stats4nr`, but is not published or
  registered. BioLang's current Poisson GLM did not reproduce the source
  coefficients and failed to converge. The simulated falcon draft is retained
  there for audit only. The bounded fishing and real red-pine lessons listed
  above are the active replacements.

## Validate

Check the repository structure with Node.js:

```sh
npm test
```

Each collection also documents its BioLang execution and numerical validation
commands. Dataset-heavy checks remain opt-in and must use the checksums declared
by their manifests.

## Repository boundary

- `biolang` implements the language and built-ins.
- package repositories implement reusable APIs.
- `biolang-studio` reads and edits lesson manifests and notebooks.
- `biolang-workflows` contains complete analyses, benchmarks, and external
  validation pipelines.
- this repository contains teaching sequences.

## Licensing

Repository-authored tooling is MIT licensed. Lesson content is licensed per
collection because adaptations can inherit upstream terms. Always read the
collection's `ATTRIBUTION.md` and manifest before redistributing it. See
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).
