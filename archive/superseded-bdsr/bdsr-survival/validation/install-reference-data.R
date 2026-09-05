options(repos = c(CRAN = "https://cloud.r-project.org"))

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install(
  c("RTCGA.clinical", "RTCGA.mRNA"),
  ask = FALSE,
  update = FALSE
)
