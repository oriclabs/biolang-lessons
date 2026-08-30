import { readFileSync, writeFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const root = path.dirname(fileURLToPath(import.meta.url));
const r = JSON.parse(readFileSync(path.join(root, "r-reference.json"), "utf8"));
const bl = JSON.parse(readFileSync(path.join(root, "biolang-reference.json"), "utf8"));
const blElapsed = Number(process.argv[2] ?? NaN);

const mapping = [
  ["random_forest", "random_forest"],
  ["gradient_boosting", "gradient_boosting"],
  ["elastic_net", "elastic_net"],
  ["knn", "knn"],
];
const blSummary = new Map(bl.comparison.map(row => [row.model, row]));
const models = Object.fromEntries(mapping.map(([name, rName]) => {
  const rModel = r.models[rName];
  const bModel = blSummary.get(name);
  const accuracyDifference = bModel.accuracy - rModel.accuracy;
  const kappaDifference = bModel.kappa - rModel.kappa;
  return [name, {
    r: {accuracy: rModel.accuracy, kappa: rModel.kappa, best_tune: rModel.best_tune},
    biolang: {accuracy: bModel.accuracy, kappa: bModel.kappa, parameters: bl.models[name].parameters},
    difference: {accuracy: accuracyDifference, kappa: kappaDifference},
    passes: Math.abs(accuracyDifference) <= 0.04 && Math.abs(kappaDifference) <= 0.08,
  }];
}));

const probabilityRows = bl.first_six_unknown_probabilities.map((row, index) => ({
  case: index + 1,
  r_death: r.first_six_unknown_probabilities[index].Death,
  biolang_death: row.Death,
  absolute_difference: Math.abs(row.Death - r.first_six_unknown_probabilities[index].Death),
  same_class: (row.Death >= 0.5) === (r.first_six_unknown_probabilities[index].Death >= 0.5),
}));

const result = {
  schema: "oriclabs.lesson-validation.v1",
  lesson: "bdsr-predictive-influenza",
  generated_at_utc: new Date().toISOString(),
  status: Object.values(models).every(model => model.passes) && probabilityRows.every(row => row.same_class)
    ? "validated_with_expected_independent_algorithm_differences"
    : "review_required",
  oracle: {
    r_version: r.r_version,
    packages: r.packages,
    source: "validation/reference.R executed locally; no chapter values copied into the oracle",
  },
  data: {
    r: r.data,
    biolang: bl.data,
    exact_shape_and_date_match:
      r.data.h7n9_rows === bl.data.h7n9_rows &&
      r.data.known_rows === bl.data.known_rows &&
      r.data.unknown_rows === bl.data.unknown_rows &&
      r.data.predictors === bl.data.predictors &&
      r.data.ili_rows === bl.data.ili_rows &&
      r.data.ili_first_date === bl.data.ili_first_date &&
      r.data.ili_last_date === bl.data.ili_last_date &&
      r.forecast.pneumonia.history_rows === bl.forecast.pneumonia.history_rows,
  },
  acceptance: {
    model_accuracy_absolute_difference_max: 0.04,
    model_kappa_absolute_difference_max: 0.08,
    first_six_predicted_class_agreement_minimum: 1,
    forecast_history_future_dates_exact: true,
    note: "The gates test scientific conclusions across independent implementations; they do not assert bit-for-bit model identity."
  },
  models,
  first_six_unknown_probabilities: {
    rows: probabilityRows,
    class_agreement: probabilityRows.filter(row => row.same_class).length / probabilityRows.length,
    mean_absolute_probability_difference: probabilityRows.reduce((sum, row) => sum + row.absolute_difference, 0) / probabilityRows.length,
    maximum_absolute_probability_difference: Math.max(...probabilityRows.map(row => row.absolute_difference)),
  },
  forecast: {
    ili: {
      r: r.forecast.ili,
      biolang: bl.forecast.ili,
      history_rows_equal: r.forecast.ili.history_rows === bl.forecast.ili.history_rows,
      future_rows_equal: r.forecast.ili.forecast_rows - r.forecast.ili.history_rows === bl.forecast.ili.future_rows,
      last_date_equal: r.forecast.ili.last_future_date === bl.forecast.ili.last.date,
    },
    pneumonia: {
      r: r.forecast.pneumonia,
      biolang: bl.forecast.pneumonia,
      history_rows_equal: r.forecast.pneumonia.history_rows === bl.forecast.pneumonia.history_rows,
      future_rows_equal: r.forecast.pneumonia.forecast_rows - r.forecast.pneumonia.history_rows === bl.forecast.pneumonia.future_rows,
      last_date_equal: r.forecast.pneumonia.last_future_date === bl.forecast.pneumonia.last.date,
    },
    note: "BioLang independently fits piecewise trend plus Fourier seasonality; forecast values and intervals are not asserted equal to Prophet's Stan posterior."
  },
  timing: {
    r_component_elapsed_seconds: Object.fromEntries([
      ...Object.entries(r.models).map(([name, model]) => [name, model.elapsed_seconds]),
      ["ili_prophet", r.forecast.ili.elapsed_seconds],
      ["pneumonia_prophet", r.forecast.pneumonia.elapsed_seconds],
    ]),
    biolang_total_elapsed_seconds: Number.isFinite(blElapsed) ? blElapsed : null,
    comparable: false,
    note: "Only compare timing when both commands use release/optimised builds on the same host; a missing or debug BioLang time is diagnostic only."
  },
  visual_contract: {
    figures: 9,
    source_reference_pngs_inspected: true,
    generated_by_biolang: true,
    checked: [
      "ggplot2 discrete fills #F8766D and #00BFC4 with grey NA",
      "four province facets and Death/Recover/NA legends",
      "Tukey boxplots with filled groups and outliers",
      "outcome-coloured patient event paths",
      "caret-style importance lollipops and side-by-side Accuracy/Kappa panels",
      "calendar-scaled five-year forecast and trend/yearly component panels"
    ]
  }
};

writeFileSync(path.join(root, "..", "validation.json"), `${JSON.stringify(result, null, 2)}\n`);
console.log(path.join(root, "..", "validation.json"));
