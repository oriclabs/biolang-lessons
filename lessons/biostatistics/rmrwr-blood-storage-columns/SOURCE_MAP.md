# Source map

| Lesson material | Exact source | Treatment |
|---|---|---|
| `data/blood_storage.rda` | `medicaldata/data/blood_storage.rda` | Byte-for-byte copy. |
| `data/blood_storage.csv` | Official `blood_storage` object | Mechanical `write.csv` export. |
| Ten-column selection | `io05a-columns.Rmd`, `select(1, bGS:sGS, 3, AA)` | Explicit BioLang names preserve the exact expanded order. |
| First six rows | Same source chunk's `head()` | Recomputed from the exact object. |

The selected source section publishes no figure.
