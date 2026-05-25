# --------------------------------------------------------------------------- #
#  Kurtosis helpers used by the AA&K (Abu-Shawiesh, Akyuz & Kibria) family
#  of confidence intervals for the coefficient of variation.
#
#  References:
#    Abu-Shawiesh, M. O. A., Akyuz, H. E., & Kibria, B. G. (2019).
#    Performance of Some Confidence Intervals for Estimating the Population
#    Coefficient of Variation under both Symmetric and Skewed Distributions.
#    Statistics, Optimization & Information Computing, 7(2), 277-290.
#    DOI: 10.19139/soic.v7i2.630
#
#  All helpers are package-internal (not exported) and assume that NA values
#  have already been stripped by the caller. They carry `@noRd` so roxygen
#  does NOT generate man pages for them, while still being visible to
#  lintr's static-analysis pass as legitimate package-scope functions.
# --------------------------------------------------------------------------- #

#' Central moment of order k
#'
#' Computes \eqn{m_k = (1/n) \sum_i (x_i - \bar{x})^k}. Matches \eqn{m_2}
#' and \eqn{m_4} in Abu-Shawiesh, Akyuz & Kibria (2019), footer of Eq. 10.
#' No Bessel correction.
#'
#' @keywords internal
#' @noRd
aak_central_moment <- function(x, order) {
  mean((x - mean(x))^order)
}

#' Sample excess kurtosis
#'
#' \eqn{g_2 = m_4 / m_2^2 - 3}; matches the expression for \eqn{g_2} under
#' Abu-Shawiesh, Akyuz & Kibria (2019), footer of Eq. 10.
#'
#' @keywords internal
#' @noRd
aak_g2_excess_kurtosis <- function(x) {
  m_2 <- aak_central_moment(x, 2)
  m_4 <- aak_central_moment(x, 4)
  m_4 / (m_2^2) - 3
}

#' Bias-adjusted kurtosis estimator G_2
#'
#' Abu-Shawiesh, Akyuz & Kibria (2019), Eq. 10:
#' \eqn{G_2 = (n - 1) / ((n - 2)(n - 3)) [(n - 1) g_2 + 6]}.
#'
#' @keywords internal
#' @noRd
aak_g2_bias_corrected <- function(x) {
  n <- length(x)
  if (n < 4) {
    stop("G_2 requires at least 4 observations.")
  }
  g_2 <- aak_g2_excess_kurtosis(x)
  (n - 1) / ((n - 2) * (n - 3)) * ((n - 1) * g_2 + 6)
}

#' Modified kurtosis estimator kappa_e5
#'
#' Abu-Shawiesh, Akyuz & Kibria (2019), Eq. 13:
#' \eqn{kappa_{e5} = ((n + 1) / (n - 1)) G_2 (1 + 5 G_2 / n)}.
#'
#' @keywords internal
#' @noRd
aak_kappa_e5 <- function(x) {
  n <- length(x)
  big_g2 <- aak_g2_bias_corrected(x)
  ((n + 1) / (n - 1)) * big_g2 * (1 + 5 * big_g2 / n)
}

#' Hummel-style adjusted-kurtosis estimator
#'
#' Abu-Shawiesh, Akyuz & Kibria (2019), Eq. 5:
#' \eqn{gamma_hat = [n(n + 1) / ((n - 1)(n - 2)(n - 3))]
#'   \sum (x - \bar{x})^4 / S^4 - 3(n - 1)^2 / ((n - 2)(n - 3))},
#' where \eqn{S} is the Bessel-corrected sample standard deviation
#' (i.e. \code{stats::var(x)} with \code{ddof = 1}).
#'
#' @keywords internal
#' @noRd
aak_gamma_hat_hummel <- function(x, ddof = 1) {
  n <- length(x)
  if (n < 4) {
    stop("gamma_hat requires at least 4 observations.")
  }
  mu <- mean(x)
  sum_fourth <- sum((x - mu)^4)
  sample_var <- stats::var(x) # R's var uses ddof = 1 by default
  if (ddof != 1) {
    sample_var <- sum((x - mu)^2) / (n - ddof)
  }
  first_term <- (n * (n + 1) / ((n - 1) * (n - 2) * (n - 3))) *
    (sum_fourth / (sample_var^2))
  second_term <- 3 * (n - 1)^2 / ((n - 2) * (n - 3))
  first_term - second_term
}
