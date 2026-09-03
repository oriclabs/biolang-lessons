# Attribution and licence notes

This lesson is an independent BioLang companion to Stephen D. Turner's
*Biological Data Science with R*, chapter 13:
https://bdsr.stephenturner.us/ggtree.html

The upstream BDSR repository is licensed CC BY-NC 4.0. This repository does
not copy upstream prose, R code, tables, or figure files. It follows the public
section and exercise order, cites the source, independently explains the
concepts, and redraws figures with BioLang. BioLang-authored lesson files are
MIT licensed.

`tree_newick.nwk` is the small teaching tree distributed with BDSR. It is
retained under the upstream CC BY-NC 4.0 terms and excluded from this
repository's MIT grant.

`many_trees_seed42.nwk` contains deterministic tree data independently
regenerated from the public section 13.6.1 recipe (`set.seed(42)` followed by
`ape::rtree`) and ladderized to retain ggtree's displayed orientation. It is
included under this repository's MIT grant. The external R/ape run was used as
a validation oracle only; no R or GPL-licensed ape source or binary is copied,
linked, or required by the lesson.

`flu_tree_beast.tree` and `flu_aasequence.fasta` are the advanced-tree teaching
files distributed from the BDSR/BioConnector data page. That data page states
CC BY-NC-SA 4.0. These files are excluded from the repository MIT grant. They
derive from the influenza H3 analysis described by Liang et al. (2014).

The advanced section cites Liang et al. (2014), *Journal of Virology*
88:10864–10874, doi:10.1128/JVI.01315-14, and the ggtree paper by Yu et al.
(2017), *Methods in Ecology and Evolution* 8:28–36,
doi:10.1111/2041-210X.12628. PhyloPic images, ggtree source, and
R/Bioconductor binaries are not redistributed or linked into BioLang by this
lesson.

This companion is not affiliated with or endorsed by the BDSR author, ggtree,
Bioconductor, BEAST, PhyloPic, or the cited study authors.
