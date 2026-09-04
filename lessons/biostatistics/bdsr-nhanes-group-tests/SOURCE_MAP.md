# Source map

| Lesson material | Source | Treatment |
|---|---|---|
| NHANES table and dictionary | BDSR `data/nhanes*.csv` | Source-hosted, checksum-pinned downloads. |
| Adult age Welch test | Essential statistics, T-tests | Direct syntax translation and exact numeric validation. |
| Smoking-status ANOVA and Tukey comparisons | Essential statistics, ANOVA | Direct syntax translation and exact numeric validation. |
| Smoking-status boxplot cell | `smoking_boxplots` chunk | Runtime BioLang `stats_group_plot()` uses the same adult BMI rows, factor order (`Never`, `Current`, `Former`, `NA`), type-7 quartiles, 1.5-IQR whiskers/outliers, labels, and classic theme. |
