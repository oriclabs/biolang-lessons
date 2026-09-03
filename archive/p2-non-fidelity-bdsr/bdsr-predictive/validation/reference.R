#!/usr/bin/env Rscript

# Independent validation oracle for the BioLang predictive-influenza lesson.
# It executes current CRAN implementations on the checksum-pinned teaching data.

suppressPackageStartupMessages({
  library(caret)
  library(randomForest)
  library(gbm)
  library(glmnet)
  library(kknn)
  library(prophet)
  library(jsonlite)
})

args <- commandArgs(trailingOnly = TRUE)
lesson_root <- if (length(args) >= 1) normalizePath(args[[1]], mustWork = TRUE) else normalizePath("..", mustWork = TRUE)
output_path <- if (length(args) >= 2) args[[2]] else file.path(lesson_root, "validation", "r-reference.json")

flu <- read.csv(file.path(lesson_root, "h7n9_analysisready.csv"), na.strings = c("", "NA"), check.names = FALSE)
known <- subset(flu, !is.na(outcome), select = -case_id)
unknown <- subset(flu, is.na(outcome))
known$outcome <- factor(known$outcome, levels = c("Death", "Recover"))

fit_one <- function(method) {
  set.seed(8382)
  elapsed <- system.time({
    fit <- train(outcome ~ ., data = known, method = method, verbose = FALSE)
  })[["elapsed"]]
  perf <- getTrainPerf(fit)[1, , drop = FALSE]
  list(fit = fit, elapsed = unname(elapsed), perf = perf)
}

rf <- fit_one("rf")
gbm_fit <- fit_one("gbm")
glmnet_fit <- fit_one("glmnet")
knn_fit <- fit_one("kknn")

model_summary <- function(x) {
  list(
    method = x$fit$method,
    best_tune = as.list(x$fit$bestTune[1, , drop = FALSE]),
    accuracy = unname(x$perf$TrainAccuracy),
    kappa = unname(x$perf$TrainKappa),
    elapsed_seconds = x$elapsed,
    resamples = unname(lapply(seq_len(nrow(x$fit$resample)), function(i) {
      list(accuracy = x$fit$resample$Accuracy[[i]], kappa = x$fit$resample$Kappa[[i]])
    }))
  )
}

rf_importance <- varImp(rf$fit, scale = TRUE)$importance
rf_importance$feature <- rownames(rf_importance)
rownames(rf_importance) <- NULL
rf_probabilities <- predict(rf$fit, newdata = unknown, type = "prob")

ili <- read.csv(file.path(lesson_root, "ilinet.csv"), na.strings = c("", "NA"), check.names = FALSE)
ili$week_start <- as.Date(ili$week_start)

set.seed(8382)
ili_elapsed <- system.time({
  ili_model <- prophet(data.frame(ds = ili$week_start, y = ili$ilitotal))
  ili_future <- make_future_dataframe(ili_model, periods = 365 * 5)
  ili_forecast <- predict(ili_model, ili_future)
})[["elapsed"]]

pneumonia <- subset(ili, !is.na(pneumoniadeaths))
set.seed(8382)
pneumonia_elapsed <- system.time({
  pneumonia_model <- prophet(data.frame(ds = pneumonia$week_start, y = pneumonia$pneumoniadeaths))
  pneumonia_future <- make_future_dataframe(pneumonia_model, periods = 365 * 5)
  pneumonia_forecast <- predict(pneumonia_model, pneumonia_future)
})[["elapsed"]]

result <- list(
  schema = "oriclabs.bdsr-predictive-r-reference.v1",
  generated_at_utc = format(Sys.time(), tz = "UTC", usetz = TRUE),
  r_version = R.version.string,
  packages = as.list(sapply(c("caret", "randomForest", "gbm", "glmnet", "kknn", "prophet"), function(pkg) as.character(packageVersion(pkg)))),
  data = list(
    h7n9_rows = nrow(flu),
    known_rows = nrow(known),
    unknown_rows = nrow(unknown),
    predictors = ncol(known) - 1,
    ili_rows = nrow(ili),
    ili_first_date = as.character(min(ili$week_start)),
    ili_last_date = as.character(max(ili$week_start))
  ),
  models = list(
    random_forest = model_summary(rf),
    gradient_boosting = model_summary(gbm_fit),
    elastic_net = model_summary(glmnet_fit),
    knn = model_summary(knn_fit)
  ),
  random_forest_importance = as.list(setNames(rf_importance$Overall, rf_importance$feature)),
  first_six_unknown_probabilities = unname(lapply(seq_len(6), function(i) {
    list(Death = rf_probabilities$Death[[i]], Recover = rf_probabilities$Recover[[i]])
  })),
  forecast = list(
    ili = list(
      elapsed_seconds = unname(ili_elapsed),
      history_rows = nrow(ili),
      forecast_rows = nrow(ili_forecast),
      first_future_date = as.character(ili_forecast$ds[nrow(ili) + 1]),
      last_future_date = as.character(tail(ili_forecast$ds, 1)),
      last_yhat = unname(tail(ili_forecast$yhat, 1)),
      last_yhat_lower = unname(tail(ili_forecast$yhat_lower, 1)),
      last_yhat_upper = unname(tail(ili_forecast$yhat_upper, 1))
    ),
    pneumonia = list(
      elapsed_seconds = unname(pneumonia_elapsed),
      history_rows = nrow(pneumonia),
      forecast_rows = nrow(pneumonia_forecast),
      first_future_date = as.character(pneumonia_forecast$ds[nrow(pneumonia) + 1]),
      last_future_date = as.character(tail(pneumonia_forecast$ds, 1)),
      last_yhat = unname(tail(pneumonia_forecast$yhat, 1)),
      last_yhat_lower = unname(tail(pneumonia_forecast$yhat_lower, 1)),
      last_yhat_upper = unname(tail(pneumonia_forecast$yhat_upper, 1))
    )
  )
)

dir.create(dirname(output_path), recursive = TRUE, showWarnings = FALSE)
write_json(result, output_path, pretty = TRUE, auto_unbox = TRUE, digits = 16, na = "null")
cat(output_path, "\n")
