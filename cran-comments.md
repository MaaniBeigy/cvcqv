## Test environments
* local Linux Ubuntu 18.04 install, R 3.4.4
* Ubuntu 16.04 (on travis-ci), R 3.6.1
* Appveyor win-builder x86_64-w64-mingw32/x64, 3.5.0
* win-builder (release, devel)

## Problems

Although the previous builds with `AppVeyor` CI were successful, now they have errors due to `gsl` dependency. I believe that it is a minor problem of `AppVeyor` virtual machines. 

## Resubmission

In the previous submission to CRAN, there were notes about a link in the references which is corrected, and examples with elapsed time > 10 s that are now removed. 

## R CMD check results
0 errors ✔ | 0 warnings ✔ | 0 notes ✔

R6 is a build-time dependency.

## Downstream dependencies
"There are currently no downstream dependencies for this package"
