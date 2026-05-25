# cvcqv 1.0.4 — CRAN submission

## Reason for the quick release after 1.0.3

This is a feature release submitted four days after 1.0.3 was accepted
(2026-05-08). The motivation is to ship three published
confidence-interval methods that were requested via GitHub issues #61,
#62, and #63 and that already exist in the sibling Python package
`pycvcqv`. The three methods are:

* Abu-Shawiesh, Akyuz & Kibria (2019)
  <doi:10.19139/soic.v7i2.630> adjusted-degrees-of-freedom CI for the
  population coefficient of variation (`method = "aak_adj"`).
* Abu-Shawiesh, Akyuz & Kibria (2019) large-sample CI
  (`method = "aak_ls"`).
* Abu-Shawiesh, Akyuz & Kibria (2019) augmented-large-sample CI
  (`method = "aak_als"`).

All three are exposed through both the `CoefVarCI` R6 class and the
procedural `cv_versatile()` function. The existing public API is
unchanged.

## R CMD check results

0 errors | 0 warnings | 1 note

The single NOTE is the expected `Days since last update: 4` message
from CRAN's incoming-feasibility check. We considered batching this
feature with a later release, but felt the published methods (and the
already-implemented Python counterpart) warranted shipping promptly so
that R users have parity with `pycvcqv`.

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
