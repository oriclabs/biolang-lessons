# Source map

Pinned BDSR source: `survival.qmd` at revision `f16caf3d3df4ac27297b87f50c37c7c024471208`.

| Source scope | BioLang scope | Fidelity |
| --- | --- | --- |
| Section 9.2.2, `survfit`, `survfitSex`, `rangeSeq`, and `survfitSummaryOptions` chunks | Dataset inspection, overall/sex curves, medians, and 100-day life-table values | Exact 228 source observations; `status == 2` is transformed in memory to BioLang's explicit 1/0 event coding; source group order and calculations retained |
| Section 9.2.3, `sfitPlot` | First runtime `kaplan_meier()` figure | Exact curves rendered in the source base-R style: black lines, boxed panel, source expansion/ticks, no legend or copied image |
| Section 9.2.3, `survminer` | Second runtime `kaplan_meier()` figure | Exact curves with source top legend, hue palette, censor marks, scale expansion, labels, and tick formatting |
| Section 9.2.3, `survminerOptions` | Third runtime `kaplan_meier()` figure | Exact curves and risk counts with source confidence intervals, p-value text/location, risk table, labels, palette, title, and 1344×1536 layout |

Sections before 9.2.2 and after 9.2.3 are outside this lesson's claimed port. This bounded scope avoids claiming one-to-one fidelity for material that is not included.
