# A Little Book of R for Bioinformatics — BioLang lessons

One installable Studio collection containing two selectable notebooks:

1. **DNA Sequence Statistics (1)** — FASTA, base composition, GC content,
   complements, DNA words, and seven exercises.
2. **DNA Sequence Statistics (2)** — subsequences, local GC/AT windows, plots,
   observed-to-expected word frequencies, and five exercises.

Open the collection in BioLang Studio, choose **Prepare all**, select a notebook,
and run cells in order. The source work is CC BY 3.0 and is attributed in
`ATTRIBUTION.md`.

Validate both prepared notebooks from this directory with the current BioLang
CLI:

```powershell
bl --plot none notebook 01-dna-sequence-statistics.bln
bl --plot none notebook 02-local-sequence-statistics.bln
```
