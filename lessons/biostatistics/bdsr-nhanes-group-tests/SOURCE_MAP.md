# Source map

| Lesson material | Source | Treatment |
|---|---|---|
| NHANES table and dictionary | BDSR `data/nhanes*.csv` | Source-hosted, checksum-pinned downloads. |
| Adult age, BMI-diabetes, and alcohol-relationship Welch tests | Essential statistics, T-tests | All three source questions retained as direct syntax translations with exact numeric validation. |
| Understanding panels | Essential statistics, T-tests and ANOVA explanations | Restored method-selection, interpretation, and limitation guidance. |
| Smoking-status ANOVA and Tukey comparisons | Essential statistics, ANOVA | Direct syntax translation and exact numeric validation. |
| Smoking-status boxplot cell | `smoking_boxplots` chunk | Runtime BioLang `stats_group_plot()` uses the same adult BMI rows, factor order (`Never`, `Current`, `Former`, `NA`), type-7 quartiles, 1.5-IQR whiskers/outliers, labels, and classic theme. |
