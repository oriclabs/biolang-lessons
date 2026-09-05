# BDSR essential-statistics lesson package

This independent BioLang companion is inspired by and numerically validated against Stephen D. Turner's [Essential statistics](https://bdsr.stephenturner.us/stats.html) chapter in *Biological Data Science with R* (BDSR). The [canonical BDSR source](https://github.com/stephenturner/bdsr) is © 2019 Stephen D. Turner, Ph.D. and licensed [CC BY-NC 4.0](https://github.com/stephenturner/bdsr/blob/main/LICENSE). This package does not copy upstream prose, R code, tables, or figures. OriClabs independently wrote the BioLang code, explanations, and figures under MIT; the package is not an official BDSR publication or endorsement. The upstream licence's non-commercial term remains relevant to anyone who later chooses to reuse BDSR material directly.

This is optional content for BioLang Studio, not part of Studio itself. After this repository is published, add the manifest URL in Studio:

```text
https://raw.githubusercontent.com/oriclabs/biolang-lessons/main/lessons/biostatistics/bdsr-essential/lesson.json
```

Studio stores the installed lesson entry locally. It downloads the two source-hosted datasets only when the user selects **Prepare**, verifies their exact sizes and SHA-256 checksums, and removes their cache when the lesson is removed.

The original source is also credited in the visible notebook, `lesson.json`, `validation.json`, and [`ATTRIBUTION.md`](ATTRIBUTION.md). The upstream BDSR material is not relicensed under MIT: this lesson does not include its prose, R source, or rendered figures. Checked quantities and the small documented root-tolerance difference in the noncentral-t power calculation are recorded in `validation.json`.
