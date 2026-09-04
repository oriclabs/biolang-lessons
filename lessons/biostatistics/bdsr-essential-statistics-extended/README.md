# BDSR Essential Statistics 8.3.2-8.7

This five-notebook collection restores the source material that disappeared
when the earlier broad BDSR companion was archived. It keeps the source-faithful
ANOVA and height-weight regression as their existing registry lessons and
ports the missing sections around them without synthetic data.

Studio downloads `nhanes.csv` only after **Prepare all** and verifies the
manifest checksum. Each notebook has in-content Previous/Next navigation in
addition to Studio's section selector.

Run the notebooks from a directory containing the verified `nhanes.csv`:

```powershell
C:\work\bio\biolang\target\debug\bl.exe run 01-wilcoxon-linear-models.bln --no-gpu --plot none
C:\work\bio\biolang\target\debug\bl.exe run 02-multiple-regression.bln --no-gpu --plot none
C:\work\bio\biolang\target\debug\bl.exe run 03-categorical-data.bln --no-gpu --plot none
C:\work\bio\biolang\target\debug\bl.exe run 04-power-sample-size.bln --no-gpu --plot none
C:\work\bio\biolang\target\debug\bl.exe run 05-tidying-models.bln --no-gpu --plot none
```

See `ATTRIBUTION.md`, `SOURCE_MAP.md`, and `validation.json` before
redistribution.
