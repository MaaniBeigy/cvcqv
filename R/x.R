#' @title The input numeric vector x example
#' @name x
#' @description The input numeric vector x example
#' @references [1] Bonett, DG., 2006, Confidence interval for a coefficient of
#'                 quartile variation, Computational Statistics & Data Analysis,
#'                 50(11), 2953-7, DOI: \href{http://doi.org/10.1016/j.csda.2005.05.007}{http://doi.org/10.1016/j.csda.2005.05.007}
#' @export
#' @import dplyr SciViews boot R6 utils
NULL
#' @importFrom stats quantile sd qchisq qnorm
#' @importFrom MBESS conf.limits.nct
NULL
x <- c(
    0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
    4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
    )
