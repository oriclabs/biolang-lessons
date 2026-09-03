# Source map

Pinned source: `08-predictive.Rmd`, “Extrapolation,” revision `f65463c21f16ff809ae3b015ce2b2b08405e9a25`.

| Source scope | BioLang scope | Fidelity |
| --- | --- | --- |
| `Examples/bacteria.csv` | `data/bacteria.csv` | Byte-for-byte exact source CSV; 241 time/OD measurements |
| `as.POSIXct(..., format = "%H:%M:%S")` | `seconds_since_midnight()` | Same temporal differences with only an arbitrary constant date origin removed |
| `bacteria[45:90,]` | zero-based indices `44..89` | Same 46 observations, exactly `03:00:23` through `06:00:23` |
| `lm(OD ~ Time, ...)` | `lm(training_time, training_od)` | Same OLS slope and fitted line geometry |
| Two `ggplot` chunks marked `eval=FALSE` | No figure | The selected publication renders no canonical image; no substitute redraw is supplied |

Later regression-tree, random-forest, boosting, and SVM exercises using this dataset are outside this bounded lesson.
