# Archived lesson audit

Rechecked 2026-09-05 against the project's source fidelity, BioLang-rendered
figure, licence, and no-synthetic-data requirements. Archive folder names are
not evidence: every runnable notebook and validation command below was rerun.

| Candidate | Execution evidence | Decision |
| --- | --- | --- |
| `superseded-bdsr/bdsr-essential` | Exact NHANES and dictionary hashes verified; full notebook and validation script pass; sections 8.1-8.7.3 and Understanding panels present. | Valid but superseded by the active, navigable Chapter 8 lessons. It is not a fidelity rejection. |
| `superseded-bdsr/bdsr-survival` | Full notebook and reference-parity test pass; sections 9.1-9.3.2 and Exercises 1-13 present. | Valid historical package; restored as active `bdsr-lung-survival` 2.0.0. It is not a fidelity rejection. |
| former `p2-non-fidelity-bdsr/bdsr-rnaseq` | Full notebook and parity test pass; exact real airway data; all fourteen exercises; historical DESeq2 1.44.0 oracle parity; analytical plots rendered by BioLang. | Restored to `lessons/transcriptomics/bdsr-rnaseq`. The generic source schematic and external IPA illustrations are explicitly outside the analytical-plot claim. |
| `p2-non-fidelity-bdsr/bdsr-predictive` | Full notebook executes, but its own R comparison records different classifiers, probability values, and non-Prophet forecasts. | Withheld: useful companion, but not a one-to-one implementation. |
| `p2-non-fidelity-bdsr/bdsr-ggtree` | Full notebook and topology/renderer test pass. The upstream basic teaching tree is explicitly made-up, and sections 13.6.1-13.6.2 use random trees and random values. | Withheld under the no-synthetic-data rule despite deterministic source reproduction. |
| `p1-synthetic-exclusions/epir-standardised-rates` | Notebook and direct-standardisation validation pass exactly. The upstream handbook explicitly calls both country datasets fictitious. | Withheld under the no-synthetic-data rule. |
| `p2-non-fidelity-stats4nr/stats4nr-falcon-regression` | No manifest or notebook was published; the upstream candidate data are described as simulated. | Withheld under the no-synthetic-data rule. |
| `p2-non-fidelity-stats4nr/stats4nr-fishing-poisson` | Exact 250-row data and descriptive values are present, but the current notebook/test fail at the model formula, the Poisson fit did not match R, and the draft embeds copied source PNGs. | Withheld until the native Poisson fit and BioLang figures match. |

The public registry must contain only active lesson paths. Historical registry
entries are audit records and must not be copied back without regenerating the
manifest checksum from the active lesson.
