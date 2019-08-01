context("state_R")
test_that(
    desc = "understands the default value of R = 1000", {
        x = c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_equal(
            (BootCoefQuartVar$new(x)$boot_cqv()$R), 1000
        )
        expect_equal(
            (BootCoefVar$new(x)$boot_cv()$R), 1000
        )
        expect_equal(
            (CoefQuartVarCI$new(x)$boot_cqv()$R), 1000
        )
        expect_equal(
            (CoefVarCI$new(x)$boot_cv()$R), 1000
        )
        expect_equal(BootCoefQuartVar$new(x)$R, 1000)
        expect_equal(BootCoefVar$new(x)$R, 1000)
        expect_equal(CoefQuartVarCI$new(x)$R, 1000)
        expect_equal(CoefVarCI$new(x)$R, 1000)
        expect_null(formals(cv_versatile)$R)
        expect_null(formals(cqv_versatile)$R)
    }
)
test_that(
    desc = "understands the user input value of R", {
        x = c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_equal(
            (BootCoefQuartVar$new(x, R = 100)$boot_cqv()$R), 100
        )
        expect_equal(
            (BootCoefVar$new(x, R = 100)$boot_cv()$R), 100
        )
        expect_equal(
            (CoefQuartVarCI$new(x, R = 100)$boot_cqv()$R), 100
        )
        expect_equal(
            (CoefVarCI$new(x, R = 100)$boot_cv()$R), 100
        )
        expect_equal(BootCoefQuartVar$new(x, R = 100)$R, 100)
        expect_equal(BootCoefVar$new(x, R = 100)$R, 100)
        expect_equal(CoefQuartVarCI$new(x, R = 100)$R, 100)
        expect_equal(CoefVarCI$new(x, R = 100)$R, 100)
    }
)
