# --------------------------------------------------------------------------- #
#  Kurtosis helpers used by the AA&K (Abu-Shawiesh, Akyuz & Kibria) family
#  of confidence intervals for the coefficient of variation.
#
#  References:
#    Abu-Shawiesh, M. O. A., Aky, H. E., & Kibria, B. G. (2019).
#    Performance of Some Confidence Intervals for Estimating the Population
#    Coefficient of Variation under both Symmetric and Skewed Distributions.
#    Statistics, Optimization & Information Computing, 7(2), 277-290.
#    DOI: 10.19139/soic.v7i2.630
#
#  All helpers are package-internal (not exported) and assume that NA values
#  have already been stripped by the caller.
# --------------------------------------------------------------------------- #

# central moment m_k = (1/n) * sum((x - mean(x))^k); matches m_2, m_4 in
# Abu-Shawiesh, Aky & Kibria (2019), Eq. 10 footer (no Bessel correction).
.central_moment <- function(x, order) {
    mean((x - mean(x))^order)
}

# Sample excess kurtosis g_2 = m_4 / m_2^2 - 3; matches the expression for
# g_2 under Abu-Shawiesh, Aky & Kibria (2019), Eq. 10 footer.
.g2_excess_kurtosis <- function(x) {
    m_2 <- .central_moment(x, 2)
    m_4 <- .central_moment(x, 4)
    m_4 / (m_2^2) - 3
}

# Bias-adjusted kurtosis estimator G_2 from
# Abu-Shawiesh, Aky & Kibria (2019), Eq. 10:
#     G_2 = (n - 1) / ((n - 2)(n - 3)) * [(n - 1) * g_2 + 6]
.g2_bias_corrected <- function(x) {
    n <- length(x)
    if (n < 4) {
        stop("G_2 requires at least 4 observations.")
    }
    g_2 <- .g2_excess_kurtosis(x)
    (n - 1) / ((n - 2) * (n - 3)) * ((n - 1) * g_2 + 6)
}

# Modified kurtosis estimator kappa_e5 from
# Abu-Shawiesh, Aky & Kibria (2019), Eq. 13:
#     kappa_e5 = ((n + 1) / (n - 1)) * G_2 * (1 + 5 * G_2 / n)
.kappa_e5 <- function(x) {
    n <- length(x)
    big_g2 <- .g2_bias_corrected(x)
    ((n + 1) / (n - 1)) * big_g2 * (1 + 5 * big_g2 / n)
}

# Hummel-style adjusted-kurtosis estimator from
# Abu-Shawiesh, Aky & Kibria (2019), Eq. 5:
#     gamma_hat = [n(n + 1) / ((n - 1)(n - 2)(n - 3))]
#                 * sum((x - mean(x))^4) / S^4
#                 - 3(n - 1)^2 / ((n - 2)(n - 3))
# where S is the Bessel-corrected sample standard deviation (var with ddof=1).
.gamma_hat_hummel <- function(x, ddof = 1) {
    n <- length(x)
    if (n < 4) {
        stop("gamma_hat requires at least 4 observations.")
    }
    mu <- mean(x)
    sum_fourth <- sum((x - mu)^4)
    sample_var <- stats::var(x)  # R's var uses ddof = 1 by default
    if (ddof != 1) {
        sample_var <- sum((x - mu)^2) / (n - ddof)
    }
    first_term <- (n * (n + 1) / ((n - 1) * (n - 2) * (n - 3))) *
        (sum_fourth / (sample_var^2))
    second_term <- 3 * (n - 1)^2 / ((n - 2) * (n - 3))
    first_term - second_term
}
