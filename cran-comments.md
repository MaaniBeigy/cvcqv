# cvcqv 1.0.2 — CRAN submission

## Resubmission of archived package

This is a resubmission of `cvcqv` (version 1.0.2), archived on CRAN on
2022-05-19. The archival was triggered by a single NOTE on all 13
tested platforms:

  > 'LazyData' is specified without a 'data' directory

This has been resolved by removing `LazyData: true` from `DESCRIPTION`;
the package ships no exported datasets (the only `.rda` file in the
package is internal data in `R/sysdata.rda`).

In addition, the following pre-existing issues were addressed in the
same release:

* 32 `checkRd: Lost braces` NOTEs in `CoefVarCI.Rd`, `CoefQuartVarCI.Rd`,
  `cv_versatile.Rd`, and `cqv_versatile.Rd`. Root cause: roxygen
  comments used `\strong{LABEL:}{ TEXT }`, an invalid two-argument form;
  rewritten as `\strong{LABEL:} TEXT`.
* All `\href{http://doi.org/...}` references migrated to
  `https://doi.org/...`.

## Test environments

* local: Windows 11, R 4.6.0 (2026-04-24 ucrt)
* GitHub Actions: ubuntu-latest (R-devel, R-release, R-oldrel-1),
  macos-latest (R-release), windows-latest (R-release)
* win-builder: R-devel, R-release
* R-hub: macOS, Windows, Linux

## R CMD check results

0 errors | 0 warnings | 1 note

The single remaining NOTE is the standard `checking CRAN incoming
feasibility` flag for a resubmission ("New submission / Package was
archived on CRAN"), which is automatic for any package previously
archived. The archival reason is documented above.

During one local `--as-cran` run, the URL checker also reported
`https://cran.r-project.org/package=MBESS` as 404. The URL is valid;
this appears to be a transient CRAN-side response. Re-running the check
cleared it.

## Downstream dependencies

There are currently no reverse dependencies for this package.
