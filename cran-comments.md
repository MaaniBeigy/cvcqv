## Test environments

* local Linux Ubuntu 18.04 install, R 3.4.4
* Ubuntu 16.04 (on travis-ci), R 3.6.1
* Appveyor win-builder x86_64-w64-mingw32/x64, 3.5.0
* win-builder (release, devel)

## Problems

"checking for future file timestamps ... NOTE
  unable to verify current time"
It seems there are problems with "http://worldclockapi.com/api/json/utc/now".

## R CMD check results
0 errors ✓ | 0 warnings ✓ | 1 note x

R6 is a build-time dependency.

## Downstream dependencies
"There are currently no downstream dependencies for this package"
