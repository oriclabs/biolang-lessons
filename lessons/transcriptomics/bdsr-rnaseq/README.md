# Count-based RNA-seq analysis with BioLang

An executable, source-faithful BioLang port of BDSR chapter 12 at upstream
revision `f16caf3d3df4ac27297b87f50c37c7c024471208`. It follows sections 12.1
through 12.7, includes all fourteen exercises, reproduces the chapter's
historical DESeq2 result counts, and redraws every analytical plot with
BioLang from the exact source data or the independently regenerated DESeq2
oracle artifacts. No synthetic replacement data or copied analytical image is
used.

The source's generic count-matrix schematic and externally produced IPA pathway
illustrations are explanatory images rather than analysis outputs. They are not
copied or represented as BioLang plots. Their source links and the exact
analytical boundary are recorded in `SOURCE_MAP.md`.

## Run in Studio

Open `lesson.json`, select **Prepare all**, then run from the first cell. The
seven files are checksum-pinned and may also be supplied locally.

## Validate

The exact oracle uses R 4.5.2 and the historical DESeq2 1.44.0 package:

```powershell
$env:BDSR_DESEQ2_LIBRARY = 'C:\work\bio\_r-lib-deseq2-1.44'
& 'C:\Program Files\R\R-4.5.2\bin\Rscript.exe' validation\reference.R
```

Run BioLang from this directory after building the current CLI:

```powershell
C:\work\bio\biolang\target\debug\bl.exe test tests\validate.bl
C:\work\bio\biolang\target\debug\bl.exe notebook lesson.bln --plot none
```

The R runtime is validation-only. It is not linked into BioLang and is not
required by the browser lesson. Read `ATTRIBUTION.md` before redistributing the
data artifacts.
