context("state_x")
test_that(
    desc = "error message is thrown when x is NULL", {
        x = NULL
        expect_error(
            CoefVar$new(x, na.rm = FALSE)$est(),
            "object 'x' not found"
            )
        expect_error(
            CoefQuartVar$new(x, na.rm = FALSE)$est(),
            "object 'x' not found"
        )
        expect_error(
            CoefVarCI$new(x, na.rm = FALSE)$kelley_ci(),
            "object 'x' not found"
        )
        expect_error(
            CoefQuartVarCI$new(x, na.rm = FALSE)$bonett_ci(),
            "object 'x' not found"
        )
        expect_error(
            BootCoefVar$new(x, na.rm = FALSE)$boot_cv(),
            "object 'x' not found"
        )
        expect_error(
            BootCoefQuartVar$new(x, na.rm = FALSE)$boot_cqv(),
            "object 'x' not found"
        )
        expect_error(
            SampleQuantiles$new(x, na.rm = FALSE)$qx(),
            "object 'x' not found"
        )
        expect_error(
            cv_versatile(x, na.rm = FALSE),
            "object 'x' not found"
        )
        expect_error(
            cqv_versatile(x, na.rm = FALSE),
            "object 'x' not found"
        )
    }
)
test_that(
    desc = "error message is thrown when x is missing", {
        expect_error(
            CoefVar$new(na.rm = FALSE)$est(),
            "object 'x' not found"
        )
        expect_error(
            CoefQuartVar$new(na.rm = FALSE)$est(),
            "object 'x' not found"
        )
        expect_error(
            CoefVarCI$new(na.rm = FALSE)$kelley_ci(),
            "object 'x' not found"
        )
        expect_error(
            CoefQuartVarCI$new(na.rm = FALSE)$bonett_ci(),
            "object 'x' not found"
        )
        expect_error(
            BootCoefVar$new(na.rm = FALSE)$boot_cv(),
            "object 'x' not found"
        )
        expect_error(
            BootCoefQuartVar$new(na.rm = FALSE)$boot_cqv(),
            "object 'x' not found"
        )
        expect_error(
            SampleQuantiles$new(na.rm = FALSE)$qx(),
            "object 'x' not found"
        )
        expect_error(
            cv_versatile(na.rm = FALSE),
            "object 'x' not found"
        )
        expect_error(
            cqv_versatile(na.rm = FALSE),
            "object 'x' not found"
        )
    }
)
test_that(
    desc = "error message is thrown when x is NA", {
        x = NA
        expect_error(
            CoefVar$new(x, na.rm = FALSE)$est(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            CoefQuartVar$new(x, na.rm = FALSE)$est(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            CoefVarCI$new(x, na.rm = FALSE)$kelley_ci(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            CoefQuartVarCI$new(x, na.rm = FALSE)$bonett_ci(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            BootCoefVar$new(x, na.rm = FALSE)$boot_cv(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            BootCoefQuartVar$new(x, na.rm = FALSE)$boot_cqv(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            SampleQuantiles$new(x, na.rm = FALSE)$qx(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            cv_versatile(x, na.rm = FALSE),
            "argument is not a numeric vector"
        )
        expect_error(
            cqv_versatile(x, na.rm = FALSE),
            "argument is not a numeric vector"
        )
    }
)
test_that(
    desc = "error message is thrown when x has NA", {
        y = c(NA, 6)
        expect_error(
            CoefVar$new(x = y, na.rm = FALSE)$est(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            CoefQuartVar$new(x = y, na.rm = FALSE)$est(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            CoefVarCI$new(x = y, na.rm = FALSE)$kelley_ci(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            CoefQuartVarCI$new(x = y, na.rm = FALSE)$bonett_ci(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            BootCoefVar$new(x = y, na.rm = FALSE)$boot_cv(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            BootCoefQuartVar$new(x = y, na.rm = FALSE)$boot_cqv(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            SampleQuantiles$new(x = y, na.rm = FALSE)$qx(),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            cv_versatile(x = y, na.rm = FALSE),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
        expect_error(
            cqv_versatile(x = y, na.rm = FALSE),
            "missing values and NaN's not allowed if 'na.rm' is FALSE"
        )
    }
)
test_that(
    desc = "error message is thrown when x is not numeric", {
        y = c("a", "b")
        expect_error(
            CoefVar$new(x = y)$est(),
            "argument is not a numeric vector"
        )
        expect_error(
            CoefQuartVar$new(x = y)$est(),
            "argument is not a numeric vector"
        )
        expect_error(
            CoefVarCI$new(x = y)$kelley_ci(),
            "argument is not a numeric vector"
        )
        expect_error(
            CoefQuartVarCI$new(x = y)$bonett_ci(),
            "argument is not a numeric vector"
        )
        expect_error(
            BootCoefVar$new(x = y)$boot_cv(),
            "argument is not a numeric vector"
        )
        expect_error(
            BootCoefQuartVar$new(x = y)$boot_cqv(),
            "argument is not a numeric vector"
        )
        expect_error(
            SampleQuantiles$new(x = y)$qx(),
            "argument is not a numeric vector"
        )
        expect_error(
            cv_versatile(x = y),
            "argument is not a numeric vector"
        )
        expect_error(
            cqv_versatile(x = y),
            "argument is not a numeric vector"
        )
    }
)
