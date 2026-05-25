# cvcqv (development version)

## New features

* Added three Abu-Shawiesh-Akyuz-Kibria (2019)
  <doi:10.19139/soic.v7i2.630> population-coefficient-of-variation
  confidence intervals, ported from the companion Python package
  `pycvcqv`:
    * `aak_adj_ci` / `method = "aak_adj"` — adjusted-degrees-of-freedom
      CI (Eq. 21) derived from Hummel et al.'s CI for the variance;
      `r_hat = 2n / (gamma_hat + 2n/(n-1))`.
    * `aak_ls_ci` / `method = "aak_ls"` — large-sample CI (Eq. 26)
      derived from the log-transformed CI for the variance;
      `A = (G_2 + 2n/(n-1)) / n`.
    * `aak_als_ci` / `method = "aak_als"` — augmented-large-sample CI
      (Eq. 32) derived from Burch's CI for the variance using a
      three-term Taylor expansion of `log(S^2)`.
* The three new methods are exposed both through the `CoefVarCI` R6
  class (as public `*_ci()` methods and via `all_ci()`) and through
  the procedural `cv_versatile()` function (including `method = "all"`).
* Internal kurtosis helpers (`.g2_excess_kurtosis`,
  `.g2_bias_corrected`, `.kappa_e5`, `.gamma_hat_hummel`) live in
  `R/aak_helpers.R`. All three CIs require at least 4 observations.

# cvcqv 1.0.3

Patch release addressing CRAN auto-check feedback on the 1.0.2 resubmission:

* Wrapped author surnames in `DESCRIPTION` (`Albatineh`, `Altunkaynak`,
  `Gamgam`, `Kibria`, `Panichkitkosolkul`, `Zogheib`) in single quotes so
  CRAN's spell-checker no longer flags them as misspellings.
* Removed obsolete instructions in `README` to download
  `cvcqv_1.0.0.tar.gz` from the GitHub repo (the file no longer exists;
  install from CRAN instead).

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
