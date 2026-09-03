# Source map

Pinned BDSR source: `survival.qmd` at revision `f16caf3d3df4ac27297b87f50c37c7c024471208`.

| Source scope | BioLang scope | Fidelity |
| --- | --- | --- |
| Section 9.2.2, `survfit`, `survfitSex`, `rangeSeq`, and `survfitSummaryOptions` chunks | Dataset inspection, overall/sex curves, medians, and 100-day life-table values | Exact 228 source observations; `status == 2` is transformed in memory to BioLang's explicit 1/0 event coding; source group order and calculations retained |
| Section 9.2.3, `sfitPlot` | `figures/source/sfitPlot-1.png` | Byte-for-byte canonical source PNG |
| Section 9.2.3, `survminer` | `figures/source/survminer-1.png` | Byte-for-byte canonical source PNG |
| Section 9.2.3, `survminerOptions` | `figures/source/survminerOptions-1.png` | Byte-for-byte canonical source PNG; source confidence, p-value, risk table, labels, palette, title, and height retained |

Sections before 9.2.2 and after 9.2.3 are outside this lesson's claimed port. This bounded scope avoids claiming one-to-one fidelity for material that is not included.
