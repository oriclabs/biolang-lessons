# Source map

| BioLang section | Upstream source |
|---|---|
| Load the survey table | `episodes/working-with-data.Rmd`, chunk loading `data/cleaned/surveys_complete_77_89.csv` |
| Species/sex summary | Chunks using `filter(!is.na(weight))`, `group_by(species_id, sex)`, and `summarize(mean_weight, n)` |
| Ascending and descending order | `arrange(mean_weight)` and `arrange(desc(mean_weight))` chunks |

This selected scope ends before the per-row grouped mutation, daily time series, reshaping, and export sections. It contains no source figure.
