context("state_alpha")
test_that(
    desc = "understands the default value of alpha = 0.05", {
        x = c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_equal(
            (1 - BootCoefQuartVar$new(x)$boot_basic_ci()$basic[1]), 0.05
        )
        expect_equal(
            (1 - BootCoefVar$new(x)$boot_basic_ci_cv()$basic[1]), 0.05
        )
        expect_equal(
            (1 - CoefQuartVarCI$new(x)$boot_basic_ci()$basic[1]), 0.05
        )
        expect_equal(
            (1 - CoefVarCI$new(x)$boot_basic_ci_cv()$basic[1]), 0.05
        )
        expect_equal(BootCoefQuartVar$new(x)$alpha, 0.05)
        expect_equal(BootCoefVar$new(x)$alpha, 0.05)
        expect_equal(CoefQuartVarCI$new(x)$alpha, 0.05)
        expect_equal(CoefVarCI$new(x)$alpha, 0.05)
        expect_equal(formals(cv_versatile)$alpha, 0.05)
    }
)
test_that(
    desc = "understands the user input value of alpha", {
        x = c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_equal(
            (1 - BootCoefQuartVar$new(
                x, alpha = 0.025
                )$boot_basic_ci()$basic[1]),
            0.025
        )
        expect_equal(
            (1 - BootCoefVar$new(
                x, alpha = 0.025)$boot_basic_ci_cv()$basic[1]),
            0.025
        )
        expect_equal(
            (1 - CoefQuartVarCI$new(
                x, alpha = 0.025)$boot_basic_ci()$basic[1]),
            0.025
        )
        expect_equal(
            (1 - CoefVarCI$new(
                x, alpha = 0.025)$boot_basic_ci_cv()$basic[1]),
            0.025
        )
        expect_equal(BootCoefQuartVar$new(x, alpha = 0.025)$alpha, 0.025)
        expect_equal(BootCoefVar$new(x, alpha = 0.025)$alpha, 0.025)
        expect_equal(CoefQuartVarCI$new(x, alpha = 0.025)$alpha, 0.025)
        expect_equal(CoefVarCI$new(x, alpha = 0.025)$alpha, 0.025)
    }
)
