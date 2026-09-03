# Source map

| Lesson material | Exact source | Treatment |
|---|---|---|
| `data/fishing.rda` | `stats4nr/data/fishing.rda` | Byte-for-byte package copy. |
| `data/fishing.csv` | Official `fishing` object | Mechanical `write.csv` export for BioLang. |
| `figures/source/fishing-histogram.png` | `stats_4_nr_files/figure-html/unnamed-chunk-305-1.png` | Byte-for-byte published copy. |
| Mean and variance cells | Chapter 13 fishing case study | Direct BioLang syntax translation with exact outputs. |
| Zero-frequency cell | Chapter 13 zero-inflation section | Direct BioLang syntax translation with exact 56.8% result. |

The Poisson, negative-binomial, and zero-inflated models are intentionally out
of scope because they do not currently pass exact BioLang validation.

