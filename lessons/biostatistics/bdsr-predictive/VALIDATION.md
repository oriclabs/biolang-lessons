# Validation

This lesson has three separately identified evidence layers:

1. the values printed by the public BDSR chapter;
2. a fresh R 4.5.2 run of current CRAN `caret`, `randomForest`, `gbm`,
   `glmnet`, `kknn`, and `prophet` on the checksum-pinned CSVs;
3. a fresh BioLang run on the same rows and predictors.

Run the complete comparison from PowerShell:

```powershell
.\validation\run.ps1
```

`validation/reference.R` is the executable R oracle. It records package
versions, tuning choices, metrics, resamples, variable importance, unknown-case
probabilities, forecast endpoints, and component timings in
`validation/r-reference.json`. `validation/biolang.bl` records the corresponding
BioLang artifacts in `validation/biolang-reference.json`. `compare.mjs` writes
the human- and machine-readable `validation.json` at the lesson root.

The independent BioLang classifiers are expected to preserve the scientific
conclusion and remain within declared metric tolerances; they are not expected
to reproduce R's RNG stream or package-specific tree representation bit for
bit. The additive forecaster follows the documented piecewise-trend plus
Fourier-seasonality idea and calendar horizon, but is not Prophet's Stan model.
Its numerical posterior is therefore deliberately not called identical.

The nine chapter figures were inspected directly against locally rendered
BioLang SVGs. The validation contract checks plot type, source data, category
order, facets, ggplot2 discrete colours, missing-value legend, filled boxes,
calendar scale, component layout, and the displayed model metrics. No upstream
figure is embedded in the lesson.
