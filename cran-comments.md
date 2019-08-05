## Test environments

* local Linux Ubuntu 18.04 install, R 3.4.4
* Ubuntu 16.04 (on travis-ci), R 3.6.1
* Appveyor win-builder x86_64-w64-mingw32/x64, 3.5.0
* win-builder (release, devel)

## Problems

Although the previous builds with `AppVeyor` CI were successful, now they have errors due to `gsl` dependency. I believe that it is a minor problem of `AppVeyor` virtual machines. 

## Resubmission

In the previous submission to CRAN, there were notes about license, which is corrected, and examples with elapsed time > 10 s that are now removed. A cran maintainer requested references for the methods to be put in the description field of DESCRIPTION file. However, because of the spell_check() issues with the author names, it does not seem correct to put references in DESCRIPTION. The references are written in documentation files, vignettes, and README.md. I put some of the most important ones here:

Panichkitkosolkul, W. (2013). Confidence Intervals for the Coefficient of Variation in a Normal Distribution with a Known Population Mean. Journal of Probability and Statistics, 2013, 1–11. [Link](https://doi.org/10.1155/2013/324940)

Altunkaynak, B., & Gamgam, H. (2018). Bootstrap confidence intervals for the coefficient of quartile variation. Communications in Statistics: Simulation and Computation, 0(0), 1–9. [Link](https://doi.org/10.1080/03610918.2018.1435800)

Albatineh, A. N., Kibria, B. M., Wilcox, M. L., & Zogheib, B. (2014). Confidence interval estimation for the population coefficient of variation using ranked set sampling: A simulation study. Journal of Applied Statistics, 41(4), 733–751. [Link](https://doi.org/10.1080/02664763.2013.847405)


## R CMD check results
0 errors ✔ | 0 warnings ✔ | 0 notes ✔

R6 is a build-time dependency.

## Downstream dependencies
"There are currently no downstream dependencies for this package"
