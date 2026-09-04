# P1–P3 lesson adoption audit

Checked 2026-09-03 against the strict fidelity rule: a selected source portion
must use real source data, retain the same transformations and parameters,
match reported results, and display the exact canonical source figure whenever
the selected portion has one. A source may yield several lessons or none;
priority never determines a lesson count.

## Priority 1

| Source | Decision | Active coverage or reason |
| --- | --- | --- |
| *A Little Book of R for Biomedical Statistics* | Keep and expand only when a distinct chapter adds value | Eight connected notebooks already cover the useful foundational sequence with exact source examples. No padding added. |
| *A Little Book of R for Bioinformatics* | Temporarily withdraw the current bounded ports | The numerical work is source-faithful, but Chapter 2 and computational gene finding still embed copied analytical figures. Restore Registry discovery only after those figures are generated one-to-one by BioLang. Pairwise alignment remains held because BioLang does not yet implement the source's BLOSUM50 plus affine-gap scoring. |
| *Computational Genomics with R* | Keep | Two distinct real-data lessons cover genomic intervals and hg19 RefSeq TSS transformation. |
| *Modern Statistics for Modern Biology* | Keep the mitochondrial lesson; temporarily withdraw discrete models | The mitochondrial composition exercise remains fully numerical over real sequence data. The discrete-model lesson still embeds two copied analytical figures and is withheld pending exact BioLang bar plots. Simulation is excluded. |
| *Reproducible Medical Research with R* | Keep | Two distinct lessons cover the exact A1c planning example and exact blood-storage cohort columns. |
| *Data Analysis and Visualization in R for Ecologists* | Keep the tabular lesson; temporarily withdraw daily counts | Both use exact Portal Project data, but the daily-count lesson still embeds the copied analytical time-series figure and is withheld pending an exact BioLang render. |
| *R for Applied Epidemiology and Public Health* | Do not publish the audited candidate | The standardised-rates source example explicitly uses fictitious country data, conflicting with the no-synthetic-data rule. |

P1 outcome: the useful, supportable coverage is already active. No extra P1
lesson was added merely to increase counts.

## Priority 2

| Source | Decision | Active coverage or reason |
| --- | --- | --- |
| *Biological Data Science with R* | Keep three NHANES lessons; add one survival lesson | The bounded lessons use the exact NHANES or `survival::lung` observations, match the source calculations, and now generate all twelve selected figures in BioLang with source-matched geometry and presentation. Five old broad redraw-based drafts remain archived. |
| *Data Integration, Manipulation and Visualization of Phylogenetic Trees* | Temporarily withdraw | Both lessons use official objects, but their Chapter 7 analytical figures remain copied assets. Restore them only when BioLang reproduces the shared tree/metadata geometry one-to-one. |
| *Statistics in Natural Resources* | Keep red-pine OLS; temporarily withdraw fishing dispersion | Fishing dispersion uses real data but still embeds a copied histogram. Red-pine OLS remains active. The falcon source is simulated; the broader fishing GLM is held because the current engine does not reproduce the source fit. |

P2 outcome: one high-value survival lesson was added. Other rejected drafts
remain excluded instead of being revived with approximate figures or models.

## Priority 3

| Source | Decision | Active coverage or reason |
| --- | --- | --- |
| *DataViz protocols* | Temporarily withdraw the three connected lessons | Protocols 1, 14, and 16 use exact source-produced CSVs, but their final analytical figures are copied PNGs rather than BioLang renders. Keep the source work for later exact ports; animation, live-service, and unsupported protocols remain excluded. |
| *Orchestrating Single-Cell Analysis with Bioconductor* and its current `scrapbook`/basic material | Hold | The source is openly licensed, but the audited chapters require Bioconductor experiment packages and do not bundle the rendered figures needed for an exact offline port. Add only after the exact datasets and canonical outputs can be pinned and verified. |
| *Cleaning Biodiversity Data in R* | Do not adapt | The source is CC BY-NC-ND 4.0; the NoDerivatives term does not permit an adapted BioLang lesson. Linking to the original remains possible. |
| *Data Science for the Biomedical Sciences* | Hold | No clear repository-wide adaptation licence was found during the audit. Do not copy or adapt content without explicit permission. |
| *A Little Book of R for Bioinformatics 2.0* | Hold selective additions | It substantially overlaps the active 1.0 series and has mixed source provenance. A future chapter must establish its own licence and exact assets before selection. |

P3 outcome: three DataViz notebooks were added as one navigable collection.
The held sources are potentially useful, but usefulness does not override
licence, data provenance, exact-output availability, or engine capability.

## Full-catalogue expansion

After the P1–P3 audit, the complete Big Book of R catalogue was screened for
additional material that fits BioLang's biological scope. Six distinct,
high-value sources passed the usefulness, licensing, real-data, and fidelity
gates and are now active:

| Source | Active lesson | Fidelity and licence decision |
| --- | --- | --- |
| *Fisheries Catch Forecasting* | `fish-forecast-anchovy` (temporarily withdrawn) | Exact real Hellenic landings table and regression inputs, but the two analytical plots are copied and the selected forecast geometry is not yet reproduced by BioLang. |
| *Beyond Multiple Linear Regression* | `beyondmlr-birdkeeping` | Exact 147-person case-control data, unadjusted odds ratio, and source model 4; CC BY-NC-SA 4.0. The exercise publishes no canonical answer plot, so none is substituted. |
| *Applied Machine Learning for Tabular Data* | `aml4td-cell-tabularization` (temporary bounded port) | Exact four-row biological feature table and two canonical cell images; CC BY-NC-SA 4.0. This subsection-only lesson is scheduled for replacement by honestly scoped book-part collections. |
| *A Little Book of R for Multivariate Analysis* | `little-book-r-multivariate-analysis` | Complete selected analysis page over the exact 178-row UCI Wine chemistry data, with all nine canonical PNGs and source-matching summaries, PCA, discriminant scores, separation, and allocation results; book CC BY 3.0 and data CC BY 4.0. The LDA notebook transparently replays the published coefficients because BioLang has no native LDA fitter. |
| *The Data Validation Cookbook* | `validate-cars-rules` (temporarily withdrawn) | Exact `cars` observations, rules, results, and violating rows, but the validation-results chart is still a copied analytical figure. |
| *Modern Statistics with R* | `mswr-bacteria-extrapolation` | Exact 241 bacterial OD measurements and observations 45–90 model window; CC BY-NC-SA 4.0. The selected source publishes code with figure evaluation disabled, so no redraw is included. |

All five are bounded lessons rather than claims to port their entire books.
Their source revisions, data and figure hashes, exact included scope, and
excluded scope are recorded in each lesson's manifest, validation record,
attribution notice, and source map.

## Deferred fidelity work

- *Applied Machine Learning for Tabular Data*: retire the standalone
  `aml4td-cell-tabularization` registry lesson and fold its exact source
  material into a complete Introduction notebook. Structure later coverage as
  navigable Foundations, Preparation, Optimization, and Classification
  collections. Port only completed upstream material whose exact data,
  calculations, supported model engine, and canonical figures can all be
  preserved. Do not substitute data for simulation-based sections, and do not
  create placeholders for the currently unwritten Regression,
  Characterization, or Finalization parts. Audit the separate computing
  supplement's licence before adapting its code.

## Navigation and integrity

- Every multi-notebook collection retains the Studio selector and includes
  in-notebook Previous/Next links using `#lesson-section=<id>`.
- Every bundled dataset and canonical figure is recorded with byte size and
  SHA-256 in its lesson metadata or validation record.
- Registry entries pin each `lesson.json` checksum. Any content change must be
  accompanied by a rebuilt Registry entry so Studio can trust the update.

## Runtime-figure audit

Rechecked 2026-09-04 after restoring the BDSR runtime figures. The four active
BDSR lessons and the multivariate-analysis collection generate their analytical
figures in BioLang from exact source data. The audit also found older active
entries whose analytical output is still a copied published image rather than a
BioLang render: `msmb-discrete-models`, `data-carpentry-daily-counts`,
`stats4nr-fishing-dispersion`, `treedata-metadata-attachment`,
`treedata-snp-traits`, `dataviz-protocols`, `fish-forecast-anchovy`,
`validate-cars-rules`, `little-book-r-bioinformatics` (its analytical Chapter 2
figures), and `little-book-r-gene-finding`. These entries must not be described
as BioLang plotting coverage and should remain withdrawn from Registry discovery
until every selected analytical figure can be regenerated one-to-one.

The six Chapter 1 NCBI screenshots in `little-book-r-bioinformatics` and the two
cell microscopy images in `aml4td-cell-tabularization` are source material, not
analytical plots. They are not synthetic replacements and are therefore tracked
separately from the runtime-figure requirement.
