# Attribution and licence notes

This lesson is an independent BioLang companion to Stephen D. Turner's
*Biological Data Science with R*, chapter 12:
https://bdsr.stephenturner.us/rnaseq.html

The upstream BDSR repository is licensed CC BY-NC 4.0. This repository does not
copy upstream prose, R code, tables, or figure files. It follows the public
chapter and exercise order, cites the source, independently explains the
methods, and redraws figures with BioLang. The BioLang-authored lesson files are
MIT licensed; the data artifacts listed below are excluded from that MIT grant.

## Data and software provenance

- `airway_scaledcounts.csv` and `airway_metadata.csv` are BDSR teaching files
  derived from the airway smooth-muscle RNA-seq experiment (GEO GSE52778),
  described by Himes et al., *PLoS ONE* 9:e99625 (2014). The BDSR files are
  redistributed under CC BY-NC 4.0. Bioconductor's `airway` package identifies
  its package licence as LGPL.
- `annotables_grch38.csv` is the historical GRCh38 annotation file used by the
  chapter. The `annotables` DESCRIPTION declares GPL-3. The CSV is excluded
  from the repository MIT grant.
- `deseq2_results.csv`, `crispld2_counts.csv`, `pca.csv`, and
  `heatmap_top25.csv` are independently generated numeric validation artifacts
  derived from the pinned inputs using R 4.5.2 and DESeq2 1.44.0. They retain
  the underlying data attribution and are excluded from the MIT grant. They do
  not contain or link DESeq2 source or binaries.
- DESeq2 is cited as Love MI, Huber W, Anders S (2014), *Genome Biology*
  15:550, doi:10.1186/s13059-014-0550-8. Current Bioconductor DESeq2 declares
  LGPL (>= 3).

The R script under `validation/` is an independent validation harness. R and
DESeq2 are optional external tools and are never shipped inside BioLang.

This companion is not affiliated with or endorsed by the BDSR author,
Bioconductor, the airway study authors, Ensembl, or the DESeq2 authors.
