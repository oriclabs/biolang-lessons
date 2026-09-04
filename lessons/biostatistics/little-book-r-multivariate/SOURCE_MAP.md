# Source map

Pinned source revision: `763f08e0944114e06cff72bc3406f725bbd86596`.

Selected source page: `src/multivariateanalysis.rst`, rendered at https://little-book-of-r-for-multivariate-analysis.readthedocs.io/en/latest/src/multivariateanalysis.html.

| Source section | BioLang notebook | Fidelity |
| --- | --- | --- |
| Reading Multivariate Analysis Data into R | `01-exploring-wine-data.bln` | Exact headerless UCI `wine.data`; 178 rows and all 14 columns retained |
| Plotting Multivariate Data | `01-exploring-wine-data.bln` | All four published figures copied byte for byte as `image1.png`, `image2.png`, `image4.png`, and `image5.png` |
| Calculating Summary Statistics for Multivariate Data | `02-multivariate-summaries.bln` | Same means, sample standard deviations, group sizes, within/between variance, and separation calculations |
| Between/within-group covariance | `02-multivariate-summaries.bln` | Same pooled formulas and exact V8/V11 source results |
| Calculating Correlations and Standardising Variables | `02-multivariate-summaries.bln` | Same Pearson coefficients and sample-standard-deviation z-scores |
| Principal Component Analysis | `03-principal-component-analysis.bln` | Same standardised 13-column matrix; source variances, loadings, scores, retention rules, `image6.png`, and `image7.png` |
| Linear Discriminant Analysis | `04-linear-discriminant-analysis.bln` | Exact published coefficient vectors replayed; downstream scores, group separation, three canonical figures, cut points, and confusion matrix reproduced. No native LDA refit is claimed. |

## Canonical figure mapping

| Upstream asset | Included asset | Subject |
| --- | --- | --- |
| `_static/image1.png` | `figures/source/image1.png` | Scatterplot matrix |
| `_static/image2.png` | `figures/source/image2.png` | V4/V5 scatterplot |
| `_static/image4.png` | `figures/source/image4.png` | Cultivar-labelled V4/V5 scatterplot |
| `_static/image5.png` | `figures/source/image5.png` | Profile plot |
| `_static/image6.png` | `figures/source/image6.png` | PCA scree plot |
| `_static/image7.png` | `figures/source/image7.png` | PC1/PC2 score plot |
| `_static/image8.png` | `figures/source/image8.png` | LD1 stacked histogram |
| `_static/image9.png` | `figures/source/image9.png` | LD2 stacked histogram |
| `_static/image10.png` | `figures/source/image10.png` | LD1/LD2 score plot |

The generic R installation material and its `image3.png` screenshot are not part of the selected multivariate-analysis page. No source analysis section, dataset row, or published figure from the selected page is replaced by synthetic content.
