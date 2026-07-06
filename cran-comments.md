# cvcqv 1.0.4 CRAN submission

## Summary

This is a feature release. It adds three published confidence interval
methods for the population coefficient of variation, bringing R users
to parity with the sibling Python package `pycvcqv`. The three methods
are:

* Abu-Shawiesh, Akyuz & Kibria (2019)
  <doi:10.19139/soic.v7i2.630> adjusted degrees of freedom CI
  (`method = "aak_adj"`).
* Abu-Shawiesh, Akyuz & Kibria (2019) large-sample CI
  (`method = "aak_ls"`).
* Abu-Shawiesh, Akyuz & Kibria (2019) augmented large-sample CI
  (`method = "aak_als"`).

All three are exposed through both the `CoefVarCI` R6 class and the
procedural `cv_versatile()` function. The existing public API is
unchanged.

## Minimum R version

The minimum required R is now 4.1.0 (was 3.5.0). The package internals
use the native pipe `|>` in place of the magrittr `%>%`. R 4.1.0 was
released in May 2021.

## R CMD check results

0 errors | 0 warnings | 0 notes

## Test environments

* local: Windows 11, R 4.6.0 (2026-04-24 ucrt)
* GitHub Actions: ubuntu-latest (R-devel, R-release, R-oldrel-1),
  macos-latest (R-release), windows-latest (R-release)
* win-builder: R-devel, R-release
* R-hub: linux, macos-arm64, windows

All 601 testthat assertions pass on R 4.6.0. The three new methods are
each cross-validated against the worked examples in tables 5 and 6 of
Abu-Shawiesh, Akyuz & Kibria (2019).

## Downstream dependencies

There are currently no reverse dependencies for this package
(`tools::package_dependencies('cvcqv', reverse = TRUE)` returns
`NULL`).
