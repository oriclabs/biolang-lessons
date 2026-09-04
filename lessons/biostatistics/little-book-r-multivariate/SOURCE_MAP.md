# Source map

Pinned source revision: `763f08e0944114e06cff72bc3406f725bbd86596`.

Selected source page: `src/multivariateanalysis.rst`, rendered at https://little-book-of-r-for-multivariate-analysis.readthedocs.io/en/latest/src/multivariateanalysis.html.

| Source section | BioLang notebook | Fidelity |
| --- | --- | --- |
| Reading Multivariate Analysis Data into R | `01-exploring-wine-data.bln` | Exact headerless UCI `wine.data`; 178 rows and all 14 columns retained; runtime-generated headerless names are immediately mapped by position to source names V1-V14 |
| Plotting Multivariate Data | `01-exploring-wine-data.bln` | Four BioLang-generated figures over the exact observations: a 5-by-5 scatter/density matrix, V4/V5 point plot, cultivar-grouped V4/V5 plot, and five-series profile plot |
| Calculating Summary Statistics for Multivariate Data | `02-multivariate-summaries.bln` | Same means, sample standard deviations, group sizes, within/between variance, and separation calculations |
| Between/within-group covariance | `02-multivariate-summaries.bln` | Same pooled formulas and exact V8/V11 source results |
| Calculating Correlations and Standardising Variables | `02-multivariate-summaries.bln` | Same Pearson coefficients and sample-standard-deviation z-scores |
| Principal Component Analysis | `03-principal-component-analysis.bln` | Same standardised 13-column matrix; source variances, loadings, scores, retention rules, connected open-point scree plot, and labelled score plot. Component signs are oriented to the published figure. |
| Linear Discriminant Analysis | `04-linear-discriminant-analysis.bln` | Exact published coefficient vectors replayed; downstream scores, group separation, two density-scaled `ldahist` reproductions, labelled score plot, cut points, and confusion matrix reproduced. No native LDA refit is claimed. |

## Generated figure mapping

| Upstream figure | BioLang generation | Subject |
| --- | --- | --- |
| `_static/image1.png` | `scatterplot_matrix()` over V2-V6 with source-style boxes, ticks, regression, LOESS, and conditional spread | Scatterplot matrix |
| `_static/image2.png` | `plot()` over exact V4/V5 columns | V4/V5 scatterplot |
| `_static/image4.png` | `stats_relationship_plot()` grouped by exact V1 cultivar | Cultivar-identified V4/V5 scatterplot |
| `_static/image5.png` | Multi-series `plot(type: "line")` over exact V2-V6 columns | Profile plot |
| `_static/image6.png` | `elbow_plot()` over BioLang PCA explained variances, with connected open points and `Comp.n` ticks | PCA scree plot |
| `_static/image7.png` | `stats_relationship_plot()` over source-oriented BioLang PC1/PC2 scores, with open black points and red cultivar labels | PC1/PC2 score plot |
| `_static/image8.png` | `stats_facet_plot()` over reproduced LD1 scores, using source-aligned density bins, cyan black-bordered bars, repeated axes, and below-panel group labels | LD1 stacked histogram |
| `_static/image9.png` | `stats_facet_plot()` over reproduced LD2 scores with the same `MASS::ldahist()` geometry | LD2 stacked histogram |
| `_static/image10.png` | `stats_relationship_plot()` over reproduced LD1/LD2 scores, with open black points, red cultivar labels, and exact source expression labels | LD1/LD2 score plot |

The generic R installation material and its `image3.png` screenshot are not part of the selected multivariate-analysis page. No source analysis section or dataset row is replaced by synthetic content. No upstream image asset is included: each analytical figure is reconstructed by executable BioLang code.

The positional V1-V14 renaming was exercised in both native BioLang and Studio Browser WASM. It changes only table metadata: the checksum-pinned source file and every observation remain unchanged.

The notebooks have no Markdown image references or external figure URLs. Studio receives each figure directly from the BioLang plot value produced by its code cell.
