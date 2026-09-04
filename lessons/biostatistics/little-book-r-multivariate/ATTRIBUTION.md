# Attribution and licence

This collection adapts the complete analytical sequence in *A Little Book of R for Multivariate Analysis* by Avril Coghlan.

- Published source: https://little-book-of-r-for-multivariate-analysis.readthedocs.io/en/latest/src/multivariateanalysis.html
- Source repository: https://github.com/avrilcoghlan/LittleBookofRMultivariateAnalysis
- Pinned revision: `763f08e0944114e06cff72bc3406f725bbd86596`
- Book content licence: Creative Commons Attribution 3.0, https://creativecommons.org/licenses/by/3.0/

The adapted lesson content and the nine copied book figures are distributed under CC BY 3.0 and excluded from the repository-wide MIT grant. Attribution to Avril Coghlan is required. No endorsement is implied.

The exact headerless `data/wine.data` file is the Wine dataset used by the source. Dataset citation:

> Aeberhard S, Forina M. Wine [Dataset]. UCI Machine Learning Repository. 1992. https://doi.org/10.24432/C5PC7J

UCI currently distributes the dataset under Creative Commons Attribution 4.0, https://creativecommons.org/licenses/by/4.0/. The dataset is excluded from the repository-wide MIT grant and requires its own attribution.

The lesson uses real chemical measurements from wine samples. It contains no synthetic or replacement observations. Figures `image1.png`, `image2.png`, and `image4.png` through `image10.png` are copied byte for byte from the pinned book source. The generic R-installation screenshot `image3.png` is outside the selected analysis page and is not included.

BioLang directly reproduces the descriptive, covariance, correlation, standardisation, and PCA calculations. Since BioLang has no native LDA fitting function, the last notebook uses the two coefficient vectors printed by the source and independently recomputes its scores, separation, allocation rule, and confusion matrix. It does not claim that BioLang refitted the `MASS::lda()` model.
