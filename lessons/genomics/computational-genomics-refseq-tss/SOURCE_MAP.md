# Source map

| Lesson material | Exact source | Treatment |
|---|---|---|
| `refseq.hg19.chr21.bed` | `compGenomRData/inst/extdata/refseq.hg19.chr21.bed` | Byte-for-byte copy. |
| `refseq.hg19.chr21.csv` | Same BED table | Mechanical `write.csv` export with explicit BED column names. |
| TSS derivation | Chapter 6 `convertDataframe2grTSS` chunk | Direct strand-aware BioLang translation. |
| Duplicate count | Source `!duplicated(tss.gr)` step | Same chromosome-position-strand identity rule. |

The source section publishes no figure, so none is fabricated or substituted here.
