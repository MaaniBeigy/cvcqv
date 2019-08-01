context("state_probs")
test_that(
    desc = "understands the default values", {
        x = 1:100
        expect_equal(
            SampleQuantiles$new(x)$probs, 0.5
        )
    }
)
test_that(
    desc = "understands the user input of probs", {
        x = 1:100
        expect_equal(
            SampleQuantiles$new(x, probs = 0.61)$probs, 0.61
        )
    }
)
test_that(
    desc = "understands the user input below 0", {
        x = 1:100
        expect_error(
            SampleQuantiles$new(x, probs = -0.001)$qx(),
            "probs outside \\[0\\,1\\]"
        )
    }
)
test_that(
    desc = "understands the user input above 1", {
        x = 1:100
        expect_error(
            SampleQuantiles$new(x, probs = 1.001)$qx(),
            "probs outside \\[0\\,1\\]"
        )
    }
)
test_that(
    desc = "understands the tolerance of below 0 and -2e-14", {
        x = 1:100
        expect_equal(
            SampleQuantiles$new(
                x,
                probs = -2.220446e-14
                )$probs,
            0
        )
    }
)
test_that(
    desc = "understands the tolerance of above 1 and 1+2e-14", {
        x = 1:100
        expect_equal(
            SampleQuantiles$new(
                x,
                probs = (1 + 2.220446e-14)
            )$probs,
            1
        )
    }
)

