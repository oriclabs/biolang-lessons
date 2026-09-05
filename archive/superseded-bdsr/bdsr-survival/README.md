# Survival analysis with BioLang

An executable, independently written companion to BDSR chapter 9, covering
sections 9.1 through 9.3.2 in source order, including Exercises 1–13, all of
their requested plots and survival tables, and the closing TCGA resource guide.
Each source plot appears first with matched strata, palette, legend wording, and
statistical layers; collapsible enhanced views add readable labels and risk tables.

## Run in Studio

Open `lesson.json`, select **Prepare all**, then run the notebook from the top.
The five CSV files are checksum-pinned and can also be supplied locally.

## Validate

The R oracle was produced with R 4.5.2, `survival` 3.8.3,
`RTCGA.clinical` 20151101.40.0, and `RTCGA.mRNA` 1.38.0:

```powershell
& 'C:\Program Files\R\R-4.5.2\bin\Rscript.exe' validation\reference.R
```

Run BioLang from this directory after building the current CLI:

```powershell
C:\work\bio\biolang\target\debug\bl.exe test tests\validate.bl
C:\work\bio\biolang\target\debug\bl.exe notebook lesson.bln --plot none
```

Read `ATTRIBUTION.md` before redistributing the dataset extracts. Lesson-authored
content is MIT; dataset files retain their separate upstream licence terms.
