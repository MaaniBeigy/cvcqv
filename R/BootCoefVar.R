#' @title R6 Bootstrap Resampling for Coefficient of Variation
#' @name BootCoefVar
#' @description The R6 class \code{BootCoefVar} produces the bootstrap
#'   resampling for the coefficient of variation (cv) of the given numeric
#'   vectors. It uses \link[boot]{boot} and \link[boot]{boot.ci} from the
#'   package \pkg{boot}.
#' @param x An \code{R} object. Currently there are methods for numeric vectors
#' @param na.rm a logical value indicating whether \code{NA} values should be
#'   stripped before the computation proceeds.
#' @param alpha The allowed type I error probability
#' @param R integer indicating the number of bootstrap replicates.
#' @examples
#' x <- c(
#'     0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
#'     4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
#' )
#' cv_x <- BootCoefVar$new(x)
#' cv_x$boot_cv()
#' cv_x$boot_cv_corr()
#' cv_x$boot_basic_ci_cv()
#' cv_x$boot_norm_ci_cv()
#' cv_x$boot_perc_ci_cv()
#' cv_x$boot_bca_ci_cv()
#' cv_x$boot_basic_ci_cv_corr()
#' cv_x$boot_norm_ci_cv_corr()
#' cv_x$boot_perc_ci_cv_corr()
#' cv_x$boot_bca_ci_cv_corr()
#' R6::is.R6(cv_x)
#' @export
#' @references Canty, A., & Ripley, B, 2017, boot: Bootstrap R (S-Plus)
#'   Functions. R package version 1.3-20.
#' @references Davison, AC., & Hinkley, DV., 1997, Bootstrap Methods and Their
#'   Applications. Cambridge University Press, Cambridge. ISBN 0-521-57391-2
#' @import dplyr SciViews boot R6 utils
NULL
#' @importFrom stats quantile sd qchisq qnorm
#' @importFrom MBESS conf.limits.nct
NULL
BootCoefVar <- R6::R6Class(
    classname = "BootCoefVar",
    public = list(
        # ---------------- determining defaults for arguments -----------------
        x = NA,
        na.rm = FALSE,
        R = 1000,
        alpha = 0.05,
        boot_cv = NA,
        boot_cv_corr = NA,
        # --------- determining constructor defaults for arguments ------------
        initialize = function(
            x = NA,
            na.rm = FALSE,
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
            if (na.rm == TRUE) {
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
            # ---- set the number of bootstrap replicates with user input -----
            if (!missing(R)) {
                self$R <- R
            }
            # ------ set the probability of type I error with user input ------
            if (!missing(alpha)) {
                self$alpha <- alpha
            }
            # ------ initialize boot_cv() i.e., bootstrap of cv function ------
            self$boot_cv = function(...) {
                return(
                    boot::boot(self$x, function(x, i) {
                            100 * (
                                (sd(self$x[i], na.rm = self$na.rm)) /
                                    (mean(self$x[i], na.rm = self$na.rm))
                                )
                        },
                        R = self$R
                        )
                )
            }
            # - initialize boot_cv_corr() i.e., bootstrap of cv_corr function -
            self$boot_cv_corr = function(...) {
                return(
                    boot::boot(self$x, function(x, i) {
                        100 * (sd(
                            self$x[i], na.rm = self$na.rm
                            )/mean(
                                self$x[i], na.rm = self$na.rm
                                ) * ((1 - (1/(4 * (length(self$x[i]) - 1))) +
                             (1/length(self$x)) * (
                                 sd(
                                     self$x[i], na.rm = self$na.rm
                                     )/mean(
                                         self$x[i], na.rm = self$na.rm
                                         ))^2) + (1/(2 * (
                                             length(self$x) - 1)^2))))
                        },
                        R = R
                        )
                )
                }
            },
        # ------- public methods of cv bootstrap confidence intervals ---------
        boot_norm_ci_cv = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cv(),
                    conf = (1 - self$alpha),
                    type = "norm"
                )
            )
        },
        boot_basic_ci_cv = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cv(),
                    conf = (1 - self$alpha),
                    type = "basic"
                )
            )
        },
        boot_perc_ci_cv = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cv(),
                    conf = (1 - self$alpha),
                    type = "perc"
                )
            )
        },
        boot_bca_ci_cv = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cv(),
                    conf = (1 - self$alpha),
                    type = "bca"
                )
            )
        },
        # ---- public methods of cv_corr bootstrap confidence intervals -------
        boot_norm_ci_cv_corr = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cv_corr(),
                    conf = (1 - self$alpha),
                    type = "norm"
                )
            )
        },
        boot_basic_ci_cv_corr = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cv_corr(),
                    conf = (1 - self$alpha),
                    type = "basic"
                )
            )
        },
        boot_perc_ci_cv_corr = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cv_corr(),
                    conf = (1 - self$alpha),
                    type = "perc"
                )
            )
        },
        boot_bca_ci_cv_corr = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cv_corr(),
                    conf = (1 - self$alpha),
                    type = "bca"
                )
            )
        }
    ),
    # ---- define super_ function to enable multiple levels of inheritance ----
    active = list(
        super_ = function() {super}
    )
)

