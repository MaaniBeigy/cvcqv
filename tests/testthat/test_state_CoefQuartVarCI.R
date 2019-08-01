context("state_CoefQuartVarCI")
test_that(
    desc = "finds the correct findings", {
        x <- c(
        0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
        4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_equal(
            CoefQuartVarCI$new(x)$zzz(),
            1.832024,
            tolerance = 0.000001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$f1square(),
            0.01398464,
            tolerance = 0.00000001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$f3square(),
            0.04355077,
            tolerance = 0.00000001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$D(),
            3.6,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$S(),
            8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$v(),
            0.09819588,
            tolerance = 0.00000001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$ccc(),
            1.052632,
            tolerance = 0.000001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$bonett_ci()$method,
            "cqv with Bonett CI"
        )
        expect_equal(
            CoefQuartVarCI$new(x)$bonett_ci()$statistics$est,
            45,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$bonett_ci()$statistics$lower,
            24.3,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$bonett_ci()$statistics$upper,
            76.6,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVarCI$new(x)$norm_ci()$method,
            "cqv with normal approximation bootstrap CI"
        )
        expect_equal(
            CoefQuartVarCI$new(x)$norm_ci()$statistics$est,
            45,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefQuartVarCI$new(x)$norm_ci()$statistics$lower -
                    CoefQuartVarCI$new(x)$boot_norm_ci()$normal[2]
            )/100 < 0.05
        )
        expect_true(
            abs(
                CoefQuartVarCI$new(x)$norm_ci()$statistics$upper -
                    CoefQuartVarCI$new(x)$boot_norm_ci()$normal[3]
            )/100 < 0.05
        )
        expect_equal(
            CoefQuartVarCI$new(x)$basic_ci()$method,
            "cqv with basic bootstrap CI"
        )
        expect_equal(
            CoefQuartVarCI$new(x)$basic_ci()$statistics$est,
            45,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefQuartVarCI$new(x)$basic_ci()$statistics$lower -
                    CoefQuartVarCI$new(x)$boot_basic_ci()$basic[4]
            )/100 < 0.3
        )
        expect_true(
            abs(
                CoefQuartVarCI$new(x)$basic_ci()$statistics$upper -
                    CoefQuartVarCI$new(x)$boot_basic_ci()$basic[5]
            )/100 < 0.3
        )
        expect_equal(
            CoefQuartVarCI$new(x)$perc_ci()$method,
            "cqv with bootstrap percentile CI"
        )
        expect_equal(
            CoefQuartVarCI$new(x)$perc_ci()$statistics$est,
            45,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefQuartVarCI$new(x)$perc_ci()$statistics$lower -
                    CoefQuartVarCI$new(x)$boot_perc_ci()$percent[4]
            )/100 < 0.05
        )
        expect_true(
            abs(
                CoefQuartVarCI$new(x)$perc_ci()$statistics$upper -
                    CoefQuartVarCI$new(x)$boot_perc_ci()$percent[5]
            )/100 < 0.05
        )
        expect_equal(
            CoefQuartVarCI$new(x)$bca_ci()$method,
            "cqv with adjusted bootstrap percentile (BCa) CI"
        )
        expect_equal(
            CoefQuartVarCI$new(x)$bca_ci()$statistics$est,
            45,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefQuartVarCI$new(x)$bca_ci()$statistics$lower -
                    CoefQuartVarCI$new(x)$boot_bca_ci()$bca[4]
            )/100 < 0.3
        )
        expect_true(
            abs(
                CoefQuartVarCI$new(x)$bca_ci()$statistics$upper -
                    CoefQuartVarCI$new(x)$boot_bca_ci()$bca[5]
            )/100 < 0.3
        )
        expect_equal(
            CoefQuartVarCI$new(x)$all_ci()$method,
            "All methods"
        )
        expect_equal(
            nrow(CoefQuartVarCI$new(x)$all_ci()$statistics),
            5
        )
        expect_equal(
            ncol(CoefQuartVarCI$new(x)$all_ci()$statistics),
            4
        )
    }
)
test_that(
    desc = "detect R6 class", {
        y <- c(
        0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
        4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        cqv_y <- CoefQuartVarCI$new(
            x = y,
            alpha = 0.05,
            R = 1000,
            digits = 2
        )
        expect_true(
            R6::is.R6(cqv_y)
        )
    }
)
