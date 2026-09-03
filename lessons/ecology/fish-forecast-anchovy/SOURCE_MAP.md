# Source map

Pinned source revision: `364874796493c45409495fe0473e3ede4a7fd174`.

| Source scope | BioLang scope | Fidelity |
| --- | --- | --- |
| `Data/Landings_in_Hellenic_Waters.csv` | `data/Landings_in_Hellenic_Waters.csv` | Byte-for-byte exact source CSV |
| Opening data-loading section and `f11-load_data` output | Dataset inspection and `figures/source/f11-load_data-1.png` | Same full source data; byte-for-byte canonical PNG |
| Time-varying regression example, 1964–1987, `t = Year - 1963`, `lm(log.metric.tons ~ t)` | Same training rows, transformation, model, coefficients, and 1988 forecast | Numerically exact within stated floating-point tolerance |
| `plot.TVreg.forecast2` output | `figures/source/plot.TVreg.forecast2-1.png` | Byte-for-byte canonical PNG |

Later ARIMA, exponential-smoothing, multivariate, and seasonal chapters are outside this lesson's claimed port.
