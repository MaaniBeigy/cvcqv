context("state_cqv_versatile")
test_that(
    desc = "check if 0.75 percentile is zero to avoid NANs", {
        x = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 1771L, 0L, 0L, 106L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 84L, 168L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 124L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 127L, 0L, 0L, 0L, 100L, 0L,
              0L, 0L, 0L, 0L, 104L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 554L, 1174L, 0L, 0L, 0L, 0L, 8L, 0L, 0L, 0L, 0L, 263L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 2L, 130L, 0L, 0L, 0L, 272L, 0L, 0L, 0L, 0L, 42L,
              0L, 0L, 130L, 0L, 0L, 0L, 0L, 0L, 9L, 0L, 0L, 2L, 0L, 0L, 0L,
              0L, 0L, 826L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 231L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 177L, 0L, 550L, 0L, 0L, 0L, 0L, 9L, 531L, 0L,
              152L, 0L, 347L, 0L, 0L, 0L, 0L, 827L, 290L, 0L, 0L, 0L, 525L,
              0L, 0L, 122L, 0L, 0L, 0L, 546L, 0L, 10L, 0L, 0L, 0L, 81L, 5L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 53L, 0L, 0L, 0L, 0L, 0L, 241L, 0L, 0L, 261L, 0L, 0L,
              0L, 0L, 211L, 263L, 588L, 0L, 0L, 197L, 0L, 63L, 0L, 0L, 0L,
              0L, 0L, 297L, 0L, 177L, 0L, 0L, 0L, 0L, 5L, 203L, 139L, 73L,
              0L, 47L, 19L, 0L, 0L, 0L, 0L, 0L, 243L, 0L, 0L, 0L, 0L, 0L, 110L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 12L, 110L, 1217L, 386L, 0L, 600L,
              0L, 574L, 0L, 131L, 103L, 0L, 0L, 0L, 0L, 0L, 50L, 565L, 0L,
              0L, 0L, 1961L, 15L, 304L, 0L, 389L, 133L, 585L, 0L, 0L, 0L, 0L,
              0L, 240L, 12L, 0L, 0L, 119L, 21L, 0L, 717L, 0L, 729L, 0L, 1L,
              0L, 0L, 0L, 0L, 0L, 41L, 0L, 0L, 0L, 176L, 0L, 0L, 0L, 0L, 26L,
              322L, 0L, 0L, 37L, 0L, 528L, 271L, 0L, 0L, 0L, 0L, 127L, 0L,
              0L, 0L, 43L, 290L, 0L, 0L, 22L, 52L, 0L, 57L, 112L, 0L, 29L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1235L, 0L, 0L, 0L, 3131L,
              0L, 0L, 0L, 0L, 0L, 0L, 284L, 0L, 610L, 760L, 937L, 0L, 0L, 1176L,
              0L, 160L, 1463L, 0L, 607L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              44L, 0L, 0L, 0L, 0L, 0L, 0L, 1423L, 0L, 618L, 0L, 927L, 0L, 0L,
              0L, 0L, 483L, 111L, 805L, 0L, 0L, 0L, 356L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 954L, 0L, 845L, 0L, 182L, 475L, 328L, 0L, 0L, 0L,
              256L, 0L, 1126L, 0L, 422L, 0L, 0L, 0L, 0L, 0L, 501L, 0L, 0L,
              212L, 4299L, 4096L, 2148L, 12059L, 3945L, 4254L, 978L, 1406L,
              3500L, 1573L, 4207L, 1168L, 3153L, 3028L, 3155L, 1260L, 2469L,
              522L, 2313L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 836L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 49L, 1176L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L)
        randstring <- function(n = 5000) {
            a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
            paste0(
                a, sprintf("%04d", sample(9999, n, TRUE)),
                sample(LETTERS, n, TRUE)
                )
        }
        expect_true(
            quantile(x, probs = 0.75) == 0
        )
        expect_warning(
            cqv_versatile(x),
            "cqv is NaN because q3 and q1 are 0, max was used instead of q3"
        )
        expect_equal(
            cqv_versatile(x)$statistic$est,
            100
        )
        expect_equal(
            cqv_versatile(x)$method,
            "cqv = (q3-q1)/(q3+q1)"
        )
        expect_equal(
            cqv_versatile(x, method = "bonett")$method,
            "cqv with Bonett 95% CI"
        )
        expect_equal(
            cqv_versatile(x, method = "bonett")$statistic$est,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "bonett")$statistic$lower,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "bonett")$statistic$upper,
            100
        )
        expect_warning(
            cqv_versatile(x, method = "bonett"),
"All values of t are equal to  100 \n Cannot calculate confidence intervals \n"
        )
        expect_equal(
            cqv_versatile(x, method = "norm", R = 10)$method,
            "cqv with Bonett 95% CI"
        )
        expect_equal(
            cqv_versatile(x, method = "norm", R = 10)$statistic$est,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "norm", R = 10)$statistic$lower,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "norm", R = 10)$statistic$upper,
            100
        )
        expect_warning(
            cqv_versatile(x, method = "norm", R = 10),
"All values of t are equal to  100 \n Cannot calculate confidence intervals \n"
        )
        expect_equal(
            cqv_versatile(x, method = "basic", R = 10)$method,
            "cqv with Bonett 95% CI"
        )
        expect_equal(
            cqv_versatile(x, method = "basic", R = 10)$statistic$est,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "basic", R = 10)$statistic$lower,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "basic", R = 10)$statistic$upper,
            100
        )
        expect_warning(
            cqv_versatile(x, method = "basic", R = 10),
"All values of t are equal to  100 \n Cannot calculate confidence intervals \n"
        )
        expect_equal(
            cqv_versatile(x, method = "perc", R = 10)$method,
            "cqv with Bonett 95% CI"
        )
        expect_equal(
            cqv_versatile(x, method = "perc", R = 10)$statistic$est,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "perc", R = 10)$statistic$lower,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "perc", R = 10)$statistic$upper,
            100
        )
        expect_warning(
            cqv_versatile(x, method = "perc", R = 10),
"All values of t are equal to  100 \n Cannot calculate confidence intervals \n"
        )
        expect_equal(
            cqv_versatile(x, method = "bca", R = 10)$method,
            "cqv with Bonett 95% CI"
        )
        expect_equal(
            cqv_versatile(x, method = "bca", R = 10)$statistic$est,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "bca", R = 10)$statistic$lower,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "bca", R = 10)$statistic$upper,
            100
        )
        expect_warning(
            cqv_versatile(x, method = "bca", R = 10),
"All values of t are equal to  100 \n Cannot calculate confidence intervals \n"
        )
        expect_equal(
            cqv_versatile(x, method = "all", R = 10)$method,
            "cqv with Bonett 95% CI"
        )
        expect_equal(
            cqv_versatile(x, method = "all", R = 10)$statistic$est,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "all", R = 10)$statistic$lower,
            100
        )
        expect_equal(
            cqv_versatile(x, method = "all", R = 10)$statistic$upper,
            100
        )
        expect_warning(
            cqv_versatile(x, method = "all"),
"All values of t are equal to  100 \n Cannot calculate confidence intervals \n"
        )
        expect_error(
            cqv_versatile(x, method = randstring(1)),
            "method for confidence interval is not available"
        )
    }
)
context("state_cqv_versatile")
test_that(
    desc = "check if 0.75 percentile is non-zero to avoid NANs", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_true(
            quantile(x, probs = 0.75) != 0
        )
        expect_equal(
            cqv_versatile(x)$statistic$est,
            45.6
        )
        expect_equal(
            cqv_versatile(x)$method,
            "cqv = (q3-q1)/(q3+q1)"
        )
        expect_equal(
            cqv_versatile(x, method = "bonett")$statistic$lower,
            24.8,
            tolerance = 0.0001
        )
        expect_equal(
            cqv_versatile(x, method = "bonett")$statistic$upper,
            77.3,
            tolerance = 0.0001
        )
        expect_equal(
            cqv_versatile(x, method = "norm", R = 10)$statistic$est,
            45.6
        )
        expect_equal(
            cqv_versatile(x, method = "norm", R = 10)$method,
            "cqv with normal approximation 95% CI"
        )
        expect_true(
            abs(
                cqv_versatile(x, method = "norm")$statistic$lower - 19.5
            )/100 < 0.05
        )
        expect_true(
            abs(
            cqv_versatile(x, method = "norm")$statistic$upper - 71
            )/100 < 0.05
        )
        expect_equal(
            cqv_versatile(x, method = "basic")$statistic$est,
            45.6
        )
        expect_equal(
            cqv_versatile(x, method = "basic")$method,
            "cqv with basic bootstrap 95% CI"
        )
        expect_true(
            abs(
                cqv_versatile(x, method = "basic")$statistic$lower - 19.7
            )/100 < 0.05
        )
        expect_true(
            abs(
                cqv_versatile(x, method = "basic")$statistic$upper - 73.5
            )/100 < 0.05
        )
        expect_equal(
            cqv_versatile(x, method = "perc")$statistic$est,
            45.6
        )
        expect_equal(
            cqv_versatile(x, method = "perc")$method,
            "cqv with bootstrap percentile 95% CI"
        )
        expect_true(
            abs(
                cqv_versatile(x, method = "perc")$statistic$lower - 17.3
            )/100 < 0.05
        )
        expect_true(
            abs(
                cqv_versatile(x, method = "perc")$statistic$upper - 67.9
            )/100 < 0.05
        )
        expect_equal(
            cqv_versatile(x, method = "bca")$statistic$est,
            45.6
        )
        expect_equal(
            cqv_versatile(x, method = "bca")$method,
            "cqv with adjusted bootstrap percentile (BCa) 95% CI"
        )
        expect_true(
            abs(
                cqv_versatile(x, method = "bca")$statistic$lower - 20.7
            )/100 < 0.3
        )
        expect_true(
            abs(
                cqv_versatile(x, method = "bca")$statistic$upper - 76.5
            )/100 < 0.3
        )
        expect_equal(
            cqv_versatile(
                x,
                method = "all"
            )$method,
            "All methods"
        )
        expect_equal(
            nrow(cqv_versatile(
                x,
                method = "all"
            )$statistics),
            5
        )
        expect_equal(
            ncol(cqv_versatile(
                x,
                method = "all"
            )$statistics),
            4
        )
    }
)
