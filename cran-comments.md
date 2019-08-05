## Test environments

* local Linux Ubuntu 18.04 install, R 3.4.4
* Ubuntu 16.04 (on travis-ci), R 3.6.1
* Appveyor win-builder x86_64-w64-mingw32/x64, 3.5.0
* win-builder (release, devel)

## Problems

Although the previous builds with `AppVeyor` CI were successful, now they have errors due to `gsl` dependency. I believe that it is a minor problem of `AppVeyor` virtual machines. 

## Resubmission

In the previous submission to CRAN, CRAN maintainers requested references for the methods to be put in the description field of DESCRIPTION file. Although the spell_check() has issues with the author names to put references in DESCRIPTION, I put some of the most important ones there. The full list of references is available in the documentation files, vignettes, and README.md. 
Also, a CRAN maintainer requested small executable examples in my Rd files. All of the Rd files have examples.


## R CMD check results
0 errors ✔ | 0 warnings ✔ | 0 notes ✔

R6 is a build-time dependency.

## Downstream dependencies
"There are currently no downstream dependencies for this package"
