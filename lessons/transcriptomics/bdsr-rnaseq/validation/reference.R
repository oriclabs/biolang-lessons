#!/usr/bin/env Rscript

# Independent R oracle for the BDSR RNA-seq companion lesson.
# DESeq2 is used only to produce and validate pinned teaching artifacts; it is
# not linked into BioLang and is not required by the browser lesson.

args <- commandArgs(trailingOnly = FALSE)
script_arg <- grep("^--file=", args, value = TRUE)
script_path <- if (length(script_arg)) sub("^--file=", "", script_arg[[1]]) else "validation/reference.R"
lesson_dir <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
result_dir <- file.path(lesson_dir, "validation", "results")
dir.create(result_dir, recursive = TRUE, showWarnings = FALSE)

oracle_library <- Sys.getenv("BDSR_DESEQ2_LIBRARY", unset = "C:/work/bio/_r-lib")
dependency_library <- "C:/work/bio/_r-lib"
extra_libraries <- c(oracle_library, dependency_library)
.libPaths(c(extra_libraries[dir.exists(extra_libraries)], .libPaths()))

suppressPackageStartupMessages(library(DESeq2))

counts <- read.csv(file.path(lesson_dir, "airway_scaledcounts.csv"), check.names = FALSE)
metadata <- read.csv(file.path(lesson_dir, "airway_metadata.csv"), check.names = FALSE)
annotation <- read.csv(file.path(lesson_dir, "annotables_grch38.csv"), check.names = FALSE)

stopifnot(identical(names(counts)[-1], metadata$id))

dds <- suppressMessages(DESeqDataSetFromMatrix(
  countData = counts,
  colData = metadata,
  design = ~ dex,
  tidy = TRUE
))
dds <- DESeq(dds, quiet = TRUE)

raw_results <- as.data.frame(results(dds, tidy = TRUE))
names(raw_results)[names(raw_results) == "row"] <- "ensgene"
results_annotated <- merge(
  raw_results,
  annotation,
  by = "ensgene",
  all = FALSE,
  sort = FALSE
)

write.csv(raw_results, file.path(lesson_dir, "deseq2_results.csv"), row.names = FALSE, na = "")

crispld2 <- plotCounts(
  dds,
  gene = "ENSG00000103196",
  intgroup = "dex",
  returnData = TRUE
)
crispld2$sample <- rownames(crispld2)
crispld2 <- crispld2[, c("sample", "dex", "count")]
write.csv(crispld2, file.path(lesson_dir, "crispld2_counts.csv"), row.names = FALSE)

vsdata <- vst(dds, blind = FALSE)
pca_data <- plotPCA(vsdata, intgroup = "dex", returnData = TRUE)
pca_out <- data.frame(
  sample = rownames(pca_data),
  dex = pca_data$group,
  PC1 = pca_data$PC1,
  PC2 = pca_data$PC2
)
write.csv(pca_out, file.path(lesson_dir, "pca.csv"), row.names = FALSE)

ordered <- raw_results[order(raw_results$padj, raw_results$pvalue, na.last = TRUE), ]
top_ids <- ordered$ensgene[seq_len(25)]
top_symbols <- annotation$symbol[match(top_ids, annotation$ensgene)]
vst_top <- assay(vsdata)[top_ids, , drop = FALSE]
scaled_top <- t(scale(t(vst_top)))

# Preserve the exact source figure's displayed gene and sample order. The
# values remain freshly derived from DESeq2's VST above.
source_gene_order <- c(
  "ZBTB16", "MT1X", "SAMHD1", "CCDC69", "NEXN", "DUSP1", "STEAP1",
  "GLUL", "STOM", "PNPLA2", "SMIM3", "FAM198B", "SPARCL1", "PER1",
  "NNMT", "MAOA", "PHC2", "FKBP5", "MORF4L2", "MT2A", "FAM171B",
  "DNM1", "SLC6A9", "ARHGEF2", "KCTD12"
)
source_sample_order <- c(
  "SRR1039520", "SRR1039512", "SRR1039508", "SRR1039516",
  "SRR1039517", "SRR1039509", "SRR1039513", "SRR1039521"
)
row_index <- match(source_gene_order, top_symbols)
stopifnot(!anyNA(row_index))
heatmap_out <- data.frame(
  gene = source_gene_order,
  scaled_top[row_index, source_sample_order, drop = FALSE],
  check.names = FALSE
)
write.csv(heatmap_out, file.path(lesson_dir, "heatmap_top25.csv"), row.names = FALSE)

control_cols <- metadata$id[metadata$dex == "control"]
treated_cols <- metadata$id[metadata$dex == "treated"]
control_mean <- rowMeans(counts[, control_cols])
treated_mean <- rowMeans(counts[, treated_cols])
positive <- control_mean > 0 & treated_mean > 0

reference <- list(
  r = paste(R.version$major, R.version$minor, sep = "."),
  deseq2 = as.character(packageVersion("DESeq2")),
  genes = nrow(counts),
  samples = nrow(metadata),
  control_total = unname(sum(control_mean)),
  treated_total = unname(sum(treated_mean)),
  positive_in_both = unname(sum(positive)),
  naive_up_log2fc_gt_2 = unname(sum(log2(treated_mean[positive] / control_mean[positive]) > 2)),
  naive_down_log2fc_lt_minus_2 = unname(sum(log2(treated_mean[positive] / control_mean[positive]) < -2)),
  size_factors = unname(sizeFactors(dds)),
  result_rows = nrow(raw_results),
  raw_padj_true = sum(raw_results$padj < 0.05, na.rm = TRUE),
  annotated_result_rows = nrow(results_annotated),
  padj_false = sum(results_annotated$padj >= 0.05, na.rm = TRUE),
  padj_true = sum(results_annotated$padj < 0.05, na.rm = TRUE),
  padj_missing = sum(is.na(results_annotated$padj)),
  annotated_unique_padj_true = length(unique(results_annotated$ensgene[
    !is.na(results_annotated$padj) & results_annotated$padj < 0.05
  ])),
  crispld2_counts = unname(crispld2$count),
  pca_percent_variance = unname(100 * attr(pca_data, "percentVar")),
  pca = lapply(seq_len(nrow(pca_out)), function(i) unname(as.list(pca_out[i, ]))),
  top_gene_ids = top_ids,
  top_gene_symbols = top_symbols
)

jsonlite::write_json(
  reference,
  file.path(result_dir, "reference.json"),
  pretty = TRUE,
  auto_unbox = TRUE,
  digits = 16,
  na = "null"
)

cat(sprintf("DESeq2 %s: %d genes, %d significant at padj < 0.05\n",
            packageVersion("DESeq2"), nrow(raw_results), reference$padj_true))
