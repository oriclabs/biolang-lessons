if (!requireNamespace("metafor", quietly = TRUE)) {
  stop("The validation-only R oracle requires metafor; install it outside BioLang with install.packages('metafor').")
}

options(warn = 2)

rr <- (156 / (156 + 9421)) / (1531 / (1531 + 14797))
or <- 156 * 14797 / (9421 * 1531)

women <- c(a = 4, b = 5, c = 5, d = 103)
men <- c(a = 10, b = 3, c = 5, d = 43)
mh_component <- function(x) c(numerator = x[["a"]] * x[["d"]] / sum(x), denominator = x[["b"]] * x[["c"]] / sum(x))
mh_parts <- mh_component(women) + mh_component(men)
mh_or <- mh_parts[["numerator"]] / mh_parts[["denominator"]]

association_table <- matrix(c(30, 24, 76, 241, 82, 509), nrow = 3, byrow = TRUE)
association <- suppressWarnings(chisq.test(association_table, correct = FALSE))

doses <- c(2, 9.5, 19.5, 37, 50)
disease <- c(35, 250, 196, 136, 32)
control <- c(82, 293, 190, 71, 13)
log_odds <- log(disease / control)
dose_model <- lm(log_odds ~ doses)

alpha <- 0.05
desired_power <- 0.90
treatment_risk <- 0.15
control_risk <- 0.20
average_risk <- (treatment_risk + control_risk) / 2
sample_size <- ceiling(2 * (qnorm(1 - alpha / 2) + qnorm(desired_power))^2 * average_risk * (1 - average_risk) / (treatment_risk - control_risk)^2)
trial_power <- pnorm(abs(0.20 - 0.30) * sqrt(250 / (2 * 0.25 * (1 - 0.25))) - qnorm(0.975))

trials <- matrix(c(
  198, 728, 128, 576,
  96, 437, 101, 342,
  1105, 4243, 1645, 6703,
  741, 2905, 594, 2418,
  264, 1091, 907, 3671,
  105, 408, 348, 1248,
  138, 431, 436, 1576
), ncol = 4, byrow = TRUE)

sex_tarone <- metafor::rma.mh(
  ai = c(women[["a"]], men[["a"]]),
  bi = c(women[["b"]], men[["b"]]),
  ci = c(women[["c"]], men[["c"]]),
  di = c(women[["d"]], men[["d"]]),
  measure = "OR",
  correct = FALSE
)
trial_tarone <- metafor::rma.mh(
  ai = trials[, 1], bi = trials[, 2], ci = trials[, 3], di = trials[, 4],
  measure = "OR",
  correct = FALSE
)

forest <- lapply(seq_len(nrow(trials)), function(i) {
  cells <- trials[i, ]
  estimate <- cells[[1]] * cells[[4]] / (cells[[2]] * cells[[3]])
  variance <- sum(1 / cells)
  se <- sqrt(variance)
  list(
    label = paste("Trial", i),
    estimate = estimate,
    lower = estimate * exp(-qnorm(0.975) * se),
    upper = estimate * exp(qnorm(0.975) * se),
    log_estimate = log(estimate),
    standard_error = se,
    precision = 1 / variance
  )
})

effects <- vapply(forest, `[[`, numeric(1), "log_estimate")
variances <- vapply(forest, function(row) row$standard_error^2, numeric(1))
weights <- 1 / variances
pooled_effect <- weighted.mean(effects, weights)
pooled_se <- sqrt(1 / sum(weights))
q_stat <- sum(weights * (effects - pooled_effect)^2)

result <- list(
  relative_risk = rr,
  odds_ratio = or,
  mantel_haenszel_or = mh_or,
  tarone = list(
    sex = list(
      common_odds_ratio = exp(as.numeric(sex_tarone$beta)),
      statistic = as.numeric(sex_tarone$TA),
      p_value = as.numeric(sex_tarone$TAp)
    ),
    trials = list(
      common_odds_ratio = exp(as.numeric(trial_tarone$beta)),
      statistic = as.numeric(trial_tarone$TA),
      p_value = as.numeric(trial_tarone$TAp)
    )
  ),
  matched_odds_ratio = 57 / 13,
  association_chi_square = unname(association$statistic),
  association_p_value = association$p.value,
  dose_trend_p_value = coef(summary(dose_model))[[2, 4]],
  dose_plot = lapply(seq_along(doses), function(i) list(dose = doses[[i]], log_odds = log_odds[[i]])),
  sample_size_per_group = sample_size,
  sample_size_with_ten_percent_loss = ceiling(sample_size / 0.9),
  trial_power = trial_power,
  forest = forest,
  meta = list(
    pooled_effect = pooled_effect,
    se = pooled_se,
    ci_lower = pooled_effect - 1.959964 * pooled_se,
    ci_upper = pooled_effect + 1.959964 * pooled_se,
    q_stat = q_stat,
    p_q = pchisq(q_stat, df = length(effects) - 1, lower.tail = FALSE)
  )
)

cat(jsonlite::toJSON(result, auto_unbox = TRUE, digits = 16, null = "null"), "\n")
