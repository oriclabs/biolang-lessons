# Attribution and licence

This lesson ports a bounded portion of Stephen D. Turner's *Biological Data Science with R*, Chapter 9, sections 9.2.2–9.2.3:

- Published chapter: https://bdsr.stephenturner.us/survival.html
- Source repository: https://github.com/stephenturner/bdsr
- Pinned revision: `f16caf3d3df4ac27297b87f50c37c7c024471208`
- Copyright: © 2019 Stephen D. Turner, Ph.D.
- Licence: Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0), https://creativecommons.org/licenses/by-nc/4.0/

The three figures are generated at runtime by BioLang from the exact dataset.
Their curve geometry, censoring treatment, confidence intervals, axes, labels,
palettes, p-value, and risk table reproduce the selected source calls; no
published source image is included.

`data/lung.csv` serializes the `cancer`/`lung` data object distributed by the R `survival` package. The package is licensed LGPL (>= 2). The data are credited by its documentation to Terry Therneau and to Loprinzi CL et al., *Journal of Clinical Oncology* 1994;12(3):601–607. The CSV retains all 228 observations and all ten source variables, with only the CSV row-name column added by the Rdatasets serialization.

This adaptation is non-commercial, identifies its selected scope and transformations, and does not imply endorsement by the source authors.
