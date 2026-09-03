# Source map

Pinned source: `cookbook/01-intro.Rmd` and its rendered output at revision `cb1e94528d3ede03776cb102bdf7017f821886c7`.

| Source scope | BioLang scope | Fidelity |
| --- | --- | --- |
| Built-in R `cars` data | `data/cars.csv` | Exact 50 `speed`/`dist` observations; Rdatasets row numbers retained |
| Four `validator()` expressions | Four equivalent BioLang expressions | Same thresholds, record-wise/aggregate scope, and correlation |
| Printed `summary(out)` | Four-row result table | Exact items, passes, and failures |
| Printed `violating(cars, out[1:3])` | `violating` table | Exact source rows 1 and 3 and their values |
| Rendered `plot(out)` | `figures/source/unnamed-chunk-7-1.png` | Byte-for-byte canonical source PNG |

Later cookbook chapters and advanced rule-management features are outside this bounded lesson.
