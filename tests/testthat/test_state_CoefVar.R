context("state_CoefVar")
test_that(
    desc = "finds the correct cv", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        cv_x <- CoefVar$new(x, digits = 2)
        expect_equal(
            cv_x$est(), 57.77,
            tolerance = 0.0001
        )
        expect_equal(
            cv_x$est_corr(), 58.05,
            tolerance = 0.0001
        )
    }
)
test_that(
    desc = "detect R6 class", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        cv_x <- CoefVar$new(x, digits = 2)
        expect_true(
            R6::is.R6(cv_x)
        )
    }
)
