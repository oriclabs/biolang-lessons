# Biomedical statistics in BioLang

This is an installable schema-2 Studio collection. One manifest opens eight
ordered `.bln` notebooks as separate tabs. Removing the collection uninstalls
its package and cached data while preserving edited notebook tabs as ordinary
user documents. The notebooks use small embedded count tables, so Browser mode
needs no data download.

The collection is an attributed adaptation of Avril Coghlan's CC BY 3.0
booklet, not a line-for-line conversion. See [ATTRIBUTION.md](ATTRIBUTION.md).
The examples retain the source counts where useful for reproducibility, while
the teaching text, BioLang code, checks, and figures are adapted for the current
BioLang statistics and plotting APIs.

Validate every runnable block from the repository root with:

```powershell
Get-ChildItem lessons/biostatistics/little-book-biomedical/*.bln | ForEach-Object {
  bl notebook $_.FullName --plot none
}
```

Then check the pinned numerical examples with:

```powershell
bl test lessons/biostatistics/little-book-biomedical/tests/validate.bl
```

When R 4.x, `jsonlite`, and `metafor` are available, independently recompute
and compare the source metrics, both Tarone-adjusted homogeneity examples, all
five dose-response points, and all seven forest-plot rows. These R packages are
validation tools only; BioLang does not link to or distribute them:

```powershell
node lessons/biostatistics/little-book-biomedical/validation/compare-with-r.mjs
```

Set `BIOLANG_BIN` or `RSCRIPT` when either executable is outside the default
Windows locations or `PATH`.
