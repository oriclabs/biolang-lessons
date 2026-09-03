# Attribution and licence

This lesson adapts the “Extrapolation” bacterial-growth example from *Modern Statistics with R* by Måns Thulin.

- Published book: https://www.modernstatisticswithr.com/
- Selected section: https://www.modernstatisticswithr.com/mlchapter.html#extrapolation
- Source repository: https://github.com/mthulin/mswr-book
- Pinned revision: `f65463c21f16ff809ae3b015ce2b2b08405e9a25`
- Licence: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International, https://creativecommons.org/licenses/by-nc-sa/4.0/

This BioLang adaptation is distributed under CC BY-NC-SA 4.0 and is excluded from the repository-wide MIT grant. It is intended only for the project's declared non-commercial use. `data/bacteria.csv` is copied byte-for-byte from the pinned source. Time parsing removes only the arbitrary calendar-date origin introduced by `as.POSIXct`; the source time differences, training rows, slope, and fitted geometry are retained. No endorsement is implied.
