context("state_aak_ls")

# Infants weights (in grams) data, Abu-Shawiesh, Akyuz & Kibria (2019),
# Section 6.1 (n = 61).
infants_data <- c(
    4960, 5130, 4260, 5160, 4050, 5240, 4350, 4360, 3930, 4410,
    4610, 4102, 3530, 4550, 4460, 2940, 4160, 4110, 4410, 4800,
    5130, 3670, 4550, 4290, 5210, 4950, 5210, 3210, 4030, 3580,
    4360, 4360, 3920, 4050, 4630, 3756, 4382, 4586, 5336, 2828,
    4172, 4256, 4594, 4866, 4784, 4520, 5238, 4320, 5070, 5330,
    3836, 5916, 5010, 4344, 3496, 4148, 4044, 5192, 4368, 4180,
    5044
)

pmi_data <- c(
    5.5, 14.5, 6.0, 5.5, 5.3, 5.8, 11.0, 6.1, 7.0, 14.5,
    10.4, 4.6, 4.3, 7.2, 10.5, 6.5, 3.3, 7.0, 4.1, 6.2,
    10.4, 4.9
)

small_data <- c(
    0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
    4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
)

test_that(
    desc = "AA&K-LS matches paper Table 5 on infants data", {
        # Paper reports (0.1144, 0.1672).
        result <- CoefVarCI$new(
            x = infants_data, alpha = 0.05, digits = 6
        )$aak_ls_ci()
        expect_equal(
            result$statistics$lower / 100, 0.1144, tolerance = 0.005
        )
        expect_equal(
            result$statistics$upper / 100, 0.1672, tolerance = 0.005
        )
    }
)

test_that(
    desc = "AA&K-LS matches paper Table 6 on PMI data", {
        # Paper reports (0.3122, 0.6095).
        result <- CoefVarCI$new(
            x = pmi_data, alpha = 0.05, digits = 6
        )$aak_ls_ci()
        expect_equal(
            result$statistics$lower / 100, 0.3122, tolerance = 0.005
        )
        expect_equal(
            result$statistics$upper / 100, 0.6095, tolerance = 0.005
        )
    }
)

test_that(
    desc = "AA&K-LS bounds bracket the point estimate", {
        result <- CoefVarCI$new(
            x = small_data, digits = 6
        )$aak_ls_ci()
        expect_lt(result$statistics$lower, result$statistics$est)
        expect_gt(result$statistics$upper, result$statistics$est)
    }
)

test_that(
    desc = "AA&K-LS requires at least 4 observations", {
        expect_error(
            CoefVarCI$new(x = c(1.0, 2.0, 3.0))$aak_ls_ci(),
            regexp = "(at least 4|G_2)"
        )
    }
)

test_that(
    desc = "cv_versatile aak_ls matches the R6 method", {
        r6 <- CoefVarCI$new(
            x = small_data, alpha = 0.05, digits = 6
        )$aak_ls_ci()
        proc <- cv_versatile(
            x = small_data, method = "aak_ls", alpha = 0.05, digits = 6
        )
        expect_equal(
            r6$statistics$lower, proc$statistics$lower,
            tolerance = 0.0001
        )
        expect_equal(
            r6$statistics$upper, proc$statistics$upper,
            tolerance = 0.0001
        )
    }
)
