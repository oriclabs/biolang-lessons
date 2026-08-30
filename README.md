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
manifest is an ordered collection shown as one Studio tab with a selectable
active section. Each child notebook keeps independent cells, results, and
replayable execution progress without crowding the tab strip. Large or
independently hosted data is declared by URL and checksum and is downloaded
only when the learner asks for it.

Independent lessons from one external book use optional `series` metadata.
Studio groups them under one book heading and orders them by chapter, while
each lesson can still be installed, updated, shared, or removed on its own.

The [BioLang registry](https://registry.lang.bio/) is the discovery layer. It
points to versioned lesson manifests in this repository; Studio remains a
generic editor and does not bundle these lessons.

## Discoverability contract

Every lesson manifest must include a `discoverability` object with six
duplicate-free arrays: `problems`, `methods`, `plots`, `terms`, `aliases`, and
`functions`. The first, second, fourth, and fifth are non-empty; `plots` and
`functions` may be empty when the lesson genuinely contains none. Write problem entries in the words a learner might
search (for example, `compare survival between patient groups`), not only as
technical labels. Keep `tags` short and visible; discoverability can be richer.

Schema-2 collections provide an aggregate object for Registry search and one
object on each child lesson for precise section discovery. `npm test` rejects a
new lesson that omits any part of this contract. When a notebook gains an
important method, plot, or BioLang function, update its discoverability terms
in the same change.

## Current collections

- *Biological Data Science with R* companion series:
  - `lessons/biostatistics/bdsr-essential`: one practical NHANES lesson.
  - `lessons/biostatistics/bdsr-survival`: a validated survival-analysis lesson
    using lung, colon, and fixed-snapshot TCGA teaching data.
  - `lessons/biostatistics/bdsr-predictive`: a complete predictive-analytics
    lesson using H7N9 classification and CDC influenza forecasting data.
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
