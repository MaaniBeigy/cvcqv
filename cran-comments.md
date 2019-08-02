## Test environments
* local Linux Ubuntu 18.04 install, R 3.4.4
* Ubuntu 16.04 (on travis-ci), R 3.6.1
* Appveyor win-builder x86_64-w64-mingw32/x64, 3.5.0
* win-builder (release, devel)

## Problems

Because `boot` methods are used and are quite necessary for tests, there is one or two tests/examples with elapsed time more than 5 seconds (testthat time is 102s). 
Moreover, while the previous builds with `AppVeyor` CI were successful, now they have errors due to `gsl` dependency. I believe that it is a minor problem of `AppVeyor` virtual machines. 

## Resubmission

In the previous submission to r-hub, it had problems with `LaTex` to generate pdf files. It seemes to be corrected now and has been tested by travis-ci using `latex: true`. 

## R CMD check results
0 errors ✔ | 0 warnings ✔ | 0 notes ✔

R6 is a build-time dependency.

## Downstream dependencies
"There are currently no downstream dependencies for this package"
