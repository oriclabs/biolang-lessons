# Count-based RNA-seq analysis with BioLang

An executable, independently written companion to BDSR chapter 12. It follows
sections 12.1 through 12.7, includes all fourteen exercises, reproduces the
chapter's historical DESeq2 result counts, and redraws every analytical figure
with BioLang.

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
