context("state_type")
test_that(
    desc = "understands the default value of type = 7", {
        x = 1:100
        expect_equal(
            SampleQuantiles$new(x)$type, 7
        )
    }
)
test_that(
    desc = "understands the user input value of type", {
        x = 1:100
        expect_equal(
            SampleQuantiles$new(x, type = 8)$type, 8
        )
    }
)
