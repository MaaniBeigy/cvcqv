#' @title R6 Confidence Intervals for the Coefficient of Variation (cv)
#' @name CoefVarCI
#' @description The R6 class \code{CoefVarCI} for the confidence intervals of
#'   coefficient of variation (cv)
#' @param x An \code{R} object. Currently there are methods for numeric vectors
#' @param na.rm a logical value indicating whether \code{NA} values should be
#'   stripped before the computation proceeds.
#' @param digits integer indicating the number of decimal places to be used.
#' @param method a scalar representing the type of confidence intervals
#'   required. The value should be any of the values "kelley_ci", "mckay_ci",
#'   "miller_ci", "vangel_ci", "mahmoudvand_hassani_ci", "equal_tailed_ci",
#'   "shortest_length_ci", "normal_approximation_ci", "norm_ci","basic_ci", or
#'   "all_ci".
#' @param alpha The allowed type I error probability
#' @param R integer indicating the number of bootstrap replicates.
#' @param correction returns the unbiased estimate of the coefficient of
#'   variation if TRUE is determined.
#' @details \describe{ \item{\strong{Coefficient of Variation}}{ The \emph{cv}
#'   is a measure of relative dispersion representing the degree of variability
#'   relative to the mean \code{[1]}. Since \eqn{cv} is unitless, it is useful
#'   for comparison of variables with different units. It is also a measure of
#'   homogeneity \code{[1]}. } }
#' @return An object of type "list" which contains the estimate, the intervals,
#'   and the computation method. It has two main components:
#' @return \describe{ \item{$method}{ A description of statistical method used
#'   for the computations. } \item{$statistics}{ A data frame representing three
#'   vectors: est/, lower and upper limits of confidence interval \code{(CI)};
#'   additional description vector is provided when "all" is selected: \cr \cr
#'   \strong{est:}{ \code{cv*100} } \cr \cr \strong{Kelley Confidence
#'   Interval:}{ Thanks to package \link[MBESS]{MBESS} \code{[2]} for the
#'   computation of confidence limits for the noncentrality parameter from a
#'   \emph{t} distribution \link[MBESS]{conf.limits.nct} \code{[3]}. } \cr \cr
#'   \strong{McKay Confidence Interval:}{ The intervals calculated by the method
#'   introduced by McKay \code{[4]}, using chi-square distribution. } \cr \cr
#'   \strong{Miller Confidence Interval:}{ The intervals calculated by the
#'   method introduced by Miller \code{[5]}, using the standard normal
#'   distribution. } \cr \cr \strong{Vangel Confidence Interval:}{ Vangel
#'   \code{[6]} proposed a method for the calculation of CI for \emph{cv}; which
#'   is a modification on McKay’s CI. } \cr \cr \strong{Mahmoudvand-Hassani
#'   Confidence Interval:}{ Mahmoudvand and Hassani \code{[7]} proposed a new CI
#'   for \emph{cv}; which is obtained using ranked set sampling \emph{(RSS)} }
#'   \cr \cr \strong{Normal Approximation Confidence Interval:}{ Wararit
#'   Panichkitkosolkul \code{[8]} proposed another CI for \emph{cv}; which is a
#'   normal approximation. } \cr \cr \strong{Shortest-Length Confidence
#'   Interval:}{ Wararit Panichkitkosolkul \code{[8]} proposed another CI for
#'   \emph{cv}; which is obtained through minimizing the length of CI. } \cr \cr
#'   \strong{Equal-Tailed Confidence Interval:}{ Wararit Panichkitkosolkul
#'   \code{[8]} proposed another CI for \emph{cv}; which is obtained using
#'   chi-square distribution. } \cr \cr \strong{Bootstrap Confidence
#'   Intervals:}{ Thanks to package \pkg{boot} by Canty & Ripley \code{[9]} we
#'   can obtain bootstrap CI around \emph{cv} using \link[boot]{boot.ci}. } \cr
#'   \cr } }
#' @examples
#' y <- c(
#'     0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
#'     4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
#' )
#' CoefVarCI$new(x = y)$kelley_ci()
#' cv_y <- CoefVarCI$new(
#'    x = y,
#'    alpha = 0.05,
#'    R = 1000,
#'    digits = 2,
#'    correction = TRUE
#' )
#' cv_y$kelley_ci()
#' cv_y$mckay_ci()
#' R6::is.R6(cv_y)
#' @references \code{[1]} Albatineh, AN., Kibria, BM., Wilcox, ML., & Zogheib,
#'   B, 2014, Confidence interval estimation for the population coefficient of
#'   variation using ranked set sampling: A simulation study, Journal of Applied
#'   Statistics, 41(4), 733–751, DOI:
#'   \href{http://doi.org/10.1080/02664763.2013.847405}{http://doi.org/10.1080/02664763.2013.847405}
#'
#' @references \code{[2]} Kelley, K., 2018, MBESS: The MBESS R Package. R
#'   package version 4.4. 3.
#'
#' @references \code{[3]} Kelley, K., 2007, Sample size planning for the
#'   coefficient of variation from the accuracy in parameter estimation
#'   approach, Behavior Research Methods, 39(4), 755–766, DOI:
#'   \href{http://doi.org/10.3758/BF03192966}{http://doi.org/10.3758/BF03192966}
#' @references \code{[4]} McKay, AT., 1932, Distribution of the Coefficient of
#'   Variation and the Extended“ t” Distribution, Journal of the Royal
#'   Statistical Society, 95(4), 695–698
#' @references \code{[5]} Miller, E., 1991, Asymptotic test statistics for
#'   coefficients of variation, Communications in Statistics-Theory and Methods,
#'   20(10), 3351–3363
#' @references \code{[6]} Vangel, MG., 1996, Confidence intervals for a normal
#'   coefficient of variation, The American Statistician, 50(1), 21–26
#' @references \code{[7]} Mahmoudvand, R., & Hassani, H., 2009, Two new
#'   confidence intervals for the coefficient of variation in a normal
#'   distribution, Journal of Applied Statistics, 36(4), 429–442
#' @references \code{[8]} Panichkitkosolkul, W., 2013, Confidence Intervals for
#'   the Coefficient of Variation in a Normal Distribution with a Known
#'   Population Mean, Journal of Probability and Statistics, 2013, 1–11,
#'   \href{http://doi.org/10.1155/2013/324940}{http://doi.org/10.1155/2013/324940}
#'
#' @references \code{[9]} Canty, A., & Ripley, B., 2017, boot: Bootstrap R
#'   (S-Plus) Functions, R package version 1.3-20
#' @export
#' @import dplyr SciViews boot R6 utils
NULL
#' @importFrom stats quantile sd qchisq qnorm
#' @importFrom MBESS conf.limits.nct
NULL
CoefVarCI <- R6::R6Class(
    classname = "CoefVarCI",
    inherit = CoefVar,
    public = list(
        # ---------------- determining defaults for arguments -----------------
        x = NA,
        na.rm = FALSE,
        digits = 1,
        R = 1000,
        alpha = 0.05,
        correction = FALSE,
        # --------------------- adding some internal fields -------------------
        ncp_cv = NA,
        ncp_cv_corr = NA,
        v = NA,
        est = NA,
        kelley_nctci_cv = NA,
        kelley_nctci_cv_corr = NA,
        t1_mckay = NA,
        t2_mckay = NA,
        u1_mckay = NA,
        u2_mckay = NA,
        lower_tile_kelley_cv = NA,
        upper_tile_kelley_cv = NA,
        lower_tile_kelley_cv_corr = NA,
        upper_tile_kelley_cv_corr = NA,
        lower_tile_mckay_cv = NA,
        upper_tile_mckay_cv = NA,
        lower_tile_mckay_cv_corr = NA,
        upper_tile_mckay_cv_corr = NA,
        z_miller = NA,
        u_miller_cv = NA,
        u_miller_cv_corr = NA,
        zu_miller_cv = NA,
        zu_miller_cv_corr = NA,
        lower_tile_miller_cv = NA,
        upper_tile_miller_cv = NA,
        lower_tile_miller_cv_corr = NA,
        upper_tile_miller_cv_corr = NA,
        t1_vangel = NA,
        t2_vangel = NA,
        u1_vangel = NA,
        u2_vangel = NA,
        lower_tile_vangel_cv = NA,
        upper_tile_vangel_cv = NA,
        lower_tile_vangel_cv_corr = NA,
        upper_tile_vangel_cv_corr = NA,
        cn_mh = NA,
        ul_mh = NA,
        uu_mh = NA,
        lower_tile_mh_cv = NA,
        upper_tile_mh_cv = NA,
        lower_tile_mh_cv_corr = NA,
        upper_tile_mh_cv_corr = NA,
        cn_normaapprox = NA,
        ul_normaapprox = NA,
        uu_normaapprox = NA,
        lower_tile_normaapprox_cv = NA,
        upper_tile_normaapprox_cv = NA,
        lower_tile_normaapprox_cv_corr = NA,
        upper_tile_normaapprox_cv_corr = NA,
        a_value = NA,
        b_value = NA,
        lower_tile_shortest_cv = NA,
        upper_tile_shortest_cv = NA,
        lower_tile_shortest_cv_corr = NA,
        upper_tile_shortest_cv_corr = NA,
        t1_equal = NA,
        t2_equal = NA,
        lower_tile_equal_cv = NA,
        upper_tile_equal_cv = NA,
        lower_tile_equal_cv_corr = NA,
        upper_tile_equal_cv_corr = NA,
        shortest_length = data.frame(
            # ----------- "a" and "b" values for shortest-length CI -----------
            v = c(  # degrees of freedom
                2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
                20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 40, 50, 60, 70, 80,
                90, 100, 150, 200, 250, 300, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
                13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
                29, 30, 40, 50, 60, 70, 80, 90, 100, 150, 200, 250, 300, 2, 3,
                4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 40, 50, 60, 70, 80, 90,
                100, 150, 200, 250, 300
            ),
            al = c(  # al is the allowed type I error probability
                0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1,
                0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1,
                0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1,
                0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1,
                0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05,
                0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05,
                0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05,
                0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05,
                0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05,
                0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01,
                0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01,
                0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01,
                0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01,
                0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01
            ),
            a = c(  # a is an attribute for the length of CI
                0.2065, 0.5654, 1.02, 1.5352, 2.093, 2.6828, 3.2981, 3.9343,
                4.5883, 5.2573, 5.9397, 6.6337, 7.3382, 8.0521, 8.7745,
                9.5047, 10.2421, 10.9861, 11.7362, 12.4919, 13.253,
                14.0191, 14.7899, 15.565, 16.3443, 17.1275, 17.9144,
                18.7049, 19.4987, 27.5919, 35.9012, 44.3661, 52.9501,
                61.629, 70.386, 79.2086, 124.0372, 169.6646, 215.8057,
                262.3132, 0.1015, 0.3449, 0.6918, 1.1092, 1.5776,
                2.0851, 2.6235, 3.1874, 3.7729, 4.3768, 4.9967,
                5.6308, 6.2776, 6.9357, 7.6042, 8.282, 8.9685,
                9.6629, 10.3647, 11.0733, 11.7882, 12.5092,
                13.2357, 13.9675, 14.7043, 15.4458, 16.1917,
                16.9419, 17.6961, 25.4233, 33.4085, 41.5794, 49.8923,
                58.3183, 66.8374, 75.4347, 119.2737, 164.0642,
                209.4667, 255.3057, 0.02, 0.114, 0.2937, 0.5461,
                0.8567, 1.2143, 1.6107, 2.0394, 2.4958, 2.976, 3.4771,
                3.9968, 4.5329, 5.084, 5.6487, 6.2256, 6.8139, 7.4126,
                8.0209, 8.6383, 9.264, 9.8976, 10.5385, 11.1864, 11.8408,
                12.5014, 13.1678, 13.8397, 14.517, 21.5331, 28.8879,
                36.4863, 44.2711, 52.2044, 60.2597, 68.4177, 110.3262,
                153.4834, 197.444, 241.9776
            ),
            b = c(  # b is an attribute for the length of CI
                12.5208, 13.1532, 14.18, 15.3498, 16.5807, 17.8391,
                19.1099, 20.3848, 21.6598, 22.9325, 24.2016,
                25.4666, 26.7269, 27.9825, 29.2334, 30.4796,
                31.7212, 32.9585, 34.1915, 35.4205, 36.6455,
                37.8668, 39.0844, 40.2986, 41.5095, 42.7171,
                43.9217, 45.1234, 46.3222, 58.1755, 69.8342,
                81.3479, 92.7487, 104.0584, 115.2925, 126.4628,
                181.6128, 235.9748, 289.8273, 343.3155, 15.1194,
                15.5897, 16.5735, 17.7432, 18.9954, 20.2863,
                21.5953, 22.9118, 24.2303, 25.5476, 26.8618,
                28.1717, 29.4769, 30.777, 32.072, 33.3619,
                34.6467, 35.9266, 37.2016, 38.472, 39.7379,
                40.9995, 42.257, 43.5105, 44.7601, 46.006,
                47.2483, 48.4872, 49.7229, 61.9217, 73.892,
                85.6914, 97.3573, 108.9153, 120.3839, 131.7767,
                187.9079, 243.1025, 297.691, 351.8461, 20.8264,
                20.9856, 21.8371, 22.9867, 24.2618, 25.6017,
                26.9749, 28.3643, 29.7602, 31.158, 32.5543,
                33.9474, 35.3358, 36.7192, 38.0968, 39.4688,
                40.8347, 42.1952, 43.5498, 44.8989, 46.2426,
                47.581, 48.9144, 50.2428, 51.5665, 52.8856,
                54.2002, 55.5107, 56.8169, 69.6808, 82.2534,
                94.6063, 106.7867, 118.8272, 130.7514, 142.5771,
                200.6194, 257.4375, 313.462, 368.9185
            )
        ),
        bootcv = NA,
        # --------- determining constructor defaults for arguments ------------
        initialize = function(
            x = NA,
            na.rm = FALSE,
            digits = 1,
            R = 1000,
            alpha = 0.05,
            correction = FALSE,
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
            # ----------------- set correction with user input ----------------
            if (!missing(correction)) {
                self$correction <- correction
            }
            # ------ initialize some internal fields for public methods -------
            # ------ initialize est function from parent class CoefVar --------
            self$est = function(...) {super$initialize(
                self$x,
                na.rm = self$na.rm,
                digits = self$digits
            )}
            self$est()
            # --- initialize the internal functions for the public methods ----
            # ------ initialize internal functions of confidence limits -------
            # ------------------------ Kelley method --------------------------
            self$ncp_cv = function(...) {
                # non-centrality parameter of cv
                return(
                    sqrt(length(self$x))/(self$est()/100)
                )
                }
            self$ncp_cv_corr = function(...) {
                # non-centrality parameter of corrected cv
                return(
                    sqrt(length(self$x))/(self$est_corr()/100)
                )
            }
            self$v = function(...) {
                # v is the n-1 degrees of freedom
                return(
                    length(self$x) - 1
                )
            }
            self$kelley_nctci_cv = function(...) {
                # for Kelley method of CI
                # noncentrality parameter from a t distribution for cv
                return(
                    MBESS::conf.limits.nct(
                        ncp = self$ncp_cv(),
                        df = self$v(),
                        conf.level = (1 - self$alpha)
                    )
                )
            }
            self$kelley_nctci_cv_corr = function(...) {
                # for Kelley method of CI
                # noncentrality parameter from a t distribution for corrected cv
                return(
                    MBESS::conf.limits.nct(
                        ncp = self$ncp_cv_corr(),
                        df = self$v(),
                        conf.level = (1 - self$alpha)
                    )
                )
            }
            self$lower_tile_kelley_cv = function(...) {
                # lower confidence limit for Kelley method of cv
                return(
                    unname(
                        sqrt(
                            length(
                                self$x
                                )
                            )/self$kelley_nctci_cv()$Upper.Limit
                        )
                )

            }
            self$upper_tile_kelley_cv = function(...) {
                # upper confidence limit for Kelley method of cv
                return(
                    unname(
                        sqrt(
                            length(
                                self$x
                                )
                            )/self$kelley_nctci_cv()$Lower.Limit
                        )
                )
            }
            self$lower_tile_kelley_cv_corr = function(...) {
                # lower confidence limit for Kelley method of corrected cv
                return(
                    unname(
                        sqrt(
                            length(
                                self$x
                            )
                        )/self$kelley_nctci_cv_corr()$Upper.Limit
                    )
                )
            }
            self$upper_tile_kelley_cv_corr = function(...) {
                # upper confidence limit for Kelley method of corrected cv
                return(
                    unname(
                        sqrt(
                            length(
                                self$x
                            )
                        )/self$kelley_nctci_cv_corr()$Lower.Limit
                    )
                )
            }
            # ------------------------ McKay method ---------------------------
            self$t1_mckay = function(...) {
                # chi-square (1-alpha/2)% quantile
                return(
                    qchisq(1 - self$alpha/2, self$v())/self$v()
                )
            }
            self$t2_mckay = function(...) {
                # chi-square (alpha/2)% quantile
                return(
                    qchisq(self$alpha/2, self$v())/self$v()
                )
            }
            self$u1_mckay = function(...) {
                # u1 parameter based on chi-square (1-alpha/2)% quantile
                return(
                    self$v()*self$t1_mckay()
                )
                }
            self$u2_mckay = function(...) {
                # u2 parameter based on chi-square (alpha/2)% quantile
                return(
                    self$v()*self$t2_mckay()
                )
                }
            self$lower_tile_mckay_cv = function(...) {
                # lower confidence limit for McKay method of cv
                return(
                    (self$est()/100)/sqrt(
                        (self$u1_mckay()/(self$v() + 1) - 1
                        )*(
                            (self$est()/100)^2) + self$u1_mckay()/self$v()
                    )
                )
            }
            self$upper_tile_mckay_cv = function(...) {
                # upper confidence limit for McKay method of cv
                return(
                    (self$est()/100)/sqrt(
                        (self$u2_mckay()/(self$v() + 1) - 1
                        )*(
                            (self$est()/100)^2) + self$u2_mckay()/self$v()
                    )
                )
            }
            self$lower_tile_mckay_cv_corr = function(...) {
                # lower confidence limit for McKay method of corrected cv
                return(
                    (self$est_corr()/100)/sqrt(
                        (self$u1_mckay()/(self$v() + 1) - 1
                        )*(
                            (self$est_corr()/100)^2) + self$u1_mckay()/self$v()
                    )
                )
            }
            self$upper_tile_mckay_cv_corr = function(...) {
                # upper confidence limit for McKay method of corrected cv
                return(
                    (self$est_corr()/100)/sqrt(
                        (self$u2_mckay()/(self$v() + 1) - 1
                        )*(
                            (self$est_corr()/100)^2) + self$u2_mckay()/self$v()
                    )
                )
            }
            # ------------------------ Miller method --------------------------
            self$z_miller = function(...) {
                # z(1-alpha/2)% percentile of Miller Method
                return(
                    qnorm(1 - (self$alpha/2))
                )
            }
            self$u_miller_cv = function(...) {
                # u parameter based on z(1-alpha/2)% percentile for cv
                return(
                    sqrt(
                        (
                            (self$est()/100)^2/self$v()) *
                            (0.5 + (self$est()/100)^2)
                    )
                )
            }
            self$u_miller_cv_corr = function(...) {
                # u parameter based on z(1-alpha/2)% percentile for corrected cv
                return(
                    sqrt(
                        ((self$est_corr()/100)^2/self$v()) *
                            (0.5 + (self$est_corr()/100)^2)
                    )
                )
            }
            self$zu_miller_cv = function(...) {
                # Miller z * Miller u for cv
                return(
                    self$z_miller() * self$u_miller_cv()
                )
            }
            self$zu_miller_cv_corr = function(...) {
                # Miller z * Miller u for corrected cv
                return(
                    self$z_miller() * self$u_miller_cv_corr()
                )
            }
            self$lower_tile_miller_cv = function(...) {
                # lower confidence limit for Miller method of cv
                return(
                    (self$est()/100) - self$zu_miller_cv()
                )
            }
            self$upper_tile_miller_cv = function(...) {
                # upper confidence limit for Miller method of cv
                return(
                    (self$est()/100) + self$zu_miller_cv()
                )
            }
            self$lower_tile_miller_cv_corr = function(...) {
                # lower confidence limit for Miller method of corrected cv
                return(
                    (self$est_corr()/100) - self$zu_miller_cv_corr()
                )
            }
            self$upper_tile_miller_cv_corr = function(...) {
                # upper confidence limit for Miller method of corrected cv
                return(
                    (self$est_corr()/100) + self$zu_miller_cv_corr()
                )
            }
            # ------------------------ Vangel method --------------------------
            self$t1_vangel = function(...) {
                # chi-square (1-alpha/2)% quantile
                return(
                    qchisq(1 - self$alpha/2,self$v())/self$v()
                )
            }
            self$t2_vangel = function(...) {
                # chi-square (alpha/2)% quantile
                return(
                    qchisq(self$alpha/2,self$v())/self$v()
                )
            }
            self$u1_vangel = function(...) {
                # u1 parameter based on chi-square (1-alpha/2)% quantile
                return(
                    self$v()*self$t1_vangel()
                )
            }
            self$u2_vangel = function(...) {
                # u2 parameter based on chi-square (alpha/2)% quantile
                return(
                    self$v()*self$t2_vangel()
                )
            }
            self$lower_tile_vangel_cv = function(...) {
                # lower confidence limit for Vangel method of cv
                return(
                    (self$est()/100)/sqrt(
                        (
                            (self$u1_vangel() + 1)/(self$v() + 1) - 1 ) *
                            ((self$est()/100)^2) + self$u1_vangel()/self$v()
                    )
                )
            }
            self$upper_tile_vangel_cv = function(...) {
                # upper confidence limit for Vangel method of cv
                return(
                    (self$est()/100)/sqrt(
                        (
                            (self$u2_vangel() + 1)/(self$v() + 1) - 1) *
                            ((self$est()/100)^2) + self$u2_vangel()/self$v()
                    )
                )
            }
            self$lower_tile_vangel_cv_corr = function(...) {
                # lower confidence limit for Vangel method of corrected cv
                return(
                    (self$est_corr()/100)/sqrt(
                        (
                            (self$u1_vangel() + 1)/(self$v() + 1) - 1 ) *
                            ((self$est_corr()/100)^2) +
                            self$u1_vangel()/self$v()
                    )
                )
            }
            self$upper_tile_vangel_cv_corr = function(...) {
                # upper confidence limit for Vangel method of corrected cv
                return(
                    (self$est_corr()/100)/sqrt(
                        (
                            (self$u2_vangel() + 1)/(self$v() + 1) - 1) *
                            ((self$est_corr()/100)^2) +
                            self$u2_vangel()/self$v()
                    )
                )
            }
            # ------------------ Mahmoudvand-Hassani method -------------------
            self$cn_mh = function(...) {
                # ranked set sampling (RSS) parameter C_n
                if (length(self$x) <= 340) {
                    # gamma() works well with sample sizes less than 340
                    return(
                        sqrt(2/(length(self$x) - 1)) * (
                            (gamma(length(self$x)/2))/(
                                gamma((length(self$x) - 1)/2))
                        )
                    )

                } else {
                    return(
                    # gamma() leads to infinity for sample sizes higher than 340
                    # lgamma() i.e., large gamma is used instead.
                        sqrt(2/(length(self$x) - 1)) * (
                            (lgamma(length(self$x)/2))/(
                                lgamma((length(self$x) - 1)/2))
                        )
                    )
                }
            }
            self$ul_mh = function(...) {
                # RSS u parameter for the lower bound
                return(
                    2 - (
                        self$cn_mh() + (
                            qnorm((self$alpha/2)) * sqrt(1 - self$cn_mh()^2)
                        )
                    )
                )
            }
            self$uu_mh = function(...) {
                # RSS u parameter for the upper bound
                return(
                    2 - (
                        self$cn_mh() - (
                            qnorm((self$alpha/2)) * sqrt(1 - self$cn_mh()^2)
                        )
                    )
                )
            }
            self$lower_tile_mh_cv = function(...) {
                # lower confidence limit for MH method of cv
                return(
                    (self$est()/100)/self$ul_mh()
                )
            }
            self$upper_tile_mh_cv = function(...) {
                # upper confidence limit for MH method of cv
                return(
                    (self$est()/100)/self$uu_mh()
                )
            }
            self$lower_tile_mh_cv_corr = function(...) {
                # lower confidence limit for MH method of corrected cv
                return(
                    (self$est_corr()/100)/self$ul_mh()
                )
            }
            self$upper_tile_mh_cv_corr = function(...) {
                # upper confidence limit for MH method of corrected cv
                return(
                    (self$est_corr()/100)/self$uu_mh()
                )
            }
            # ------------------ Normal Approximation method ------------------
            self$cn_normaapprox = function(...) {
                # Normal Approximation parameter C_n
                return(
                    sqrt(1 - (1/(2 * length(self$x))))
                )
            }
            self$ul_normaapprox = function(...) {
                # Normal Approximation u parameter for the lower bound
                return(
                    self$cn_normaapprox() + (
                        qnorm(
                            1 - (self$alpha/2)
                        ) * sqrt(1 - self$cn_normaapprox()^2)
                    )
                )
            }
            self$uu_normaapprox = function(...) {
                # Normal Approximation u parameter for the upper bound
                return(
                    self$cn_normaapprox() - (
                        qnorm(
                            1 - (self$alpha/2)
                        ) * sqrt(1 - self$cn_normaapprox()^2)
                    )
                )
            }
            self$lower_tile_normaapprox_cv = function(...) {
                # lower confidence limit for Normal Approximation method of cv
                return(
                    (self$est()/100)/self$ul_normaapprox()
                )
            }
            self$upper_tile_normaapprox_cv = function(...) {
                # upper confidence limit for Normal Approximation method of cv
                return(
                    (self$est()/100)/self$uu_normaapprox()
                )
            }
            self$lower_tile_normaapprox_cv_corr = function(...) {
                # lower limit for Normal Approximation method of corrected cv
                return(
                    (self$est_corr()/100)/self$ul_normaapprox()
                )
            }
            self$upper_tile_normaapprox_cv_corr = function(...) {
                # upper limit for Normal Approximation method of corrected cv
                return(
                    (self$est_corr()/100)/self$uu_normaapprox()
                )
            }
            # -------------------- Shortest-Length method ---------------------
            self$a_value = function(...) {
                # a_value of the Shortest-Length interval method
                if ((length(self$x) - 1) <= 300) {
                    return(
                        self$shortest_length %>%
                            subset(
                                al == self$alpha & v == length(self$x) - 1
                                ) %>%
                            dplyr::select(a)
                    )
                } else if ((length(self$x) - 1) > 300) {
                    return(
                        shortest_length %>%
                            subset(
                                al == self$alpha & v == 300
                                ) %>%
                            dplyr::select(a)
                    )
                }
            }
            self$b_value = function(...) {
                # b_value of the Shortest-Length interval method
                if ((length(self$x) - 1) <= 300) {
                    return(
                        self$shortest_length %>%
                            subset(
                                al == self$alpha & v == length(self$x) - 1
                            ) %>%
                            dplyr::select(b)
                    )
                } else if ((length(self$x) - 1) > 300) {
                    return(
                        shortest_length %>%
                            subset(
                                al == self$alpha & v == 300
                            ) %>%
                            dplyr::select(b)
                    )
                }
            }
            self$lower_tile_shortest_cv = function(...) {
                # lower confidence limit for Shortest-Length method of cv
                return(
                    ((self$est()/100)*sqrt(length(self$x) - 1)
                    )/sqrt(self$b_value()$b)
                )
            }
            self$upper_tile_shortest_cv = function(...) {
                # upper confidence limit for Shortest-Length method of cv
                return(
                    ((self$est()/100)*sqrt(length(self$x) - 1)
                     )/sqrt(self$a_value()$a)
                )
            }
            self$lower_tile_shortest_cv_corr = function(...) {
                # lower limit for Shortest-Length method of corrected cv
                return(
                    ((self$est_corr()/100)*sqrt(length(self$x) - 1)
                    )/sqrt(self$b_value()$b)
                )
            }
            self$upper_tile_shortest_cv_corr = function(...) {
                # upper limit for Shortest-Length method of corrected cv
                return(
                    ((self$est_corr()/100)*sqrt(length(self$x) - 1)
                    )/sqrt(self$a_value()$a)
                )
            }
            # ---------------------- Equal-Tailed method ----------------------
            self$t1_equal = function(...) {
                # t1 which is (1-alhpa/2)% percentile of chi-scquare
                return(
                    qchisq(1 - self$alpha/2, self$v())
                )
            }
            self$t2_equal = function(...) {
                # t2 which is (alhpa/2)% percentile of chi-scquare
                return(
                    qchisq(alpha/2, self$v())
                )
            }
            self$lower_tile_equal_cv = function(...) {
                # lower confidence limit for Equal-Tailed method of cv
                return(
                    ((self$est()/100)*sqrt(self$v()))/(sqrt(self$t1_equal()))
                )
            }
            self$upper_tile_equal_cv = function(...) {
                # upper confidence limit for Equal-Tailed method of cv
                return(
                    ((self$est()/100)*sqrt(self$v()))/(sqrt(self$t2_equal()))
                )
            }
            self$lower_tile_equal_cv_corr = function(...) {
                # lower limit for Equal-Tailed method of corrected cv
                return(
                    ((self$est_corr()/100)*sqrt(self$v()))/(
                        sqrt(self$t1_equal())
                        )
                )
            }
            self$upper_tile_equal_cv_corr = function(...) {
                # upper limit for Equal-Tailed method of corrected cv
                return(
                    ((self$est_corr()/100)*sqrt(self$v()))/(sqrt(
                        self$t2_equal())
                        )
                )
            }
            # ----------------------- Bootstrap methods -----------------------
            self$bootcv = function(...) {
                # call grand-parent method of bootstrap for cv
                return(
                    super$super_$initialize(
                        x = self$x,
                        na.rm = self$na.rm,
                        R = self$R,
                        alpha = self$alpha
                    ))
                # invisible(self)
            }
            self$bootcv()
            invisible(self)
        },
        # -------------- public method kelley_ci() i.e., Kelley CI ------------
        kelley_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with Kelley CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                (self$lower_tile_kelley_cv() * 100),
                                digits = self$digits
                            ),
                            upper = round(
                                (self$upper_tile_kelley_cv() * 100),
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with Kelley CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                (self$lower_tile_kelley_cv_corr() * 100),
                                digits = self$digits
                            ),
                            upper = round(
                                (self$upper_tile_kelley_cv_corr() * 100),
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # --------------- public method mckay_ci() i.e., McKay CI -------------
        mckay_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with McKay CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$lower_tile_mckay_cv() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_mckay_cv() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with McKay CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$lower_tile_mckay_cv_corr() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_mckay_cv_corr() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # -------------- public method miller_ci() i.e., Miller CI ------------
        miller_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with Miller CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$lower_tile_miller_cv() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_miller_cv() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with Miller CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$lower_tile_miller_cv_corr() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_miller_cv_corr() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # -------------- public method vangel_ci() i.e., Vangel CI ------------
        vangel_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with Vangel CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$lower_tile_vangel_cv() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_vangel_cv() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with Vangel CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$lower_tile_vangel_cv_corr() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_vangel_cv_corr() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # -------- public method mh_ci() i.e., Mahmoudvand-Hassani CI ---------
        mh_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with Mahmoudvand-Hassani CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$lower_tile_mh_cv() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_mh_cv() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with Mahmoudvand-Hassani CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$lower_tile_mh_cv_corr() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_mh_cv_corr() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # --- public method normaapprox_ci() i.e., Normal Approximation CI ----
        normaapprox_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with Normal Approximation CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$lower_tile_normaapprox_cv() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_normaapprox_cv() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with Normal Approximation CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$lower_tile_normaapprox_cv_corr() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_normaapprox_cv_corr() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # ------- public method shortest_ci() i.e., Shortest-Length CI --------
        shortest_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with Shortest-Length CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$lower_tile_shortest_cv() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_shortest_cv() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with Shortest-Length CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$lower_tile_shortest_cv_corr() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_shortest_cv_corr() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # ----------- public method equal_ci() i.e., Equal-Tailed CI ----------
        equal_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with Equal-Tailed CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$lower_tile_equal_cv() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_equal_cv() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with Equal-Tailed CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$lower_tile_equal_cv_corr() * 100,
                                digits = self$digits
                            ),
                            upper = round(
                                self$upper_tile_equal_cv_corr() * 100,
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # -- public method norm_ci() i.e., bootstrap normal approximation CI --
        norm_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with normal approximation bootstrap CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$boot_norm_ci_cv()$normal[2],
                                digits = self$digits
                            ),
                            upper = round(
                                self$boot_norm_ci_cv()$normal[3],
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                         "corrected cv with normal approximation bootstrap CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$boot_norm_ci_cv_corr()$normal[2],
                                digits = self$digits
                            ),
                            upper = round(
                                self$boot_norm_ci_cv_corr()$normal[3],
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # --------- public method basic_ci() i.e., Basic Bootstrap CI ---------
        basic_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with basic bootstrap CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$boot_basic_ci_cv()$basic[4],
                                digits = self$digits
                            ),
                            upper = round(
                                self$boot_basic_ci_cv()$basic[5],
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with basic bootstrap CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$boot_basic_ci_cv_corr()$basic[4],
                                digits = self$digits
                            ),
                            upper = round(
                                self$boot_basic_ci_cv_corr()$basic[5],
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # ------- public method perc_ci() i.e., Bootstrap Percentile CI -------
        perc_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with bootstrap percentile CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$boot_perc_ci_cv()$percent[4],
                                digits = self$digits
                            ),
                            upper = round(
                                self$boot_perc_ci_cv()$percent[5],
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                            "corrected cv with bootstrap percentile CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$boot_perc_ci_cv_corr()$percent[4],
                                digits = self$digits
                            ),
                            upper = round(
                                self$boot_perc_ci_cv_corr()$percent[5],
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # - public method bca_ci() i.e., Adjusted Bootstrap Percentile (BCa) CI
        bca_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = (
                            "cv with adjusted bootstrap percentile (BCa) CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est(), digits = self$digits),
                            lower = round(
                                self$boot_bca_ci_cv()$bca[4],
                                digits = self$digits
                            ),
                            upper = round(
                                self$boot_bca_ci_cv()$bca[5],
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = (
                    "corrected cv with adjusted bootstrap percentile (BCa) CI"
                        ),
                        statistics = data.frame(
                            est = round(self$est_corr(), digits = self$digits),
                            lower = round(
                                self$boot_bca_ci_cv_corr()$bca[4],
                                digits = self$digits
                            ),
                            upper = round(
                                self$boot_bca_ci_cv_corr()$bca[5],
                                digits = self$digits
                            ),
                            row.names = c(" ")
                        )
                    )
                )
            }
        },
        # --------- public method all_ci() i.e., All Bootstrap CIs ------------
        all_ci = function(...) {
            if (self$correction == FALSE) {
                return(
                    list(
                        method = "All methods",
                        statistics = data.frame(
                            row.names = c(
                                "kelley",  # 1
                                "mckay",  # 2
                                "miller",  # 3
                                "vangel",  # 4
                                "mahmoudvand_hassani",  # 5
                                "equal_tailed",  # 6
                                "shortest_length",  # 7
                                "normal_approximation",  # 8
                                "norm",  # 9
                                "basic",  # 10
                                "perc",  # 11
                                "bca"  # 12
                            ),
                            est = c(
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits),
                                round(self$est(), digits = self$digits)
                            ),
                            lower = c(
                                round(
                                    (self$lower_tile_kelley_cv() * 100),
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_mckay_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_miller_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_vangel_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_mh_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_equal_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_shortest_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_normaapprox_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_norm_ci_cv()$normal[2],
                                    digits = self$digits),
                                round(
                                    self$boot_basic_ci_cv()$basic[4],
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_perc_ci_cv()$percent[4],
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_bca_ci_cv()$bca[4],
                                    digits = self$digits
                                )
                            ),
                            upper = c(
                                round(
                                    (self$upper_tile_kelley_cv() * 100),
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_mckay_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_miller_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_vangel_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_mh_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_equal_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_shortest_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_normaapprox_cv() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_norm_ci_cv()$normal[3],
                                    digits = self$digits),
                                round(
                                    self$boot_basic_ci_cv()$basic[5],
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_perc_ci_cv()$percent[5],
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_bca_ci_cv()$bca[5],
                                    digits = self$digits
                                )
                            ),
                            description = c(
                        "cv with Kelley 95% CI",
                        "cv with McKay 95% CI",
                        "cv with Miller 95% CI",
                        "cv with Vangel 95% CI",
                        "cv with Mahmoudvand-Hassani 95% CI",
                        "cv with Equal-Tailed 95% CI",
                        "cv with Shortest-Length 95% CI",
                        "cv with Normal Approximation 95% CI",
                        "cv with Normal Approximation Bootstrap 95% CI",
                        "cv with Basic Bootstrap 95% CI",
                        "cv with Bootstrap Percentile 95% CI",
                        "cv with Adjusted Bootstrap Percentile (BCa) 95% CI"
                            )
                        )
                    )
                )
            } else {
                return(
                    list(
                        method = "All methods",
                        statistics = data.frame(
                            row.names = c(
                                "kelley",  # 1
                                "mckay",  # 2
                                "miller",  # 3
                                "vangel",  # 4
                                "mahmoudvand_hassani",  # 5
                                "equal_tailed",  # 6
                                "shortest_length",  # 7
                                "normal_approximation",  # 8
                                "norm",  # 9
                                "basic",  # 10
                                "perc",  # 11
                                "bca"  # 12
                            ),
                            est = c(
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits),
                                round(self$est_corr(), digits = self$digits)
                            ),
                            lower = c(
                                round(
                                    (self$lower_tile_kelley_cv_corr() * 100),
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_mckay_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_miller_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_vangel_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_mh_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_equal_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_shortest_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$lower_tile_normaapprox_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_norm_ci_cv_corr()$normal[2],
                                    digits = self$digits),
                                round(
                                    self$boot_basic_ci_cv_corr()$basic[4],
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_perc_ci_cv_corr()$percent[4],
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_bca_ci_cv_corr()$bca[4],
                                    digits = self$digits
                                )
                            ),
                            upper = c(
                                round(
                                    (self$upper_tile_kelley_cv_corr() * 100),
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_mckay_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_miller_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_vangel_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_mh_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_equal_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_shortest_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$upper_tile_normaapprox_cv_corr() * 100,
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_norm_ci_cv_corr()$normal[3],
                                    digits = self$digits),
                                round(
                                    self$boot_basic_ci_cv_corr()$basic[5],
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_perc_ci_cv_corr()$percent[5],
                                    digits = self$digits
                                ),
                                round(
                                    self$boot_bca_ci_cv_corr()$bca[5],
                                    digits = self$digits
                                )
                            ),
                            description = c(
                "Corrected cv with Kelley 95% CI",
                "Corrected cv with McKay 95% CI",
                "Corrected cv with Miller 95% CI",
                "Corrected cv with Vangel 95% CI",
                "Corrected cv with Mahmoudvand-Hassani 95% CI",
                "Corrected cv with Equal-Tailed 95% CI",
                "Corrected cv with Shortest-Length 95% CI",
                "Corrected cv with Normal Approximation 95% CI",
                "Corrected cv with Normal Approximation Bootstrap 95% CI",
                "Corrected cv with Basic Bootstrap 95% CI",
                "Corrected cv with Bootstrap Percentile 95% CI",
                "Corrected cv with Adjusted Bootstrap Percentile (BCa) 95% CI"
                            )
                        )
                    )
                )
            }
        }
    )
)
