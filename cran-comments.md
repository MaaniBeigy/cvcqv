# cvcqv 1.0.3 — CRAN submission

## Resubmission of archived package (follow-up to 1.0.2)

This is a follow-up resubmission of `cvcqv`, originally archived on
CRAN on 2022-05-19, after CRAN's incoming-feasibility auto-check on
1.0.2 (2026-05-07) flagged two non-blocking issues that have now been
resolved in 1.0.3:

* "Possibly misspelled words in DESCRIPTION" — author surnames
  (`Albatineh`, `Altunkaynak`, `Gamgam`, `Kibria`, `Panichkitkosolkul`,
  `Zogheib`) are now wrapped in single quotes in the `Description`
  field, per the CRAN convention for proper names.
* "Found the following (possibly) invalid URLs" — the link in
  `README.md` to `cvcqv_1.0.0.tar.gz` (a file that no longer exists in
  the repository) has been removed. The README now instructs users to
  install from CRAN.

The original archival reason was the NOTE
`'LazyData' is specified without a 'data' directory`, resolved in 1.0.2
by removing `LazyData: true` from `DESCRIPTION`; the package ships no
exported datasets (the only `.rda` file in the package is internal data
in `R/sysdata.rda`).

The other resubmission fixes carried forward from 1.0.2:

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
