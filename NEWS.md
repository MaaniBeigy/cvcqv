# cvcqv 1.0.2

Resubmission after CRAN archival on 2022-05-19.

## Bug fixes

* Resolved the 32 `checkRd: Lost braces` NOTEs by rewriting
  `\strong{LABEL:}{ TEXT }` (an invalid two-argument form) as
  `\strong{LABEL:} TEXT` in `CoefVarCI`, `CoefQuartVarCI`, `cv_versatile`,
  and `cqv_versatile` documentation.
* Removed `LazyData: true` from `DESCRIPTION` (the package ships no
  exported datasets — this was the cause of the 2022 archival).
* Migrated all `\href{http://doi.org/...}` references in source comments
  and README to canonical `https://doi.org/...` URLs.

## Continuous integration

* Replaced legacy Travis, AppVeyor, and CircleCI configuration with
  GitHub Actions workflows derived from `r-lib/actions` v2:
  `R-CMD-check`, `test-coverage`, `pkgdown`, `lint`, `pr-commands`.
* Added `.github/dependabot.yml` to keep workflow action versions
  current.

## Maintenance

* Bumped minimum R version in `DESCRIPTION` from 3.1.2 to 3.5.0
  (current CRAN floor).
* Verified the package against R 4.6.0 (2026-04-24): `R CMD check
  --as-cran` reports 0 errors, 0 warnings, 0 notes; all 568 testthat
  assertions pass.

# cvcqv v1.0.1

These functions and classes work:

|name             |is.R6.. |Description                             |
|:----------------|:-------|:---------------------------------------|
|CoefVar          |TRUE    |Coefficient of Variation (cv)           |
|CoefQuartVar     |TRUE    |Coefficient of Quartile Variation (cqv) |
|CoefVarCI        |TRUE    |Confidence Intervals for cv             |
|CoefQuartVarCI   |TRUE    |Confidence Intervals for cqv            |
|SampleQuantiles  |TRUE    |Sample Quantiles                        |
|cv_versatile     |FALSE   |Coefficient of Variation                |
|cqv_versatile    |FALSE   |Coefficient of Quartile Variation       |
|BootCoefVar      |TRUE    |Bootstrap Resampling for cv             |
|BootCoefQuartVar |TRUE    |Bootstrap Resampling for cqv            |
