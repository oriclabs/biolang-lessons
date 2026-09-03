# Source map

| Notebook material | Exact pinned source | Treatment |
|---|---|---|
| `data/protocol_1.csv` | `Protocols/protocol_1.csv` | Byte-for-byte copy of the source's saved plot-ready table. |
| `figures/source/Protocol_01.png` | `Protocols/Protocol_01.png` | Byte-for-byte canonical source output. |
| Protocol 1 counts and ranges | `Protocols/protocol_1.Rmd`, after the reshape and `drop_na()` steps | Direct inspection of the exact saved result; the lesson boundary does not claim to reimplement the earlier reshape. |
| `data/protocol_14.csv` | `Protocols/protocol_14.csv` | Byte-for-byte copy of the source's classified differential-expression table. |
| Protocol 14 thresholds and ranking | `Protocols/protocol_14.Rmd`, Steps 1-4 | Direct BioLang translation of the exact inequalities and Manhattan-distance expression. |
| `figures/source/Protocol_14.png` | `Protocols/Protocol_14.png` | Byte-for-byte canonical source output. |
| `data/protocol_16.csv` | `Protocols/protocol_16.csv` | Byte-for-byte copy of the source's saved tidy co-expression table. |
| Protocol 16 correlations | `Protocols/protocol_16.Rmd`, “Fit parameters” | Exact complete-pair Pearson correlations, squared panel by panel. |
| `figures/source/Protocol_16.png` | `Protocols/Protocol_16.png` | Byte-for-byte canonical source output. |

The pinned source revision is `6f1108772c72a934b9a80c037f0cbc836875f719`. Animated protocols, live-service inputs, and protocols whose computations cannot yet be expressed exactly in BioLang are not represented by substitute data or redraws.
