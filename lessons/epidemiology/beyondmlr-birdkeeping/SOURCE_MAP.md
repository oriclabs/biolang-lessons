# Source map

Pinned source: `06-Logistic-Regression.Rmd`, exercise 4, revision `b04814b528955b8f19ac8752ae74e9f108761062`.

| Source scope | BioLang scope | Fidelity |
| --- | --- | --- |
| `data/birdkeeping.csv` | `data/birdkeeping.csv` | Byte-for-byte exact source CSV; 147 observations and seven named study variables plus the source row index |
| Exercise 4(c), birdkeeping × cancer table and unadjusted odds ratio | Exact four cell counts and cross-product odds ratio | Numerically exact |
| Exercise model specification `model4 = yrsmoke + bird` | `glm(~cancer ~ (yrsmoke + bird), birds, "binomial")` | Same response, predictors, binomial logit likelihood, coefficient order, and fitted values |
| Exercise plots | None | The selected exercise asks the learner to create plots but publishes no canonical answer figure; no non-source plot is substituted |

The remaining exploratory tasks, models 1/2/5/6, profile intervals, article comparison, and other Chapter 6 examples are outside this bounded lesson.
