context("state_SampleQuantiles")
test_that(
    desc = "finds the correct quantiles", {
        x = c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
            )
        expect_equal(
            SampleQuantiles$new(x, probs = 0.61, names = FALSE)$qx(), 5.4
        )
        expect_equal(
            SampleQuantiles$new(x, probs = 0.61, names = FALSE)$eps(),
            2.220446e-14,
            tolerance = 0.001
        )
        expect_equal(
            SampleQuantiles$new(x, names = FALSE)$qx(), 4.5
        )
        expect_equal(
            SampleQuantiles$new(
                x, na.rm = TRUE, digits = 2, probs = 0.95, names = FALSE
                )$qx(),
            7.14
        )
        expect_equal(
            SampleQuantiles$new(
                x, na.rm = TRUE, digits = 2, probs = 0.75, names = FALSE
            )$qx(),
            5.82
        )
    }
)
test_that(
    desc = "detect R6 class", {
        sample_quantile_example <- SampleQuantiles$new(
            x, na.rm = TRUE, digits = 2, probs = 0.75, names = FALSE
        )
        expect_true(
            R6::is.R6(sample_quantile_example)
        )
    }
)
