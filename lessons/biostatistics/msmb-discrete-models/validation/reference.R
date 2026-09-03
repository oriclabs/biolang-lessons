out_dir <- file.path("..", "figures")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

png(file.path(out_dir, "poisson5.png"), width = 7, height = 4, units = "in", res = 96)
old <- options(digits = 2)
barplot(dpois(0:12, 5), names.arg = 0:12, col = "red")
options(old)
dev.off()

probabilities <- dbinom(0:15, prob = 0.3, size = 15)
png(file.path(out_dir, "binomial-15-03.png"), width = 7, height = 6, units = "in", res = 96)
barplot(probabilities, names.arg = 0:15, col = "red")
dev.off()

stopifnot(all.equal(dpois(3, 5), 0.14037389581428056, tolerance = 1e-15))
stopifnot(all.equal(sum(dpois(0:12, 5)), 0.997981148372563, tolerance = 1e-14))
stopifnot(all.equal(sum(probabilities), 1, tolerance = 1e-14))
