# Source map

| Lesson material | Pinned source section or chunk | Treatment |
|---|---|---|
| Adult filter | 8.3.1 setup, `filterAdults` | Direct syntax translation: `Age >= 18`. |
| Alcohol distribution | 8.3.2, `alcoholhist` | BioLang `histogram()` uses the exact adult `AlcoholYear` values, 30 ggplot bins, source labels, and ggplot panel. |
| Wilcoxon rank-sum | 8.3.2, `wilcoxtest` | Direct computation with normal approximation and continuity correction; tied half-rank disclosed. |
| Two-group model equivalence | 8.3.3 | Equal-variance t-test, two-group ANOVA, and indicator OLS over the exact complete BMI rows. |
| Testosterone models | 8.3.6 | Three nested source formulas reproduced over the exact complete rows. |
| Gender by diabetes tables and tests | 8.4.1 | Exact counts, margins, overall and row proportions, Yates-corrected chi-square, and Fisher exact test. |
| Gender by diabetes mosaic | 8.4.1, first `mosaicplot(xt, main=NA)` | BioLang `mosaic_plot(layout: "base", shade: "column")` preserves count geometry, source category order, gaps, outer labels, and no title; categorical fills distinguish response columns in Studio. |
| Race by insurance tables and test | 8.4.1 | Exact counts, margins, row proportions, chi-square result, and expected counts. |
| Race by insurance mosaic | 8.4.1, second `mosaicplot(xt, main=NA)` | Same source-faithful runtime mosaic treatment at the source's wider aspect ratio. |
| Insurance logistic models | 8.4.2 | Direct formulas with White pinned as the treatment-contrast reference, matching the source relevel operation. |
| Power calculations | 8.5.1-8.5.2 and exercises 10-12 | Every displayed input is translated directly; t-test power uses the source's default `strict=FALSE` tail convention. |
| Tidy coefficient and model tables | 8.6 | BioLang diagnostic records are presented in source formula order as the `tidy()` and `glance()` counterparts. |
| Male residual plot | 8.6, `augment(fit)` plot | BioLang plots exact fitted values/residuals for source-model males, with source colour, size, axes, legends, and ggplot panel. |
| Study-design guidance | 8.7 | Batch effects, defining biological n, and technical versus biological replicates are retained with the source readings; no synthetic demonstration data are introduced. |

The source's decorative `broom.jpg` image is not an analytical output and is
not copied. No replacement decorative image is introduced.
