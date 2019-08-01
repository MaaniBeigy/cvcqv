context("state_na_rm")
test_that(
    desc = "understands the default value of na.rm = FALSE", {
        x = 1:10
        expect_false(
            CoefVar$new(x)$na.rm
        )
        expect_false(
            CoefQuartVar$new(x)$na.rm
        )
        expect_false(
            CoefVarCI$new(x)$na.rm
        )
        expect_false(
            CoefQuartVarCI$new(x)$na.rm
        )
        expect_false(
            BootCoefVar$new(x)$na.rm
        )
        expect_false(
            BootCoefQuartVar$new(x)$na.rm
        )
        expect_false(
            SampleQuantiles$new(x)$na.rm
        )
        expect_false(
            formals(cv_versatile)$na.rm
        )
        expect_false(
            formals(cqv_versatile)$na.rm
        )
    }
)
test_that(
    desc = "understands the user input of na.rm = TRUE", {
        y = c(1, 2.6, 10, NA, 6.8, NA)
        expect_true(
            CoefVar$new(x = y, na.rm = TRUE)$na.rm
        )
        expect_equal(
            CoefVar$new(x = y, na.rm = TRUE)$est(), 80
        )
        expect_true(
            CoefQuartVar$new(x = y, na.rm = TRUE)$na.rm
        )
        expect_equal(
            CoefQuartVar$new(x = y, na.rm = TRUE)$est(), 55.1
        )
        expect_true(
            CoefVarCI$new(x = y, na.rm = TRUE)$na.rm
        )
        expect_equal(
            CoefVarCI$new(x = y, na.rm = TRUE)$kelley_ci()$statistics$est, 80
        )
        expect_true(
            CoefQuartVarCI$new(x = y, na.rm = TRUE)$na.rm
        )
        expect_equal(
            CoefQuartVarCI$new(x = y, na.rm = TRUE)$norm_ci()$statistics$est,
            55.1
        )
        expect_true(
            BootCoefVar$new(x = y, na.rm = TRUE)$na.rm
        )
        expect_equal(
            mean(BootCoefVar$new(x = y, na.rm = TRUE)$boot_cv()$data), 5.1
        )
        expect_true(
            BootCoefQuartVar$new(x = y, na.rm = TRUE)$na.rm
        )
        expect_equal(
            BootCoefQuartVar$new(x = y, na.rm = TRUE)$boot_cqv()$t0, 55.10204
        )
        expect_true(
            SampleQuantiles$new(x = y, na.rm = TRUE)$na.rm
        )
        expect_equal(
            SampleQuantiles$new(y, na.rm = TRUE, names = FALSE)$qx(), 4.7
        )
        expect_equal(
            cv_versatile(y, na.rm = TRUE, method = "kelley")$statistics$est, 80
        )
        expect_equal(
            cqv_versatile(y, na.rm = TRUE, method = "bonett")$statistics$est,
            55.1
        )
    }
)
test_that(
    desc = "correct missing handling when x is data.frame", {
        df <- data.frame(
            id = c(1:3, NA),
            gender = c("m", "f", "m", NA),
            fbs = c(104, 98, 129, NA)
        )
    }
)
