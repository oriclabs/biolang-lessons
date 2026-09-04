# Attribution and licence boundaries

This lesson is a non-commercial BioLang adaptation of Stephen D. Turner's
*Biological Data Science with R*, chapter 9, “Survival analysis”:

- rendered chapter: <https://bdsr.stephenturner.us/survival.html>
- source repository: <https://github.com/stephenturner/bdsr>
- upstream copyright: © 2019 Stephen D. Turner, Ph.D.
- upstream licence: [CC BY-NC 4.0](https://github.com/stephenturner/bdsr/blob/main/LICENSE)

The lesson is a non-commercial adaptation under CC BY-NC 4.0. It follows the
source sequence through section 9.3.2 and preserves its exercises, datasets,
analyses, and figure specifications in BioLang. The SVG figures are generated
at runtime from the data; published source images are not copied. This work is
not an official BDSR publication and does not imply endorsement.

## Dataset boundary

The five CSV files are excluded from the repository's MIT licence:

- `lung.csv` and `colon.csv` are narrow, mechanically generated extracts from
  datasets distributed with R package `survival` 3.8.3, licensed LGPL (>= 2).
  The package documentation retains the original study citations.
- `tcga-clinical.csv` and `tcga-kidney.csv` are narrow extracts from Bioconductor package
  `RTCGA.clinical` 20151101.40.0.
- `tcga-expression.csv` is a narrow extract from Bioconductor package
  `RTCGA.mRNA` 1.38.0.
- RTCGA data packages are distributed under GPL-2. The extracts remain under
  those upstream terms and are not linked into or shipped with the MIT BioLang
  executable. Studio downloads lesson data explicitly and verifies checksums.
- TCGA remains the originating public research programme; RTCGA supplied the
  fixed 1 November 2015 teaching snapshot used by the source chapter.

The reproducible extraction and validation script is
`validation/reference.R`. Running it requires the separately installed R
packages; those packages are validation oracles and are not BioLang runtime
dependencies.
