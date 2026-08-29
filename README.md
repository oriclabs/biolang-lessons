# BioLang Lessons

Installable, executable learning material for biology and biomedical data work
with BioLang. Lessons live here rather than in language, package, Studio, or
workflow repositories.

## Organisation

```text
lessons/
  biostatistics/
  bioinformatics/
  genomics/
  single-cell/
  epidemiology/
```

Each lesson directory owns its notebooks, manifest, small fixtures, validation,
and attribution notice. A schema-1 manifest opens one notebook; a schema-2
manifest is an ordered collection that opens several notebook tabs in BioLang
Studio. Large or independently hosted data is declared by URL and checksum and
is downloaded only when the learner asks for it.

The [BioLang registry](https://registry.lang.bio/) is the discovery layer. It
points to versioned lesson manifests in this repository; Studio remains a
generic editor and does not bundle these lessons.

## Current collections

- `lessons/biostatistics/bdsr-essential`: one practical NHANES lesson inspired
  by *Biological Data Science with R*.
- `lessons/biostatistics/little-book-biomedical`: eight connected biomedical
  statistics lessons adapted from Avril Coghlan's CC BY 3.0 booklet.

## Validate

Check the repository structure with Node.js:

```sh
npm test
```

Each collection also documents its BioLang execution and numerical validation
commands. Dataset-heavy checks remain opt-in and must use the checksums declared
by their manifests.

## Repository boundary

- `biolang` implements the language and built-ins.
- package repositories implement reusable APIs.
- `biolang-studio` reads and edits lesson manifests and notebooks.
- `biolang-workflows` contains complete analyses, benchmarks, and external
  validation pipelines.
- this repository contains teaching sequences.

## Licensing

Repository-authored tooling is MIT licensed. Lesson content is licensed per
collection because adaptations can inherit upstream terms. Always read the
collection's `ATTRIBUTION.md` and manifest before redistributing it. See
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).
