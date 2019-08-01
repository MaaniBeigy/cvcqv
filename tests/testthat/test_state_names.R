context("state_names")
test_that(
    desc = "understands the default value of names = TRUE", {
        x = 1:100
        expect_equal(
            attr(SampleQuantiles$new(x)$qx(), "names"), "50%"
        )
    }
)
test_that(
    desc = "understands the user input value of names = TRUE", {
        x = 1:100
        expect_equal(
            attr(
                SampleQuantiles$new(x, probs = 0.70, names = TRUE)$qx(),
                "names"
                ),
            "70%"
        )
    }
)
test_that(
    desc = "understands the user input value of names = FALSE", {
        x = 1:100
        expect_null(
            attr(
                SampleQuantiles$new(x, probs = 0.70, names = FALSE)$qx(),
                "names"
            )
        )
    }
)
