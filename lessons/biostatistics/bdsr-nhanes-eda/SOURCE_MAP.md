# Source map

| Lesson material | Exact source | Treatment |
|---|---|---|
| `nhanes.csv` | `https://bdsr.stephenturner.us/data/nhanes.csv` | Source-hosted download with pinned size and SHA-256; not redistributed. |
| `nhanes_dd.csv` | `https://bdsr.stephenturner.us/data/nhanes_dd.csv` | Source-hosted download with pinned size and SHA-256; not redistributed. |
| NHANES, descriptive statistics, missing data, and EDA guidance | Essential statistics sections 8.1-8.2.2 | Original section order and restored Understanding panels; all calculations use the exact source table. |
| Descriptive exercise cells | Essential statistics source exercises after the EDA section | BioLang syntax translation, checked against the exact source table. |
| Four histogram cells | `geom_histogram()` calls in the `histograms` chunk | Runtime BioLang `histogram()` calls use the same rows, 30/30/80/30 bins, ggplot bin boundaries, grey35 fill, labels, and panel theme. |
| All-age height/weight cell | `scatter_heightweight` chunk | Runtime BioLang grouped scatter uses the same complete rows, mappings, factor order, and ggplot hue palette. |
| Adult height/weight cell | `scatter_heightweight_colgender` chunk | Runtime BioLang grouped scatter uses the same `Age >= 18` filter, complete rows, per-gender linear smooths, confidence ribbons, palette, and labels. |

The lesson stops after this bounded EDA sequence. It does not claim coverage of
the remaining statistical tests, models, or figures in the chapter.
