context("state_BootCoefVar")
test_that(
    desc = "finds the correct bootstraps", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_equal(
            BootCoefVar$new(x)$boot_cv()$statistic(), 57.77352,
            tolerance = 0.00001
        )
        expect_equal(
            BootCoefVar$new(x)$boot_cv_corr()$statistic(), 58.05753,
            tolerance = 0.00001
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_norm_ci_cv()$normal[2] -
                    39.24367
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_norm_ci_cv()$normal[3] -
                    78.14946
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_basic_ci_cv()$basic[4] -
                    38.07423
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_basic_ci_cv()$basic[5] -
                    76.64171
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_perc_ci_cv()$percent[4] -
                    37.20539
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_perc_ci_cv()$percent[5] -
                    76.55577
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_bca_ci_cv()$bca[4] -
                    41.72823
            )/100 < 0.1
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_bca_ci_cv()$bca[5] -
                    82.96899
            )/100 < 0.1
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_norm_ci_cv_corr()$normal[2] -
                    38.67237
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_norm_ci_cv_corr()$normal[3] -
                    80.07603
            )/100 < 0.3
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_basic_ci_cv_corr()$basic[4] -
                    34.87221
            )/100 < 0.3
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_basic_ci_cv_corr()$basic[5] -
                    76.89616
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_perc_ci_cv_corr()$percent[4] -
                    38.0117
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_perc_ci_cv_corr()$percent[5] -
                    79.59805
            )/100 < 0.05
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_bca_ci_cv_corr()$bca[4] -
                    40.62717
            )/100 < 0.3
        )
        expect_true(
            abs(
                BootCoefVar$new(x)$boot_bca_ci_cv_corr()$bca[5] -
                    84.75401
            )/100 < 0.3
        )

    }
)
test_that(
    desc = "detect R6 class", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        cv_x <- BootCoefVar$new(x)
        expect_true(
            R6::is.R6(cv_x)
        )
    }
)
