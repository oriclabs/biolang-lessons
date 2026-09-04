# A Little Book of R for Multivariate Analysis

This schema-2 lesson collection ports the complete analytical sequence from Avril Coghlan's CC BY 3.0 booklet using the exact real UCI Wine data and all nine figures published on the selected analysis page.

The four notebooks cover exploration, multivariate summaries and standardisation, PCA, and LDA. Each notebook has Previous/Next navigation, while Studio retains its section selector.

Run all executable notebook cells from this directory:

```powershell
C:\work\bio\biolang\target\debug\bl.exe run 01-exploring-wine-data.bln --no-gpu --plot none
C:\work\bio\biolang\target\debug\bl.exe run 02-multivariate-summaries.bln --no-gpu --plot none
C:\work\bio\biolang\target\debug\bl.exe run 03-principal-component-analysis.bln --no-gpu --plot none
C:\work\bio\biolang\target\debug\bl.exe run 04-linear-discriminant-analysis.bln --no-gpu --plot none
```

Run the consolidated calculation checks from `tests`:

```powershell
C:\work\bio\biolang\target\debug\bl.exe test validate.bl --no-gpu
```

See `ATTRIBUTION.md`, `SOURCE_MAP.md`, and `validation.json` before redistribution.
