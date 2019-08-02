#' @title R6 Coefficient of Quartile Variation (cqv)
#' @name CoefQuartVar
#' @description The R6 class \code{CoefQuartVar} for the coefficient of quartile
#'   variation (cqv)
#' @param x An \code{R} object. Currently there are methods for numeric vectors
#' @param na.rm a logical value indicating whether \code{NA} values should be
#'   stripped before the computation proceeds.
#' @param digits integer indicating the number of decimal places to be used.
#' @details \describe{ \item{\strong{Coefficient of Quartile Variation}}{
#'   \emph{cqv} is a measure of relative dispersion that is based on
#'   interquartile range \emph{(iqr)}. Since \eqn{cqv} is unitless, it is useful
#'   for comparison of variables with different units. It is also a measure of
#'   homogeneity \code{[1]}. } }
#' @examples
#' x <- c(
#'    0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
#'    4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
#' )
#' CoefQuartVar$new(x)$est()
#' cqv_x <- CoefQuartVar$new(x, digits = 2)
#' cqv_x$est()
#' R6::is.R6(cqv_x)
#' @references \code{[1]} Bonett, DG., 2006, Confidence interval for a
#'   coefficient of quartile variation, Computational Statistics & Data
#'   Analysis, 50(11), 2953-7, DOI:
#'   \href{http://doi.org/10.1016/j.csda.2005.05.007}{http://doi.org/10.1016/j.csda.2005.05.007}
#'
#' @export
#' @import dplyr SciViews boot R6 utils
NULL
#' @importFrom stats quantile sd qchisq qnorm
#' @importFrom MBESS conf.limits.nct
NULL
CoefQuartVar <- R6::R6Class(
    classname = "CoefQuartVar",
    inherit = BootCoefQuartVar,
    public = list(
        # ---------------- determining defaults for arguments -----------------
        x = NA,
        na.rm = FALSE,
        digits = 1,
        star = 0,
        # --------- determining constructor defaults for arguments ------------
        initialize = function(
            x = NA,
            na.rm = FALSE,
            digits = 1,
            ...
        ) {
            # ---------------------- check NA or NAN -------------------------
            if (missing(x) || is.null(x)) {
                stop("object 'x' not found")
            } else if (!missing(x)) {
                self$x <- x
            }
            if (!missing(na.rm)) {
                self$na.rm <- na.rm
            }
            if (self$na.rm == TRUE) {
                self$x <- x[!is.na(x)]
            } else if (anyNA(x) & self$na.rm == FALSE) {
                stop(
                    "missing values and NaN's not allowed if 'na.rm' is FALSE"
                )
            }
            # ------------- stop if input x vector is not numeric -------------
            if (!is.numeric(x)) {
                stop("argument is not a numeric vector")
            }
            # ------------------- set digits with user input ------------------
            if (!missing(digits)) {
                self$digits <- digits
            }
            # ---------- initialize cqv estimate i.e., est() function ---------
            self$est()
        },
        # --------- public method of cqv estimate i.e., est() function --------
        est = function(...) {
            if (  # check if 0.75 percentile is non-zero to avoid NANs
                super$super_$initialize(
                    x = self$x, na.rm = self$na.rm, probs = 0.75
                ) != 0
            ) {
                return(
                    round(
                        (((super$super_$initialize(
                            x = self$x,
                            na.rm = self$na.rm,
                            probs = 0.75,
                            names = FALSE,
                            digits = self$digits
                        )) - (super$super_$initialize(
                            x = self$x,
                            na.rm = self$na.rm,
                            probs = 0.25,
                            names = FALSE,
                            digits = self$digits
                        ) )) / ((super$super_$initialize(
                            x = self$x,
                            na.rm = self$na.rm,
                            probs = 0.75,
                            names = FALSE,
                            digits = self$digits
                        )) + (super$super_$initialize(
                            x = self$x,
                            na.rm = self$na.rm,
                            probs = 0.25,
                            names = FALSE,
                            digits = self$digits
                        )))) * 100,
                        digits = self$digits
                    )
                )
            } else if (
                super$super_$initialize(
                    x = self$x, na.rm = self$na.rm, probs = 0.75
                ) == 0
            ) {
                warning(
        "cqv is NaN because both q3 and q1 are 0, max was used instead of q3"
                )
                return(
                    round(
                        ((max(x = self$x) - (super$super_$initialize(
                            x = self$x,
                            na.rm = self$na.rm,
                            probs = 0.25,
                            names = FALSE
                        ) )) / (max(x = self$x) + (super$super_$initialize(
                            x = self$x,
                            na.rm = self$na.rm,
                            probs = 0.25,
                            names = FALSE
                        )))) * 100,
                        digits = self$digits
                    )
                )
            }
        },
        # ------------------- adding some internal methods --------------------
        # --------------------- adding some internal fields -------------------
        a =  function(...) {
            ceiling(
            (length(self$x)/4) - (1.96 * (((3 * length(self$x))/16)^(0.5)))
        )
            },
        b = function(...) {round(
            (length(self$x)/4) + (1.96 * (((3 * length(self$x))/16)^(0.5))),
            digits = 0
        )
            },
        c = function(...) {length(self$x) + 1 - self$b()},
        d = function(...) {length(self$x) + 1 - self$a()},
        Ya = function(...) {dplyr::nth(self$x, self$a(), order_by = self$x)},
        Yb = function(...) {dplyr::nth(self$x, self$b(), order_by = self$x)},
        Yc = function(...) {dplyr::nth(self$x, self$c(), order_by = self$x)},
        Yd = function(...) {dplyr::nth(self$x, self$d(), order_by = self$x)},
        alphastar = function(...) {
            for (i in self$a():(self$b() - 1)) {
                self$star[i] <- (
                    (choose(length(self$x), i)) *
                        (0.25^(i)) * (0.75^(length(self$x) - i))
                )
                return(alphastar = 1 - sum(self$star[i], na.rm = self$na.rm))
            }
        }
    ),
    # ---- define super_ function to enable multiple levels of inheritance ----
    active = list(
        super_ = function() super
    )
)



