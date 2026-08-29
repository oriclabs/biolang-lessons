# Source coverage map

This map makes the adaptation reviewable. It covers the biomedical-statistics
material rather than copying the source's R installation and general R syntax
chapters; BioLang setup belongs in the BioLang documentation.

| Source topic | BioLang lesson | Treatment |
|---|---|---|
| Cohort and case-control study context | 1. Study design | Reorganised and expanded before any calculation. |
| Relative risk for a cohort study | 2. Risk and odds | Same source count table and checked RR; explanation rewritten. |
| Odds ratios and confidence intervals | 2. Risk and odds | Rewritten BioLang calculation with estimator labels. |
| Association between exposure and disease | 3. Association | Chi-square and Fisher guidance, expected-count caution, and effect-size separation added. |
| Stratified Mantel-Haenszel odds ratio | 4. Stratification | Same two strata and checked MH estimate; confounding/effect-modification distinction expanded. |
| Tarone homogeneity test | 4 and 8 | Independently implemented as the Tarone-adjusted Breslow-Day test and checked against R `metafor`; kept separate from Cochran Q. |
| Matched case-control odds ratio and McNemar test | 5. Matched studies | Same discordant-pair counts and checked matched OR; pairing rationale expanded. |
| Dose-specific odds and dose-response trend | 6. Dose-response | Same dose table, trend model, and checked source p-value. |
| Trial sample size and loss to follow-up | 7. Trial planning | Same formula and checked examples; assumptions and feasibility interpretation added. |
| Trial power | 7. Trial planning | Same formula and checked 250-per-arm example. |
| Seven-trial forest plot and meta-analysis | 8. Meta-analysis | Same trial counts; newly rendered BioLang forest plot and inverse-variance analysis. |

The notebooks use source numerical examples where that makes the adaptation
auditable. Their prose, teaching order, BioLang code, and plot rendering were
changed by OriClabs. See `ATTRIBUTION.md` for the licence notice.
