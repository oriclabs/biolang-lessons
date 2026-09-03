# Source map

| BioLang section | Upstream location | Fidelity note |
| --- | --- | --- |
| Five input tables | `data/standardization/*.csv` | Byte-for-byte copies; SHA-256 values are recorded in `lesson.json`. |
| Wide-to-long preparation | `chapters/standardization.qmd`, preparation code | Same country, age, sex, population, death and standard-population values; expressed directly because BioLang has no `pivot_longer`. |
| Direct standardisation | `chapters/standardization.qmd`, directly standardised rates | Same stratum-rate weighting and multiplier of 100,000. |
| Point estimates | R 4.6.1 reference calculation from the source tables | A = 23.56685849327109; B = 19.32549423719546. |

The chosen source scope contains no figure. The source's confidence intervals are
not silently approximated; they are deferred until the corresponding statistical
routine can be reproduced exactly.
