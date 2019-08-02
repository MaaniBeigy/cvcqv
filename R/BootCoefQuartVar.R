#' @title R6 Bootstrap Resampling for Coefficient of Quartile Variation
#' @name BootCoefQuartVar
#' @description The R6 class \code{BootCoefQuartVar} produces the bootstrap
#'   resampling for the coefficient of quartile variation (cqv) of the given
#'   numeric vectors. It uses \link[boot]{boot} from the package \pkg{boot}.
#'   Also, it produces the bootstrap confidence intervals for the cqv based on
#'   the \link[boot]{boot.ci} from the package \pkg{boot}.
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
#' cqv_x <- BootCoefQuartVar$new(x)
#' cqv_x$boot_cqv()
#' cqv_x$boot_basic_ci()
#' cqv_x$boot_norm_ci()
#' cqv_x$boot_perc_ci()
#' cqv_x$boot_bca_ci()
#' R6::is.R6(cqv_x)
#' @export
#' @references Canty, A., & Ripley, B, 2017, boot: Bootstrap R (S-Plus)
#'   Functions. R package version 1.3-20.
#' @references Davison, AC., & Hinkley, DV., 1997, Bootstrap Methods and Their
#'   Applications. Cambridge University Press, Cambridge. ISBN 0-521-57391-2
#' @references Altunkaynak, B., Gamgam, H., 2018, Bootstrap confidence intervals
#'   for the coefficient of quartile variation, Simulation and Computation, 1-9,
#'   DOI:
#'   \href{http://doi.org/10.1080/03610918.2018.1435800}{http://doi.org/10.1080/03610918.2018.1435800}
#'
#' @import dplyr SciViews boot R6 utils
NULL
#' @importFrom stats quantile sd qchisq qnorm
#' @importFrom MBESS conf.limits.nct
NULL
BootCoefQuartVar <- R6::R6Class(
    classname = "BootCoefQuartVar",
    inherit = SampleQuantiles,
    public = list(
        # ---------------- determining defaults for arguments -----------------
        x = NA,
        na.rm = FALSE,
        R = 1000,
        alpha = 0.05,
        boot_cqv = NA,
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
            # ----- initialize boot_cqv() i.e., bootstrap of cqv function -----
            self$boot_cqv = function(...) {
                if (  # check if 0.75 percentile is non-zero to avoid NANs
                super$initialize(x = self$x, na.rm = TRUE, probs = 0.75) != 0
                ) {
                    return(
                        boot::boot(self$x, function(x, i) {
                            (((
                                unname(
                                    quantile(
                                        self$x[i],
                                        probs = 0.75,
                                        na.rm = self$na.rm
                                    )
                                ) - unname(
                                    quantile(
                                        self$x[i],
                                        probs = 0.25,
                                        na.rm = self$na.rm)
                                )
                            ) / (unname(
                                quantile(
                                    self$x[i],
                                    probs = 0.75,
                                    na.rm = self$na.rm)
                            ) + unname(
                                quantile(
                                    self$x[i],
                                    probs = 0.25,
                                    na.rm = self$na.rm
                                )
                            )
                            )) * 100)
                        },
                        R = self$R
                        )
                    )
                } else if (  # check if 0.75 percentile is zero to avoid NANs
                super$initialize(x = self$x, na.rm = TRUE, probs = 0.75) == 0
                ) {
                    warning(
                        "cqv is NaN because both q3 and q1 are 0, max was used instead of q3"
                    )
                    return(
                        boot::boot(self$x, function(x, i) {
                            (((
                                unname(
                                    max(
                                        self$x[i],
                                        na.rm = self$na.rm
                                    )
                                ) - unname(
                                    quantile(
                                        self$x[i],
                                        probs = 0.25,
                                        na.rm = self$na.rm)
                                )
                            ) / (unname(
                                max(
                                    self$x[i],
                                    na.rm = self$na.rm)
                            ) + unname(
                                quantile(
                                    self$x[i],
                                    probs = 0.25,
                                    na.rm = self$na.rm
                                )
                            )
                            )) * 100)
                        },
                        R = self$R
                        )
                    )
                }
            }
        },
        # --------- public methods of bootstrap confidence intervals ----------
        boot_norm_ci = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cqv(),
                    conf = (1 - self$alpha),
                    type = "norm"
                )
            )
        },
        boot_basic_ci = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cqv(),
                    conf = (1 - self$alpha),
                    type = "basic"
                )
            )
        },
        boot_perc_ci = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cqv(),
                    conf = (1 - self$alpha),
                    type = "perc"
                )
            )
        },
        boot_bca_ci = function(...) {
            return(
                boot::boot.ci(
                    self$boot_cqv(),
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

