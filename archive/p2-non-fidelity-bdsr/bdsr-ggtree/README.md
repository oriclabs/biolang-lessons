# Phylogenetic-tree visualisation with BioLang

An executable, independently written companion to chapter 13 of Stephen D.
Turner's *Biological Data Science with R*. It follows sections 13.1–13.6.3,
includes all three exercises, and redraws every figure that the rendered source
chapter publishes.

## Run in Studio

Open `lesson.json`, select **Prepare all**, and run from the first cell. The
four teaching files are checksum-pinned and can also be supplied locally.

## Validate

After building the current CLI, run from this directory:

```powershell
C:\work\bio\biolang\target\debug\bl.exe test tests\validate.bl
C:\work\bio\biolang\target\debug\bl.exe notebook lesson.bln --plot none
```

Validation pins the topology, tip labels, branch distances, ggtree-compatible
MRCA node numbers, the twelve seed-42 tree facets, BEAST/Nexus translation,
alignment dimensions, and SVG annotation metadata. The upstream PNG figures
were used only as visual oracles and are not redistributed.

Read `ATTRIBUTION.md` before redistributing the teaching tree.
