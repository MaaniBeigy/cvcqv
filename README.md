[![Travis build status](https://travis-ci.org/MaaniBeigy/cvcqv.svg?branch=master)](https://travis-ci.org/MaaniBeigy/cvcqv)
[![AppVeyor Build status](https://ci.appveyor.com/api/projects/status/41rjx4g395bfdpq4?svg=true)](https://ci.appveyor.com/project/MaaniBeigy/cvcqv)
[![codecov](https://codecov.io/gh/MaaniBeigy/cvcqv/branch/master/graph/badge.svg)](https://codecov.io/gh/MaaniBeigy/cvcqv)
[![License](https://img.shields.io/badge/licence-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
![GitHub release](https://img.shields.io/github/release/MaaniBeigy/cvcqv)
[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.1.2-6666ff.svg)](https://cran.r-project.org/)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/MaaniBeigy/cvcqv)](https://github.com/MaaniBeigy/cvcqv)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![GitHub last commit](https://img.shields.io/github/last-commit/MaaniBeigy/cvcqv)](https://github.com/MaaniBeigy/cvcqv/commits/master)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/MaaniBeigy/cvcqv/issues)
[![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)     

# cvcqv <img src="./man/figures/sticker.svg" align="right" width="120" />

`cvcqv` provides some easy-to-use functions and classes to calculate 
Coefficient of  Variation (`cv`) and Coefficient of Quartile Variation (`cqv`)
with confidence intervals provided with all available methods.

# Overview   

### Background    

There are abundant methods available for the calculation of **confidence intervals** of a dispersion measure like coefficient of variation (`cv`) or coefficient of quartile variation (`cqv`), which have not yet been implemented in R. Also, `cqv` is quite useful in conditions where the distribution of variables does not follow normal distribution.   

#### Coefficient of Variation  

`cv` is a measure of relative dispersion representing the degree of variability relative to the mean (Albatineh et al, 2014). Since cv is unitless, it is useful for comparison of variables with different units. It is also a measure of homogeneity (Albatineh et al, 2014).

#### Coefficient of Quartile Variation

`cqv` is a measure of relative dispersion  that is based on interquartile range (`IQR`). Since `cqv` is unitless, it is also useful for comparison of variables with different units. It is also a measure of homogeneity (Bonett, 2006; Altunkaynak, 2018).

#### Confidence Interval

Since the measurements of `cv` and `cqv` are obtained from samples, we 
cannot easily generalize them and decide based upon them. Confidence Intervals (CI) help us to make a probabilistic interval around the estimation of calculated `cv` and `cqv`. For example, 95% CI indicates that it is 95% probable that the measurement for a population lies between the lower and upper bounds of that CI.

### Aims    

The authors' intention is to create a small R package adhering to [K-I-S-S principle](<https://en.wikipedia.org/wiki/KISS_principle>) to facilitate the use of the most available rigorous methods for calculation of confidence intervals around the variability measures of `cv` and `cqv`.

### Convention       

We are bound by the high standards of functional programming (FP) and object-oriented programming (OOP). The majority of tools provided by `cvcqv` are developed as both FP tools and [R6](https://github.com/r-lib/R6) classes, for sake of versatility, portability and efficiency.

# Getting started    

If you are an ubuntu user, you are going to need these non-R packages:    

```linux
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev libgsl-dev   
```   

The `cvcqv` is available on github. To install it in `R`, use:    

```r
devtools::install_github('MaaniBeigy/cvcqv')  
```

\* Currently, these tools are available:     

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

\* This package is inspired by `dplyr`, `R6`, `SciView`, `boot`, and `MBESS`.    

## Examples    

Here, we want to observe **all** available *confidence intervals* for the `cv` 
of variable *x*:

```r
x <- c(
    0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
    4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
)
results <- CoefVarCI$new(x, digits = 3)$all_ci()  # R6 class
# or alternatively: 
results <- cv_versatile(x, digits = 3, method = "all")  # functional programming
```

The `results` will be:    

|                     |    est|  lower|   upper|description                                        |
|:--------------------|------:|------:|-------:|:--------------------------------------------------|
|kelley               | 57.774| 41.287|  97.894|cv with Kelley 95% CI                              |
|mckay                | 57.774| 41.441| 108.483|cv with McKay 95% CI                               |
|miller               | 57.774| 34.053|  81.495|cv with Miller 95% CI                              |
|vangel               | 57.774| 41.264| 105.426|cv with Vangel 95% CI                              |
|mahmoudvand_hassani  | 57.774| 43.476|  82.857|cv with Mahmoudvand-Hassani 95% CI                 |
|equal_tailed         | 57.774| 43.937|  84.383|cv with Equal-Tailed 95% CI                        |
|shortest_length      | 57.774| 42.015|  81.013|cv with Shortest-Length 95% CI                     |
|normal_approximation | 57.774| 44.533|  85.272|cv with Normal Approximation 95% CI                |
|norm                 | 57.774| 38.799|  78.937|cv with Normal Approximation Bootstrap 95% CI      |
|basic                | 57.774| 35.055|  78.167|cv with Basic Bootstrap 95% CI                     |
|perc                 | 57.774| 38.879|  79.174|cv with Bootstrap Percentile 95% CI                |
|bca                  | 57.774| 40.807|  82.297|cv with Adjusted Bootstrap Percentile (BCa) 95% CI |

Next, we want to find **all** of the available *confidence intervals* for the `cqv` of variable *x*:  

```r
results <- CoefQuartVarCI$new(x, digits = 3)$all_ci()  # R6 class
# or alternatively:
results <- cqv_versatile(x, , digits = 3, method = "all")  # functional programming

```

The `results` will be:   

|        |    est|  lower|  upper|description                                     |
|:-------|------:|------:|------:|:-----------------------------------------------|
|bonett  | 45.625| 24.785| 77.329|cqv with Bonett CI                              |
|norm    | 45.625| 19.957| 70.840|cqv with normal approximation CI                |
|basic   | 45.625| 18.992| 73.917|cqv with basic bootstrap CI                     |
|percent | 45.625| 17.122| 68.683|cqv with bootstrap percentile CI                |
|bca     | 45.625| 24.273| 83.264|cqv with adjusted bootstrap percentile (BCa) CI |

## Documentation    

Download the [cvcqv_1.0.0.tar.gz](https://github.com/MaaniBeigy/cvcqv/raw/master/cvcqv_1.0.0.tar.gz). Install the source package `cvcqv` from the Packages >> Install >> Package Archive File (.tar.gz) >> Browse >> cvcqv_1.0.0.tar.gz. Or run an installation code like:  

```r
install.packages("~/cvcqv_1.0.0.tar.gz", repos = NULL, type = "source")
```

Then, browse for vignettes:

```r
browseVignettes("cvcqv")
```

Then, select `html` to show the vignette.

## References

Albatineh, AN., Kibria, BM., Wilcox, ML., & Zogheib, B, 2014, Confidence interval estimation for the population coefficient of variation using ranked set sampling: A simulation study, Journal of Applied Statistics, 41(4), 733–751, DOI: [http://doi.org/10.1080/02664763.2013.847405](<http://doi.org/10.1080/02664763.2013.847405>)

Bonett, DG., 2006, Confidence interval for a coefficient of quartile variation, Computational Statistics & Data Analysis, 50(11), 2953-7, DOI: [http://doi.org/10.1016/j.csda.2005.05.007](<http://doi.org/10.1016/j.csda.2005.05.007>)

Altunkaynak, B., Gamgam, H., 2018, Bootstrap confidence intervals for the coefficient of quartile variation, Simulation and Computation, 1-9, DOI: [http://doi.org/10.1080/03610918.2018.1435800](<http://doi.org/10.1080/03610918.2018.1435800>)