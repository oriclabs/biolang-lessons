suppressPackageStartupMessages({
  library(survival)
  library(RTCGA.clinical)
  library(RTCGA.mRNA)
  library(jsonlite)
})

script_arg <- commandArgs(trailingOnly = FALSE)[grep("^--file=", commandArgs(trailingOnly = FALSE))]
script_path <- sub("^--file=", "", script_arg)
root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
results_dir <- file.path(root, "validation", "results")
dir.create(results_dir, recursive = TRUE, showWarnings = FALSE)

number <- function(x) unname(as.numeric(x))
coefficient_rows <- function(model) {
  summary_model <- summary(model)
  data.frame(
    name = rownames(summary_model$coefficients),
    coefficient = summary_model$coefficients[, "coef"],
    hazard_ratio = summary_model$coefficients[, "exp(coef)"],
    standard_error = summary_model$coefficients[, "se(coef)"],
    z = summary_model$coefficients[, "z"],
    p_value = summary_model$coefficients[, "Pr(>|z|)"],
    confidence_lower = summary_model$conf.int[, "lower .95"],
    confidence_upper = summary_model$conf.int[, "upper .95"],
    row.names = NULL
  )
}

survival_table <- function(fit, at) {
  value <- summary(fit, times = at, extend = TRUE)
  data.frame(
    group = if (is.null(value$strata)) rep("All", length(value$time)) else sub("^[^=]+=", "", as.character(value$strata)),
    time = value$time,
    n_risk = value$n.risk,
    n_event = value$n.event,
    survival = value$surv,
    std_error = value$std.err,
    confidence_lower = value$lower,
    confidence_upper = value$upper
  )
}

# 9.2: the datasets distributed with survival 3.8.3.
lung_data <- survival::lung
lung_export <- data.frame(
  time = lung_data$time,
  event = as.integer(lung_data$status == 2),
  sex = ifelse(lung_data$sex == 1, "Male", "Female"),
  age = lung_data$age,
  ph_ecog = lung_data$ph.ecog,
  ph_karno = lung_data$ph.karno,
  pat_karno = lung_data$pat.karno,
  meal_cal = lung_data$meal.cal,
  wt_loss = lung_data$wt.loss
)
write.csv(lung_export, file.path(root, "lung.csv"), row.names = FALSE, na = "")

lung_overall <- survfit(Surv(time, status == 2) ~ 1, data = lung_data)
lung_sex <- survfit(Surv(time, status == 2) ~ sex, data = lung_data)
lung_cox_sex <- coxph(Surv(time, status == 2) ~ sex, data = lung_data)
lung_logrank <- survdiff(Surv(time, status == 2) ~ sex, data = lung_data)
lung_cox_multi <- coxph(
  Surv(time, status == 2) ~ sex + age + ph.ecog + ph.karno + pat.karno + meal.cal + wt.loss,
  data = lung_data
)
lung_cox_age <- coxph(Surv(time, status == 2) ~ age, data = lung_data)
lung_cut_mean <- transform(lung_data, older = age > mean(age, na.rm = TRUE))
lung_cut_70 <- transform(lung_data, older = age > 70)
lung_logrank_mean <- survdiff(Surv(time, status == 2) ~ older, data = lung_cut_mean)
lung_logrank_70 <- survdiff(Surv(time, status == 2) ~ older, data = lung_cut_70)

colon_data <- subset(survival::colon, etype == 2)
colon_export <- data.frame(
  time = colon_data$time,
  event = as.integer(colon_data$status == 1),
  sex = ifelse(colon_data$sex == 0, "Female", "Male"),
  rx = as.character(colon_data$rx),
  age = colon_data$age,
  nodes = colon_data$nodes,
  differentiation = factor(
    colon_data$differ,
    levels = c(1, 2, 3),
    labels = c("Well", "Moderate", "Poor")
  ),
  node4 = ifelse(colon_data$node4 == 1, "4 or more", "Fewer than 4")
)
write.csv(colon_export, file.path(root, "colon.csv"), row.names = FALSE, na = "")

colon_sex <- survfit(Surv(time, status) ~ sex, data = colon_data)
colon_differ <- survfit(Surv(time, status) ~ differ, data = colon_data)
colon_node4 <- survfit(Surv(time, status) ~ node4, data = colon_data)
colon_rx <- survfit(Surv(time, status) ~ rx, data = colon_data)
colon_logrank_sex <- survdiff(Surv(time, status) ~ sex, data = colon_data)
colon_logrank_differ <- survdiff(Surv(time, status) ~ differ, data = colon_data)
colon_logrank_node4 <- survdiff(Surv(time, status) ~ node4, data = colon_data)
colon_logrank_rx <- survdiff(Surv(time, status) ~ rx, data = colon_data)
colon_cox_rx <- coxph(Surv(time, status) ~ rx, data = colon_data)
colon_cox_adjusted <- coxph(Surv(time, status) ~ rx + age + sex + nodes, data = colon_data)

# 9.3.1.1: reproduce RTCGA::survivalTCGA without its now-defunct dplyr mutate_ call.
data(BRCA.clinical)
data(OV.clinical)
data(GBM.clinical)
make_tcga_survival <- function(...) {
  keep <- c(
    "admin.disease_code", "patient.bcr_patient_barcode", "patient.vital_status",
    "patient.days_to_last_followup", "patient.days_to_death"
  )
  joined <- do.call(rbind, lapply(list(...), function(x) x[, keep]))
  data.frame(
    time = ifelse(
      !is.na(joined$patient.days_to_last_followup),
      as.numeric(as.character(joined$patient.days_to_last_followup)),
      as.numeric(as.character(joined$patient.days_to_death))
    ),
    event = as.integer(tolower(as.character(joined$patient.vital_status)) %in% c("dead", "deceased")),
    disease = as.character(joined$admin.disease_code),
    barcode = toupper(as.character(joined$patient.bcr_patient_barcode))
  )
}
tcga <- make_tcga_survival(BRCA.clinical, OV.clinical, GBM.clinical)
tcga <- tcga[!is.na(tcga$time), ]
tcga$disease <- factor(tcga$disease, levels = c("brca", "gbm", "ov"))
write.csv(tcga, file.path(root, "tcga-clinical.csv"), row.names = FALSE, na = "")

tcga_fit <- survfit(Surv(time, event) ~ disease, data = tcga)
tcga_cox <- coxph(Surv(time, event) ~ disease, data = tcga)
tcga_logrank <- survdiff(Surv(time, event) ~ disease, data = tcga)

# Exercises 10-13: the fixed RTCGA pan-kidney clinical snapshot.
data(KIPAN.clinical)
keep_kidney <- c(
  "admin.disease_code", "patient.bcr_patient_barcode", "patient.vital_status",
  "patient.days_to_last_followup", "patient.days_to_death", "patient.gender"
)
kidney_source <- KIPAN.clinical[, keep_kidney]
kidney <- data.frame(
  time = ifelse(
    !is.na(kidney_source$patient.days_to_last_followup),
    as.numeric(as.character(kidney_source$patient.days_to_last_followup)),
    as.numeric(as.character(kidney_source$patient.days_to_death))
  ),
  event = as.integer(tolower(as.character(kidney_source$patient.vital_status)) %in% c("dead", "deceased")),
  disease = as.character(kidney_source$admin.disease_code),
  sex = tolower(as.character(kidney_source$patient.gender)),
  barcode = toupper(as.character(kidney_source$patient.bcr_patient_barcode))
)
kidney <- kidney[!is.na(kidney$time), ]
kidney$disease <- factor(kidney$disease, levels = c("kich", "kirc", "kirp"))
kidney$sex <- factor(kidney$sex, levels = c("female", "male"))
write.csv(kidney, file.path(root, "tcga-kidney.csv"), row.names = FALSE, na = "")

kidney_fit <- survfit(Surv(time, event) ~ disease, data = kidney)
kidney_cox <- coxph(Surv(time, event) ~ disease + sex, data = kidney)
kidney_logrank <- survdiff(Surv(time, event) ~ disease, data = kidney)

# 9.3.1.2: the same three genes and three tumour cohorts used by the source chapter.
data(BRCA.mRNA)
data(OV.mRNA)
data(UCEC.mRNA)
expression_inputs <- list(BRCA.mRNA = BRCA.mRNA, OV.mRNA = OV.mRNA, UCEC.mRNA = UCEC.mRNA)
tcga_expression <- do.call(rbind, lapply(names(expression_inputs), function(dataset) {
  values <- expression_inputs[[dataset]]
  data.frame(
    barcode = as.character(values$bcr_patient_barcode),
    dataset = dataset,
    PAX8 = as.numeric(values$PAX8),
    GATA3 = as.numeric(values$GATA3),
    ESR1 = as.numeric(values$ESR1)
  )
}))
row.names(tcga_expression) <- NULL
write.csv(tcga_expression, file.path(root, "tcga-expression.csv"), row.names = FALSE, na = "")

reference <- list(
  environment = list(
    r = R.version.string,
    survival = as.character(packageVersion("survival")),
    RTCGA_clinical = as.character(packageVersion("RTCGA.clinical")),
    RTCGA_mRNA = as.character(packageVersion("RTCGA.mRNA"))
  ),
  lung = list(
    dimensions = dim(lung_data),
    overall = list(n = unname(lung_overall$n), events = sum(lung_data$status == 2), median = number(summary(lung_overall)$table["median"]), lower = number(summary(lung_overall)$table["0.95LCL"]), upper = number(summary(lung_overall)$table["0.95UCL"])),
    by_sex = survival_table(lung_sex, seq(0, 1000, 100)),
    cox_sex = coefficient_rows(lung_cox_sex),
    logrank_sex = list(observed = unname(lung_logrank$obs), expected = unname(lung_logrank$exp), chi_squared = unname(lung_logrank$chisq), p_value = pchisq(lung_logrank$chisq, length(lung_logrank$n) - 1, lower.tail = FALSE)),
    cox_multivariable = coefficient_rows(lung_cox_multi),
    cox_age = coefficient_rows(lung_cox_age),
    mean_age = mean(lung_data$age, na.rm = TRUE),
    age_cut_mean_logrank_p = pchisq(lung_logrank_mean$chisq, 1, lower.tail = FALSE),
    age_cut_70_logrank_p = pchisq(lung_logrank_70$chisq, 1, lower.tail = FALSE)
  ),
  colon = list(
    dimensions = dim(colon_data),
    by_sex = survival_table(colon_sex, seq(0, 2000, 500)),
    logrank_sex = list(chi_squared = unname(colon_logrank_sex$chisq), p_value = pchisq(colon_logrank_sex$chisq, 1, lower.tail = FALSE)),
    logrank_differentiation = list(chi_squared = unname(colon_logrank_differ$chisq), df = 2, p_value = pchisq(colon_logrank_differ$chisq, 2, lower.tail = FALSE)),
    logrank_node4 = list(chi_squared = unname(colon_logrank_node4$chisq), p_value = pchisq(colon_logrank_node4$chisq, 1, lower.tail = FALSE)),
    logrank_treatment = list(chi_squared = unname(colon_logrank_rx$chisq), df = 2, p_value = pchisq(colon_logrank_rx$chisq, 2, lower.tail = FALSE)),
    by_differentiation = survival_table(colon_differ, c(0, 500, 1000, 1500, 2000)),
    by_node4 = survival_table(colon_node4, c(0, 500, 1000, 1500, 2000)),
    by_treatment = survival_table(colon_rx, c(0, 500, 1000, 1500, 2000)),
    cox_rx = coefficient_rows(colon_cox_rx),
    cox_adjusted = coefficient_rows(colon_cox_adjusted)
  ),
  tcga = list(
    dimensions = dim(tcga),
    counts = as.data.frame.matrix(table(tcga$disease, tcga$event)),
    by_disease = survival_table(tcga_fit, seq(0, 1825, 365)),
    cox_disease = coefficient_rows(tcga_cox),
    logrank = list(chi_squared = unname(tcga_logrank$chisq), df = length(tcga_logrank$n) - 1, p_value = pchisq(tcga_logrank$chisq, length(tcga_logrank$n) - 1, lower.tail = FALSE))
  ),
  kidney = list(
    dimensions = dim(kidney),
    counts = as.data.frame.matrix(table(kidney$disease, kidney$sex)),
    cox = coefficient_rows(kidney_cox),
    logrank = list(chi_squared = unname(kidney_logrank$chisq), df = 2, p_value = pchisq(kidney_logrank$chisq, 2, lower.tail = FALSE)),
    by_disease = survival_table(kidney_fit, seq(0, 1825, 365))
  ),
  expression = list(
    dimensions = dim(tcga_expression),
    counts = as.list(table(tcga_expression$dataset)),
    summaries = do.call(rbind, lapply(c("PAX8", "GATA3", "ESR1"), function(gene) {
      do.call(rbind, lapply(levels(factor(tcga_expression$dataset)), function(dataset) {
        x <- tcga_expression[tcga_expression$dataset == dataset, gene]
        data.frame(gene = gene, dataset = dataset, n = sum(!is.na(x)), median = median(x, na.rm = TRUE), mean = mean(x, na.rm = TRUE), q1 = quantile(x, .25, na.rm = TRUE), q3 = quantile(x, .75, na.rm = TRUE))
      }))
    }))
  )
)

write_json(reference, file.path(results_dir, "reference.json"), pretty = TRUE, auto_unbox = TRUE, digits = 16, na = "null")
cat(file.path(results_dir, "reference.json"), "\n")
