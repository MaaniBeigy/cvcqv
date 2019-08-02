#' @title R6 Sample Quantiles
#' @name SampleQuantiles
#' @description The R6 class \code{SampleQuantiles} produces the sample
#'   quantiles corresponding to the given probabilities. It uses
#'   \link[stats]{quantile} from the package \pkg{stats}.
#' @param x An \code{R} object. Currently there are methods for numeric vectors
#' @param na.rm a logical value indicating whether \code{NA} values should be
#'   stripped before the computation proceeds.
#' @param digits integer indicating the number of decimal places to be used.
#' @param probs numeric vector of probabilities with values in \code{[0,1]}.
#' @param names logical; if TRUE, the result has a \link[base]{names} attribute
#'   regarding the percentiles.
#' @param type an integer between 1 and 9 selecting one of the nine quantile
#'   algorithms explained in \link[stats]{quantile} to be used.
#' @examples
#' x <- c(
#'    0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
#'    4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
#' )
#' SampleQuantiles$new(x)$qx()
#' percentile_95 <-  SampleQuantiles$new(x, na.rm = TRUE, digits = 2, probs = 0.95)
#' percentile_95$qx()
#' percentile_75 <-  SampleQuantiles$new(x, na.rm = TRUE, digits = 3, probs = 0.75)
#' percentile_75$qx()
#' R6::is.R6(percentile_95)
#' @export
#' @import dplyr SciViews boot R6 utils
NULL
#' @importFrom stats quantile sd qchisq qnorm
#' @importFrom MBESS conf.limits.nct
NULL
SampleQuantiles <- R6::R6Class(
    classname = "SampleQuantiles",
    public = list(
        # ---------------- determining defaults for arguments -----------------
        x = NA,
        na.rm = FALSE,
        digits = 1,
        probs = 0.5,
        names = TRUE,
        type = 7,
        eps = NA,
        epsp1 = NA,
        epsm1 = NA,
        # --------- determining constructor defaults for arguments ------------
        initialize = function(
            x = NA,
            na.rm = FALSE,
            digits = 1,
            probs = 0.5,
            names = TRUE,
            type = 7,
            ...) {
            # ----------------------- check NA or NAN -------------------------
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
            # -------------- check for probs being in range [0,1] -------------
            self$eps <- function(...) {100*.Machine$double.eps}
            self$epsp1 <- function(...) {1 + 100*.Machine$double.eps}
            self$epsm1 <- function(...) {-1 * (100*.Machine$double.eps)}
            if (any(
                !missing(probs) && (
                    probs < self$epsm1() | probs > self$epsp1())
                )
                ) {
                stop("probs outside [0,1]")
            } else if ((
                !missing(probs) && (probs <= self$epsp1() & probs >= 1)
            )) {
                self$probs <- 1
            } else if ((
                !missing(probs) && (probs >= self$epsm1() & probs <= 0)
            )) {
                self$probs <- 0
            } else if (
                (
                    !missing(probs) && (probs >= 0 & probs <= 1)
                )
            ) {
                self$probs <- probs
            }
            # ------------------- set digits with user input ------------------
            if (!missing(digits)) {
                self$digits <- digits
            }
            # ------------------- set type with user input --------------------
            if (!missing(type)) {
                self$type <- type
            }
            # ------------------ set names with user input --------------------
            if (!missing(names)) {
                self$names <- names
            }
            self$qx()  # initialize qx() i.e., sample quantile function
        },
        # --------- public function  qx() i.e., sample quantile function ------
        qx = function(...) {
            return(
                round(
                    stats::quantile(
                        self$x,
                        probs = self$probs,
                        na.rm = self$na.rm,
                        type = self$type,
                        names = self$names
                        ),
                    digits = self$digits
                    )
            )
        }
    )
)
