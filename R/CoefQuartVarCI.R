#' @title R6 Confidence Intervals for the Coefficient of Quartile Variation
#'   (cqv)
#' @name CoefQuartVarCI
#' @description The R6 class \code{CoefQuartVarCI} for the confidence intervals
#'   of coefficient of quartile variation (cqv)
#' @param x An \code{R} object. Currently there are methods for numeric vectors
#' @param na.rm a logical value indicating whether \code{NA} values should be
#'   stripped before the computation proceeds.
#' @param digits integer indicating the number of decimal places to be used.
#' @param methods the available computation methods of confidence intervals are:
#'   "bonett_ci", "norm_ci", "basic_ci", "perc_ci", "bca_ci" or "all_ci".
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
#' y <- c(
#' 0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
#' 4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
#' )
#' CoefQuartVarCI$new(x = y)$bonett_ci()
#' cqv_y <- CoefQuartVarCI$new(
#'     x = y,
#'     alpha = 0.05,
#'     R = 1000,
#'     digits = 2
#' )
#' cqv_y$bonett_ci()
#' R6::is.R6(cqv_y)
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
CoefQuartVarCI <- R6::R6Class(
    classname = "CoefQuartVarCI",
    inherit = CoefQuartVar,
    public = list(
        # ---------------- determining defaults for arguments -----------------
        x = NA,
        na.rm = FALSE,
        digits = 1,
        R = 1000,
        alpha = 0.05,
        # --------------------- adding some internal fields -------------------
        zzz = NA,
        f1square = NA,
        f3square = NA,
        D = NA,
        S = NA,
        v = NA,
        ccc = NA,
        bootcqv = NA,
        # --------- determining constructor defaults for arguments ------------
        initialize = function(
            x = NA,
            na.rm = FALSE,
            digits = 1,
            R = 1000,
            alpha = 0.05,
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
            # ---- set the number of bootstrap replicates with user input -----
            if (!missing(R)) {
                self$R <- R
            }
            # ------ set the probability of type I error with user input ------
            if (!missing(alpha)) {
                self$alpha <- alpha
            }
            # ------------- initialize zzz() i.e., z(1 - alpha/2) -------------
            self$zzz = function(...) {
                qnorm((1 - ((1 - super$alphastar())/2)))
            }
            # --------------- initialize internal function f1^2 ---------------
            self$f1square = function(...) {
                (3 * (self$zzz())^2)/(
                    4 * length(self$x) * ((super$Yb() - super$Ya())^2))
            }
            # --------------- initialize internal function f3^2 ---------------
            self$f3square =  function(...) {
                (3 * (self$zzz())^2)/(
                    4 * length(self$x) * ((super$Yd() - super$Yc())^2))
            }
            # ----------- initialize internal function D = q3 - q1 ------------
            self$D = function(...) {
                super$super_$super_$initialize(
                    x = self$x,
                    na.rm = self$na.rm,
                    probs = 0.75,
                    names = FALSE
                ) - super$super_$super_$initialize(
                    x = self$x,
                    na.rm = self$na.rm,
                    probs = 0.25,
                    names = FALSE
                )
            }
            # ----------- initialize internal function S = q3 + q1 ------------
            self$S = function(...) {
                super$super_$super_$initialize(
                    x = self$x,
                    na.rm = self$na.rm,
                    probs = 0.75,
                    names = FALSE
                ) + super$super_$super_$initialize(
                    x = self$x,
                    na.rm = self$na.rm,
                    probs = 0.25,
                    names = FALSE
                )
            }
            # -------- initialize internal function v = var{ln(D/S)} ----------
            self$v = function(...) {
                (
                    (1/(16 * length(self$x))) * (
                        (((3/self$f1square()) + (3/self$f3square()) - (
                            2/sqrt(self$f1square() * self$f3square()))) /
                             self$D()^2) +
                            (((3/self$f1square()) + (3/self$f3square()) +
                                  (2/sqrt(self$f1square() * self$f3square()))) /
                                 self$S()^2) -
                            ((2 * ((3/self$f3square()) - (3/self$f1square()))) /
                                 (self$D()*self$S()))
                    )
                )
            }
            # ----------- initialize internal function c = n/(n-1) ------------
            # ---------------- which is a centering adjustment ----------------
            self$ccc = function(...) {length(self$x)/(length(self$x) - 1)}
            # ---- initialize the internal functions for public methods -------
            self$bootcqv = function(...) {
                return(
                super$super_$initialize(
                    x = self$x,
                    na.rm = self$na.rm,
                    R = self$R,
                    alpha = self$alpha
                ))
                # invisible(self)
            }
            self$bootcqv()
            # invisible(self)
        },
        # -------------- public method bonett_ci() i.e., Bonett CI ------------
        bonett_ci = function(...) {
            return(
                list(
                    method = "cqv with Bonett CI",
                    statistics = data.frame(
                        est = round(super$est(), digits = self$digits),
                        lower = (
                            round(
                                (100 * exp(
                                    ((SciViews::ln((self$D()/self$S())) *
                                          self$ccc())) -
                                        (self$zzz() * (self$v()^(0.5)))
                                )), digits = self$digits
                            )
                        ),
                        upper = (
                            round(
                                (100 * exp(
                                    ((SciViews::ln((self$D()/self$S())) *
                                          self$ccc())) +
                                        (self$zzz() * (self$v()^(0.5)))
                                )), digits = self$digits
                            )
                        ),
                        row.names = c(" ")
                    )
                )
            )
        },
        # -- public method norm_ci() i.e., Normal Approximation Bootstrap CI --
        norm_ci = function(...) {
            return(
                list(
                    method = "cqv with normal approximation bootstrap CI",
                    statistics = data.frame(
                        est = round(super$est(), digits = self$digits),
                        lower = round(
                            self$boot_norm_ci()$normal[2],
                            digits = self$digits),
                        upper = round(
                            self$boot_norm_ci()$normal[3],
                            digits = self$digits),
                        row.names = c(" ")
                    )
                )
            )
        },
        # ---------- public method basic_ci() i.e., Basic Bootstrap CI --------
        basic_ci = function(...) {
            return(
                list(
                    method = "cqv with basic bootstrap CI",
                    statistics = data.frame(
                        est = round(super$est(), digits = self$digits),
                        lower = round(
                            self$boot_basic_ci()$basic[4],
                            digits = self$digits),
                        upper = round(
                            self$boot_basic_ci()$basic[5],
                            digits = self$digits),
                        row.names = c(" ")
                    )
                )
            )
        },
        # ----- public method perc_ci() i.e., Bootstrap Percentile CI ---------
        perc_ci = function(...) {
            return(
                list(
                    method = "cqv with bootstrap percentile CI",
                    statistics = data.frame(
                        est = round(super$est(), digits = self$digits),
                        lower = round(
                            self$boot_perc_ci()$percent[4],
                            digits = self$digits),
                        upper = round(
                            self$boot_perc_ci()$percent[5],
                            digits = self$digits),
                        row.names = c(" ")
                    )
                )
            )
        },
        # - public method bca_ci() i.e., Adjusted Bootstrap Percentile (BCa) CI
        bca_ci = function(...) {
            return(
                list(
                    method = "cqv with adjusted bootstrap percentile (BCa) CI",
                    statistics = data.frame(
                        est = round(super$est(), digits = self$digits),
                        lower = round(
                            self$boot_bca_ci()$bca[4],
                            digits = self$digits),
                        upper = round(
                            self$boot_bca_ci()$bca[5],
                            digits = self$digits),
                        row.names = c(" ")
                    )
                )
            )
        },
        # --------- public method all_ci() i.e., All Bootstrap CIs ------------
        all_ci = function(...) {
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
                        est = c(
                            round(super$est(), digits = self$digits),
                            round(super$est(), digits = self$digits),
                            round(super$est(), digits = self$digits),
                            round(super$est(), digits = self$digits),
                            round(super$est(), digits = self$digits)
                        ),
                        lower = c(
                            round(
                                (100 * exp(
                                    ((SciViews::ln((self$D()/self$S())) *
                                          self$ccc())) -
                                        (self$zzz() * (self$v()^(0.5)))
                                )), digits = self$digits
                            ),
                            round(
                                self$boot_norm_ci()$normal[2],
                                digits = self$digits),
                            round(
                                self$boot_basic_ci()$basic[4],
                                digits = self$digits),
                            round(
                                self$boot_perc_ci()$percent[4],
                                digits = self$digits),
                            round(
                                self$boot_bca_ci()$bca[4],
                                digits = self$digits)
                        ),
                        upper = c(
                            round(
                                (100 * exp(
                                    ((SciViews::ln((self$D()/self$S())) *
                                          self$ccc())) +
                                        (self$zzz() * (self$v()^(0.5)))
                                )), digits = self$digits
                            ),
                            round(
                                self$boot_norm_ci()$normal[3],
                                digits = self$digits),
                            round(
                                self$boot_basic_ci()$basic[5],
                                digits = self$digits),
                            round(
                                self$boot_perc_ci()$percent[5],
                                digits = self$digits),
                            round(
                                self$boot_bca_ci()$bca[5],
                                digits = self$digits)
                        ),
                        description = c(
                            "cqv with Bonett CI",
                            "cqv with normal approximation CI",
                            "cqv with basic bootstrap CI",
                            "cqv with bootstrap percentile CI",
                            "cqv with adjusted bootstrap percentile (BCa) CI"
                        )
                    )
                )
            )
        }
    )
)
