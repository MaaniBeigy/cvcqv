#' @title Coefficient of Quartile Variation (cqv)
#' @name cqv_versatile
#' @description Versatile function for the coefficient of quartile variation
#'   (cqv)
#' @param x An \code{R} object. Currently there are methods for numeric vectors
#' @param na.rm a logical value indicating whether \code{NA} values should be
#'   stripped before the computation proceeds.
#' @param digits integer indicating the number of decimal places to be used.
#' @param method a scalar representing the type of confidence intervals
#'   required. The value should be any of the values "bonett", "norm", "basic",
#'   "perc", "bca" or "all".
#' @param R integer indicating the number of bootstrap replicates.
#' @details \describe{ \item{\strong{Coefficient of Quartile Variation}}{ The
#'   \emph{cqv} is a measure of relative dispersion that is based on
#'   interquartile range \emph{(iqr)}. Since \eqn{cqv} is unitless, it is useful
#'   for comparison of variables with different units. It is also a measure of
#'   homogeneity \code{[1, 2]}. } }
#' @return An object of type "list" which contains the estimate, the intervals,
#'   and the computation method. It has two components:
#' @return \describe{ \item{$method}{ A description of statistical method used
#'   for the computations. } \item{$statistics}{ A data frame representing three
#'   vectors: est, lower and upper limits of 95\% confidence interval
#'   \code{(CI)}: \cr \cr \strong{est:}{ \code{cqv*100} } \cr \cr \strong{Bonett
#'   95\% CI:}{ It uses a centering adjustment which helps to equalize the tail
#'   error probabilities \code{[1, 2]}. } \cr \cr \strong{Normal approximation
#'   95\% CI:}{ The intervals calculated by the normal approximation \code{[3,
#'   4]}, using \link[boot]{boot.ci}. } \cr \cr \strong{Basic bootstrap 95\%
#'   CI:}{ The intervals calculated by the basic bootstrap method \code{[3, 4]},
#'   using \link[boot]{boot.ci}. } \cr \cr \strong{Bootstrap percentile 95\%
#'   CI:}{ The intervals calculated by the bootstrap percentile method \code{[3,
#'   4]}, using \link[boot]{boot.ci}. } \cr \cr \strong{Adjusted bootstrap
#'   percentile (BCa) 95\% CI:}{ The intervals calculated by the adjusted
#'   bootstrap percentile (BCa) method \code{[3, 4]}, using
#'   \link[boot]{boot.ci}. } } }
#' @examples
#' x <- c(
#'     0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
#'     4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
#' )
#' cqv_versatile(x)
#' cqv_versatile(x, na.rm = TRUE, digits = 2)
#' cqv_versatile(x, na.rm = TRUE, digits = 2, method = "bonett")
#' @references \code{[1]} Bonett, DG., 2006, Confidence interval for a
#'   coefficient of quartile variation, Computational Statistics & Data
#'   Analysis, 50(11), 2953-7, DOI:
#'   \href{http://doi.org/10.1016/j.csda.2005.05.007}{http://doi.org/10.1016/j.csda.2005.05.007}
#'
#' @references \code{[2]} Altunkaynak, B., Gamgam, H., 2018, Bootstrap
#'   confidence intervals for the coefficient of quartile variation, Simulation
#'   and Computation, 1-9, DOI:
#'   \href{http://doi.org/10.1080/03610918.2018.1435800}{http://doi.org/10.1080/03610918.2018.1435800}
#'
#' @references \code{[3]} Canty, A., & Ripley, B, 2017, boot: Bootstrap R
#'   (S-Plus) Functions. R package version 1.3-20.
#' @references \code{[4]} Davison, AC., & Hinkley, DV., 1997, Bootstrap Methods
#'   and Their Applications. Cambridge University Press, Cambridge. ISBN
#'   0-521-57391-2
#' @export
#' @import dplyr SciViews boot R6 utils
NULL
#' @importFrom stats quantile sd qchisq qnorm
#' @importFrom MBESS conf.limits.nct
NULL
cqv_versatile <- function(
    x,
    na.rm = FALSE,
    digits = 1,
    method = NULL,
    R = NULL,
    ...
) {
    # require(dplyr)
    # require(SciViews)
    # require(boot)
    if (missing(x) || is.null(x)) {
        stop("object 'x' not found")
    } else if (!missing(x)) {
        x <- x
    }
    if (!is.numeric(x)) {
        stop("argument is not a numeric vector")
    }
    na.rm = na.rm  # removes NAs if TRUE
    if (na.rm == TRUE) {
        x <- x[!is.na(x)]
    } else if (anyNA(x)) {
        stop(
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
    }
    # if (is.null(digits)) {
    #     digits = 1
    # }
    digits = digits  # digits required for rounding
    method = method  # returns 95% confidence interval
    if (is.null(R)) {
        R = 1000
    }
    q3 <- unname(
        stats::quantile(
            x,
            probs = 0.75,  # third quartile (0.75 percentile)
            na.rm = na.rm
        )
    )
    q1 <- unname(
        stats::quantile(
            x,
            probs = 0.25,  # first quartile (0.25 percentile)
            na.rm = na.rm
        )
    )
    if (q3 == 0) {  # to avoid NaNs when q3 and q1 are zero
        warning(
            "cqv is NaN because q3 and q1 are 0, max was used instead of q3"
        )
        q3 <- max(x, na.rm = na.rm)
    }
    a <- ceiling(
        (length(x)/4) - (1.96 * (((3 * length(x))/16)^(0.5)))
    )
    b <- round(
        (length(x)/4) + (1.96 * (((3 * length(x))/16)^(0.5))),
        digits = 0
    )
    c <- length(x) + 1 - b
    d <- length(x) + 1 - a
    Ya <- dplyr::nth(x, a, order_by = x)
    Yb <- dplyr::nth(x, b, order_by = x)
    Yc <- dplyr::nth(x, c, order_by = x)
    Yd <- dplyr::nth(x, d, order_by = x)
    star <- 0
    for (i in a:(b - 1)) {
        star[i] <- (
            (choose(length(x), i)) * (0.25^(i)) * (0.75^(length(x) - i))
        )
        alphastar <- 1 - sum(star[i], na.rm = na.rm)
    }
    zzz <- stats::qnorm((1 - ((1 - alphastar)/2)))
    f1square <- (3 * (zzz)^2)/(4 * length(x) * ((Yb - Ya)^2))
    f3square <- (3 * (zzz)^2)/(4 * length(x) * ((Yd - Yc)^2))
    D <- q3 - q1
    S <- q3 + q1
    v <- (
        (1/(16 * length(x))) * (
            (((3/f1square) + (3/f3square) - (2/sqrt(f1square * f3square))) / D^2) +
                (((3/f1square) + (3/f3square) + (2/sqrt(f1square * f3square))) / S^2) -
                ((2 * ((3/f3square) - (3/f1square)))/(D*S))
        )
    )
    ccc <- length(x)/(length(x) - 1)
    upper.tile <- exp(((SciViews::ln((D/S)) * ccc)) + (zzz * (v^(0.5))))
    lower.tile <- exp(((SciViews::ln((D/S)) * ccc)) - (zzz * (v^(0.5))))
    if (
        unname(stats::quantile(x, probs = 0.75, na.rm = na.rm)) != 0
    ) {
        boot.cqv <- boot::boot(
            x,
            function(x, i) {
                round(((
                    unname(stats::quantile(x[i], probs = 0.75, na.rm = na.rm)) -
                        unname(stats::quantile(x[i], probs = 0.25, na.rm = na.rm))
                ) / (
                    unname(stats::quantile(x[i], probs = 0.75, na.rm = na.rm)) +
                        unname(stats::quantile(x[i], probs = 0.25, na.rm = na.rm))
                )) * 100, digits = digits)
            },
            R = R
        )
    } else if (
        unname(stats::quantile(x, probs = 0.75, na.rm = na.rm)) == 0
    ) {
        boot.cqv <- boot::boot(
            x,
            function(x, i) {
                round(((
                    max(x[i], na.rm = na.rm) -
                        unname(stats::quantile(x[i], probs = 0.25, na.rm = na.rm))
                ) / (
                    max(x[i], na.rm = na.rm) +
                        unname(stats::quantile(x[i], probs = 0.25, na.rm = na.rm))
                )) * 100, digits = digits)
            },
            R = R
        )
    }

    if (is.null(method)) {
        boot.cqv.ci <- NA
    } else if (method == "bonett") {
        boot.cqv.ci <- NA
    } else if (method == "norm") {
        boot.norm.ci <- boot::boot.ci(boot.cqv, conf = 0.95, type = "norm")
    } else if (method == "basic") {
        boot.basic.ci <- boot::boot.ci(boot.cqv, conf = 0.95, type = "basic")
    } else if (method == "perc") {
        boot.perc.ci <- boot::boot.ci(boot.cqv, conf = 0.95, type = "perc")
    } else if (method == "bca") {
        boot.bca.ci <- boot::boot.ci(boot.cqv, conf = 0.95, type = "bca")
    } else if (method == "all") {
        boot.norm.ci <- boot::boot.ci(boot.cqv, conf = 0.95, type = "norm")
        boot.basic.ci <- boot::boot.ci(boot.cqv, conf = 0.95, type = "basic")
        boot.perc.ci <- boot::boot.ci(boot.cqv, conf = 0.95, type = "perc")
        boot.bca.ci <- boot::boot.ci(boot.cqv, conf = 0.95, type = "bca")
    }

    if (is.null(method)) {
        cqv <- round(
            100 * ((q3 - q1)/(q3 + q1)), digits = digits
        )
    } else if (method == "bonett") {
        cqv <- round(
            100 * ((q3 - q1)/(q3 + q1)), digits = digits
        )
    } else if (method == "norm") {
        cqv <- round(
            100 * ((q3 - q1)/(q3 + q1)), digits = digits
        )
    } else if (method == "basic") {
        cqv <- round(
            100 * ((q3 - q1)/(q3 + q1)), digits = digits
        )
    } else if (method == "perc") {
        cqv <- round(
            100 * ((q3 - q1)/(q3 + q1)), digits = digits
        )
    } else if (method == "bca") {
        cqv <- round(
            100 * ((q3 - q1)/(q3 + q1)), digits = digits
        )
    } else if (method == "all") {
        cqv <- round(
            100 * ((q3 - q1)/(q3 + q1)), digits = digits
        )
    }

    if (is.null(method)) {
        lower <- NA
        upper <- NA
    } else if (method == "bonett" && cqv != 100) {
        lower <- round(lower.tile * 100, digits = digits)
        upper <- round(upper.tile * 100, digits = digits)
    } else if (method == "norm" && cqv != 100) {
        lower <- round(boot.norm.ci$normal[2], digits = digits)
        upper <- round(boot.norm.ci$normal[3], digits = digits)
    } else if (method == "basic" && cqv != 100) {
        lower <- round(boot.basic.ci$basic[4], digits = digits)
        upper <- round(boot.basic.ci$basic[5], digits = digits)
    } else if (method == "perc" && cqv != 100) {
        lower <- round(boot.perc.ci$percent[4], digits = digits)
        upper <- round(boot.perc.ci$percent[5], digits = digits)
    } else if (method == "bca" && cqv != 100) {
        lower <- round(boot.bca.ci$bca[4], digits = digits)
        upper <- round(boot.bca.ci$bca[5], digits = digits)
    } else if (method == "bonett" && cqv == 100) {
        lower <- round(lower.tile * 100, digits = digits)
        upper <- round(upper.tile * 100, digits = digits)
    } else if (method == "norm" && cqv == 100) {
        lower <- round(lower.tile * 100, digits = digits)
        upper <- round(upper.tile * 100, digits = digits)
    } else if (method == "basic" && cqv == 100) {
        lower <- round(lower.tile * 100, digits = digits)
        upper <- round(upper.tile * 100, digits = digits)
    } else if (method == "perc" && cqv == 100) {
        lower <- round(lower.tile * 100, digits = digits)
        upper <- round(upper.tile * 100, digits = digits)
    } else if (method == "bca" && cqv == 100) {
        lower <- round(lower.tile * 100, digits = digits)
        upper <- round(upper.tile * 100, digits = digits)
    }
    if (is.null(method)) {
        return(
            list(
                method = "cqv = (q3-q1)/(q3+q1)",
                statistics = data.frame(
                    est = cqv,
                    row.names = c(" ")
                )
            )
        )
    } else if (method == "bonett" && cqv != 100) {
        return(
            list(
                method = "cqv with Bonett 95% CI",
                statistics = data.frame(
                    est = cqv,
                    lower = lower,
                    upper = upper,
                    row.names = c(" ")
                )
            )
        )
    } else if (method == "norm" && cqv != 100) {
        return(
            list(
                method = "cqv with normal approximation 95% CI",
                statistics = data.frame(
                    est = cqv,
                    lower = lower,
                    upper = upper,
                    row.names = c(" ")
                )
            )
        )
    } else if (method == "basic" && cqv != 100) {
        return(
            list(
                method = "cqv with basic bootstrap 95% CI",
                statistics = data.frame(
                    est = cqv,
                    lower = lower,
                    upper = upper,
                    row.names = c(" ")
                )
            )
        )
    } else if (method == "perc" && cqv != 100) {
        return(
            list(
                method = "cqv with bootstrap percentile 95% CI",
                statistics = data.frame(
                    est = cqv,
                    lower = lower,
                    upper = upper,
                    row.names = c(" ")
                )
            )
        )
    } else if (method == "bca" && cqv != 100) {
        return(
            list(
                method = "cqv with adjusted bootstrap percentile (BCa) 95% CI",
                statistics = data.frame(
                    est = cqv,
                    lower = lower,
                    upper = upper,
                    row.names = c(" ")
                )
            )
        )
    } else if (
        (
            method == "norm" | method == "bonett" | method == "basic" | method == "perc" |
            method == "bca" | method == "all"
        ) && cqv == 100
    ) {
        warning(
            "All values of t are equal to  100 \n Cannot calculate confidence intervals \n"
        )
        return(
            list(
                method = "cqv with Bonett 95% CI",
                statistics = data.frame(
                    est = cqv,
                    lower = round(lower.tile * 100, digits = digits),
                    upper = round(upper.tile * 100, digits = digits),
                    row.names = c(" ")
                )
            )
        )
    } else if (method == "all" && cqv != 100) {
        return(
            list(
                method = "All methods",
                statistics = data.frame(
                    row.names = c(
                        "bonett",
                        "norm",
                        "basic",
                        "percent",
                        "bca"
                    ),
                    est = c(cqv, cqv, cqv, cqv, cqv),
                    lower = c(
                        round(lower.tile * 100, digits = digits),
                        round(boot.norm.ci$normal[2], digits = digits),
                        round(boot.basic.ci$basic[4], digits = digits),
                        round(boot.perc.ci$percent[4], digits = digits),
                        round(boot.bca.ci$bca[4], digits = digits)
                    ),
                    upper = c(
                        round(upper.tile * 100, digits = digits),
                        round(boot.norm.ci$normal[3], digits = digits),
                        round(boot.basic.ci$basic[5], digits = digits),
                        round(boot.perc.ci$percent[5], digits = digits),
                        round(boot.bca.ci$bca[5], digits = digits)
                    ),
                    description = c(
                        "cqv with Bonett 95% CI",
                        "cqv with normal approximation 95% CI",
                        "cqv with basic bootstrap 95% CI",
                        "cqv with bootstrap percentile 95% CI",
                        "cqv with adjusted bootstrap percentile (BCa) 95% CI"
                    )
                )
            )
        )
    } else {
        stop("method for confidence interval is not available")
    }
}
