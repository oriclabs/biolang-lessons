# Attribution and data terms

This is an independent BioLang teaching companion to Stephen D. Turner's *Biological Data Science with R*, chapter 10, [Predictive Analytics: Predicting and Forecasting Influenza](https://bdsr.stephenturner.us/predmodeling.html). The upstream book repository is licensed [CC BY-NC 4.0](https://github.com/stephenturner/bdsr/blob/main/LICENSE).

The lesson's prose, BioLang programs, Rust algorithms, and rendered figures were independently written for OriClabs. They do not copy or relicense upstream prose, R source, tables, or generated figures. Section numbering and short method names are retained so learners can compare the two implementations. This is not an official BDSR publication and no endorsement is implied.

The three CSV files are separate teaching data artifacts and are not covered by this repository's MIT grant:

- `h7n9.csv` is the BDSR teaching extract of the H7N9 line list collated by Kucharski and colleagues: Kucharski A, Mills HL, Pinsent A, Fraser C, Van Kerkhove M, Donnelly CA, Riley S (2014), Dryad DOI `10.5061/dryad.2g43n`; associated article DOI `10.1371/currents.outbreaks.e1473d9bfc99d080ca242139a06c455f`.
- `h7n9_analysisready.csv` is the BDSR feature-engineered and MICE-completed teaching table and remains under the upstream BDSR CC BY-NC 4.0 terms.
- `ilinet.csv` contains a historical teaching assembly of CDC ILINet and NCHS mortality surveillance values. Source: Centers for Disease Control and Prevention. CDC attribution does not imply CDC or U.S. Government endorsement.

The historical R reference uses `caret`, `randomForest`, `gbm`, `glmnet`, `kknn`, `mice`, and `prophet`. BioLang does not port those packages. Its classifiers and additive seasonal forecast are independently implemented using documented algorithms and Apache-2.0 SmartCore primitives, then validated against the R workflow as a black box. Stochastic resampling, library versions, and algorithm implementations can prevent bit-for-bit equality; the lesson reports measured values rather than presenting proportional agreement as identity.
