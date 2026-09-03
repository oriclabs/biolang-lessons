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
| *A Little Book of R for Bioinformatics* | Keep current bounded ports | Three source-faithful notebooks cover DNA statistics and computational gene finding. Pairwise alignment is held because BioLang does not yet implement the source's BLOSUM50 plus affine-gap scoring; a simple-gap substitute would not be one-to-one. |
| *Computational Genomics with R* | Keep | Two distinct real-data lessons cover genomic intervals and hg19 RefSeq TSS transformation. |
| *Modern Statistics for Modern Biology* | Keep | Two distinct lessons cover exact discrete-model figures and the real C. elegans mitochondrial-composition exercise. Simulation is excluded. |
| *Reproducible Medical Research with R* | Keep | Two distinct lessons cover the exact A1c planning example and exact blood-storage cohort columns. |
| *Data Analysis and Visualization in R for Ecologists* | Keep | Two distinct lessons use the exact Portal Project data; the daily-count lesson includes the canonical solution plot. |
| *R for Applied Epidemiology and Public Health* | Do not publish the audited candidate | The standardised-rates source example explicitly uses fictitious country data, conflicting with the no-synthetic-data rule. |

P1 outcome: the useful, supportable coverage is already active. No extra P1
lesson was added merely to increase counts.

## Priority 2

| Source | Decision | Active coverage or reason |
| --- | --- | --- |
| *Biological Data Science with R* | Keep three NHANES lessons; add one survival lesson | The new bounded lung-cancer lesson uses all 228 exact `survival::lung` observations, matches the source Kaplan–Meier results, and includes its three canonical PNGs byte for byte. Five old broad redraw-based drafts remain archived. |
| *Data Integration, Manipulation and Visualization of Phylogenetic Trees* | Keep | Two lessons reproduce distinct Chapter 7 workflows with official data objects and exact Figure 7.1/7.2 assets. |
| *Statistics in Natural Resources* | Keep bounded real-data lessons | Fishing dispersion and red-pine OLS are active. The falcon source is simulated; the broader fishing GLM is held because the current engine does not reproduce the source fit. |

P2 outcome: one high-value survival lesson was added. Other rejected drafts
remain excluded instead of being revived with approximate figures or models.

## Priority 3

| Source | Decision | Active coverage or reason |
| --- | --- | --- |
| *DataViz protocols* | Add three connected lessons | Protocols 1, 14, and 16 are biologically distinctive and locally reproducible. Each uses the exact source-produced CSV and canonical PNG. Animation, live-service, and unsupported protocols are excluded rather than substituted. |
| *Orchestrating Single-Cell Analysis with Bioconductor* and its current `scrapbook`/basic material | Hold | The source is openly licensed, but the audited chapters require Bioconductor experiment packages and do not bundle the rendered figures needed for an exact offline port. Add only after the exact datasets and canonical outputs can be pinned and verified. |
| *Cleaning Biodiversity Data in R* | Do not adapt | The source is CC BY-NC-ND 4.0; the NoDerivatives term does not permit an adapted BioLang lesson. Linking to the original remains possible. |
| *Data Science for the Biomedical Sciences* | Hold | No clear repository-wide adaptation licence was found during the audit. Do not copy or adapt content without explicit permission. |
| *A Little Book of R for Bioinformatics 2.0* | Hold selective additions | It substantially overlaps the active 1.0 series and has mixed source provenance. A future chapter must establish its own licence and exact assets before selection. |

P3 outcome: three DataViz notebooks were added as one navigable collection.
The held sources are potentially useful, but usefulness does not override
licence, data provenance, exact-output availability, or engine capability.

## Navigation and integrity

- Every multi-notebook collection retains the Studio selector and includes
  in-notebook Previous/Next links using `#lesson-section=<id>`.
- Every bundled dataset and canonical figure is recorded with byte size and
  SHA-256 in its lesson metadata or validation record.
- Registry entries pin each `lesson.json` checksum. Any content change must be
  accompanied by a rebuilt Registry entry so Studio can trust the update.

