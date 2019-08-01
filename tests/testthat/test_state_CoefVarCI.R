context("state_CoefVarCI")
test_that(
    desc = "understands the default value of correction = FALSE", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_false(
            CoefVarCI$new(x)$correction
        )
    }
)
test_that(
    desc = "understands the user input value of correction = TRUE", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_true(
            CoefVarCI$new(x, correction = TRUE)$correction
        )
    }
)
test_that(
    desc = "understands the user input value of correction = FALSE", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_false(
            CoefVarCI$new(x, correction = FALSE)$correction
        )
    }
)
test_that(
    desc = "finds the correct findings", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_equal(
            CoefVarCI$new(x)$ncp_cv(),
            7.737259,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$ncp_cv_corr(),
            7.697308,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$v(),
            19
        )
        expect_equal(
            CoefVarCI$new(x)$kelley_nctci_cv()$Lower.Limit,
            4.565712,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$kelley_nctci_cv()$Upper.Limit,
            10.82754,
            tolerance = 0.00001
        )
        expect_equal(
            CoefVarCI$new(x)$kelley_nctci_cv_corr()$Lower.Limit,
            4.535534,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$kelley_nctci_cv_corr()$Upper.Limit,
            10.77774,
            tolerance = 0.00001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_kelley_cv(),
            0.4130336,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_kelley_cv(),
            0.9795047,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_kelley_cv_corr(),
            0.4149419,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_kelley_cv_corr(),
            0.9860219,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$t1_mckay(),
            1.72907,
            tolerance = 0.00001
        )
        expect_equal(
            CoefVarCI$new(x)$t2_mckay(),
            0.468764,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$u1_mckay(),
            32.85233,
            tolerance = 0.00001
        )
        expect_equal(
            CoefVarCI$new(x)$u2_mckay(),
            8.906516,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_mckay_cv(),
            0.4145785,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_mckay_cv(),
            1.085637,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_mckay_cv_corr(),
            0.416491,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_mckay_cv_corr(),
            1.095004,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$z_miller(),
            1.959964,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$u_miller_cv(),
            0.1211033,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$u_miller_cv_corr(),
            0.1219853,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$zu_miller_cv(),
            0.2373581,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$zu_miller_cv_corr(),
            0.2390868,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_miller_cv(),
            0.3406419,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_miller_cv(),
            0.8153581,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_miller_cv_corr(),
            0.3419132,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_miller_cv_corr(),
            0.8200868,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$t1_vangel(),
            1.72907,
            tolerance = 0.00001
        )
        expect_equal(
            CoefVarCI$new(x)$t2_vangel(),
            0.468764,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$u1_vangel(),
            32.85233,
            tolerance = 0.00001
        )
        expect_equal(
            CoefVarCI$new(x)$u2_vangel(),
            8.906516,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_vangel_cv(),
            0.4128085,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_vangel_cv(),
            1.054997,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_vangel_cv_corr(),
            0.4146965,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_vangel_cv_corr(),
            1.063586,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$cn_mh(),
            0.9869343,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$ul_mh(),
            1.328862,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$uu_mh(),
            0.6972697,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_mh_cv(),
            0.4349587,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_mh_cv(),
            0.8289476,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_mh_cv_corr(),
            0.4372163,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_mh_cv_corr(),
            0.8332501,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$cn_normaapprox(),
            0.9874209,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$ul_normaapprox(),
            1.297318,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$uu_normaapprox(),
            0.6775234,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_normaapprox_cv(),
            0.4455344,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_normaapprox_cv(),
            0.8531071,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_normaapprox_cv_corr(),
            0.4478469,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_normaapprox_cv_corr(),
            0.857535,
            tolerance = 0.000001
        )
        expect_equal(
            unname(CoefVarCI$new(x)$a_value()$a),
            9.6629,
            tolerance = 0.0001
        )
        expect_equal(
            unname(CoefVarCI$new(x)$b_value()$b),
            35.9266,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_shortest_cv(),
            0.420336,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_shortest_cv(),
            0.810496,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_shortest_cv_corr(),
            0.4225177,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_shortest_cv_corr(),
            0.8147028,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$t1_equal(),
            32.85233,
            tolerance = 0.00001
        )
        expect_equal(
            CoefVarCI$new(x)$t2_equal(),
            8.906516,
            tolerance = 0.000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_equal_cv(),
            0.4395634,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_equal_cv(),
            0.8442104,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$lower_tile_equal_cv_corr(),
            0.4418449,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x)$upper_tile_equal_cv_corr(),
            0.8485921,
            tolerance = 0.0000001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$kelley_ci()$method,
            "cv with Kelley CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$kelley_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$kelley_ci()$statistics$lower,
            41.3,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$kelley_ci()$statistics$upper,
            98,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$kelley_ci()$method,
            "corrected cv with Kelley CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$kelley_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$kelley_ci()$statistics$lower,
            41.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$kelley_ci()$statistics$upper,
            98.6,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$mckay_ci()$method,
            "cv with McKay CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$mckay_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$mckay_ci()$statistics$lower,
            41.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$mckay_ci()$statistics$upper,
            108.6,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$mckay_ci()$method,
            "corrected cv with McKay CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$mckay_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$mckay_ci()$statistics$lower,
            41.6,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$mckay_ci()$statistics$upper,
            109.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$miller_ci()$method,
            "cv with Miller CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$miller_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$miller_ci()$statistics$lower,
            34.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$miller_ci()$statistics$upper,
            81.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$miller_ci()$method,
            "corrected cv with Miller CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$miller_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$miller_ci()$statistics$lower,
            34.2,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$miller_ci()$statistics$upper,
            82,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$vangel_ci()$method,
            "cv with Vangel CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$vangel_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$vangel_ci()$statistics$lower,
            41.3,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$vangel_ci()$statistics$upper,
            105.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$vangel_ci()$method,
            "corrected cv with Vangel CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$vangel_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$vangel_ci()$statistics$lower,
            41.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$vangel_ci()$statistics$upper,
            106.4,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$mh_ci()$method,
            "cv with Mahmoudvand-Hassani CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$mh_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$mh_ci()$statistics$lower,
            43.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$mh_ci()$statistics$upper,
            82.9,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$mh_ci()$method,
            "corrected cv with Mahmoudvand-Hassani CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$mh_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$mh_ci()$statistics$lower,
            43.7,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$mh_ci()$statistics$upper,
            83.3,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$normaapprox_ci()$method,
            "cv with Normal Approximation CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
                )$normaapprox_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
                )$normaapprox_ci()$statistics$lower,
            44.6,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
                )$normaapprox_ci()$statistics$upper,
            85.3,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
                )$normaapprox_ci()$method,
            "corrected cv with Normal Approximation CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
                )$normaapprox_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
                )$normaapprox_ci()$statistics$lower,
            44.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
                )$normaapprox_ci()$statistics$upper,
            85.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$shortest_ci()$method,
            "cv with Shortest-Length CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$shortest_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$shortest_ci()$statistics$lower,
            42,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$shortest_ci()$statistics$upper,
            81,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$shortest_ci()$method,
            "corrected cv with Shortest-Length CI"
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$shortest_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$shortest_ci()$statistics$lower,
            42.3,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$shortest_ci()$statistics$upper,
            81.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$equal_ci()$method,
            "cv with Equal-Tailed CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
            )$equal_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
            )$equal_ci()$statistics$lower,
            44,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
            )$equal_ci()$statistics$upper,
            84.4,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$equal_ci()$method,
            "corrected cv with Equal-Tailed CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$equal_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$equal_ci()$statistics$lower,
            44.2,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$equal_ci()$statistics$upper,
            84.9,
            tolerance = 0.0001
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$norm_ci()$method,
            "cv with normal approximation bootstrap CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
            )$norm_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = FALSE
                )$norm_ci()$statistics$lower -
                    CoefVarCI$new(
                        x, correction = FALSE
                    )$boot_norm_ci_cv()$normal[2]
            )/100 < 0.05
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = FALSE
                )$norm_ci()$statistics$upper -
                    CoefVarCI$new(
                        x, correction = FALSE
                    )$boot_norm_ci_cv()$normal[3]
            )/100 < 0.05
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$norm_ci()$method,
            "corrected cv with normal approximation bootstrap CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$norm_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = TRUE
                )$norm_ci()$statistics$lower -
                    CoefVarCI$new(
                        x, correction = TRUE
                    )$boot_norm_ci_cv_corr()$normal[2]
            )/100 < 0.05
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = TRUE
                )$norm_ci()$statistics$upper -
                    CoefVarCI$new(
                        x, correction = TRUE
                    )$boot_norm_ci_cv_corr()$normal[3]
            )/100 < 0.05
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$basic_ci()$method,
            "cv with basic bootstrap CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
            )$basic_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = FALSE
                )$basic_ci()$statistics$lower -
                    CoefVarCI$new(
                        x, correction = FALSE
                    )$boot_basic_ci_cv()$basic[4]
            )/100 < 0.05
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = FALSE
                )$basic_ci()$statistics$upper -
                    CoefVarCI$new(
                        x, correction = FALSE
                    )$boot_basic_ci_cv()$basic[5]
            )/100 < 0.05
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$basic_ci()$method,
            "corrected cv with basic bootstrap CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$basic_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = TRUE
                )$basic_ci()$statistics$lower -
                    CoefVarCI$new(
                        x, correction = TRUE
                    )$boot_basic_ci_cv_corr()$basic[4]
            )/100 < 0.05
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = TRUE
                )$basic_ci()$statistics$upper -
                    CoefVarCI$new(
                        x, correction = TRUE
                    )$boot_basic_ci_cv_corr()$basic[5]
            )/100 < 0.05
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$perc_ci()$method,
            "cv with bootstrap percentile CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
            )$perc_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = FALSE
                )$perc_ci()$statistics$lower -
                    CoefVarCI$new(
                        x, correction = FALSE
                    )$boot_perc_ci_cv()$percent[4]
            )/100 < 0.05
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = FALSE
                )$perc_ci()$statistics$upper -
                    CoefVarCI$new(
                        x, correction = FALSE
                    )$boot_perc_ci_cv()$percent[5]
            )/100 < 0.05
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$perc_ci()$method,
            "corrected cv with bootstrap percentile CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$perc_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = TRUE
                )$perc_ci()$statistics$lower -
                    CoefVarCI$new(
                        x, correction = TRUE
                    )$boot_perc_ci_cv_corr()$percent[4]
            )/100 < 0.05
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = TRUE
                )$perc_ci()$statistics$upper -
                    CoefVarCI$new(
                        x, correction = TRUE
                    )$boot_perc_ci_cv_corr()$percent[5]
            )/100 < 0.05
        )
        expect_equal(
            CoefVarCI$new(x, correction = FALSE)$bca_ci()$method,
            "cv with adjusted bootstrap percentile (BCa) CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = FALSE
            )$bca_ci()$statistics$est,
            57.8,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = FALSE
                )$bca_ci()$statistics$lower -
                    CoefVarCI$new(
                        x, correction = FALSE
                    )$boot_bca_ci_cv()$bca[4]
            )/100 < 0.3
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = FALSE
                )$bca_ci()$statistics$upper -
                    CoefVarCI$new(
                        x, correction = FALSE
                    )$boot_bca_ci_cv()$bca[5]
            )/100 < 0.3
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$bca_ci()$method,
            "corrected cv with adjusted bootstrap percentile (BCa) CI"
        )
        expect_equal(
            CoefVarCI$new(
                x, correction = TRUE
            )$bca_ci()$statistics$est,
            58.1,
            tolerance = 0.0001
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = TRUE
                )$bca_ci()$statistics$lower -
                    CoefVarCI$new(
                        x, correction = TRUE
                    )$boot_bca_ci_cv_corr()$bca[4]
            )/100 < 0.3
        )
        expect_true(
            abs(
                CoefVarCI$new(
                    x, correction = TRUE
                )$bca_ci()$statistics$upper -
                    CoefVarCI$new(
                        x, correction = TRUE
                    )$boot_bca_ci_cv_corr()$bca[5]
            )/100 < 0.3
        )
        expect_equal(
            CoefVarCI$new(x)$all_ci()$method,
            "All methods"
        )
        expect_equal(
            nrow(CoefVarCI$new(x)$all_ci()$statistics),
            12
        )
        expect_equal(
            ncol(CoefVarCI$new(x)$all_ci()$statistics),
            4
        )
        expect_equal(
            CoefVarCI$new(x, correction = TRUE)$all_ci()$method,
            "All methods"
        )
        expect_equal(
            nrow(CoefVarCI$new(x, correction = TRUE)$all_ci()$statistics),
            12
        )
        expect_equal(
            ncol(CoefVarCI$new(x, correction = TRUE)$all_ci()$statistics),
            4
        )
    }
)
test_that(
    desc = "detect R6 class", {
        y <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        cv_y <- CoefVarCI$new(
           x = y,
           alpha = 0.05,
           R = 1000,
           digits = 2,
           correction = TRUE
        )
        expect_true(
            R6::is.R6(cv_y)
        )
    }
)

test_that(
    desc = "cn_mh for sample sizes higher than 340", {
        x = c(
            56.28, 52.29, 58.66, 56.05, 37.32, 18.18, 78.08, 38.39, 93.93,
            41.96, 49.09, 78.49, 49.76, 51.65, 55.9, 65.85, 37.08, 46.69,
            44.49, 36.83, 69.96, 21.2, 77.01, 26.32, 62.31, 21.54, 74.73,
            61.32, 43.84, 49.76, 13.89, 73.07, 26.38, 55.03, 11.61, 17.78,
            32.12, 72.92, 41.44, 60.3, 45, 100.65, 71.87, 52.2, 54.73, 29.99,
            38.21, 13.18, 41.32, 48.59, 46.76, 33.38, 28.29, 65.12, 53.73,
            62.54, 49.66, 83.33, 66.21, 27.8, 42.6, 55.05, 30.01, 87.68,
            32.93, 76.31, 13.26, 20.2, 46.94, 27.05, 36.75, 44.95, 62.23,
            58.24, 51, 30.79, 57.8, 52.22, 49.84, 61.98, 39.96, 46.91,
            13.99, 54.04, 53.13, 93.67, 56.72, 57.17, 20.4, 23.73, 21.97,
            54.37, 66.22, 39.5, 50.42, 20.67, 68.66, 65.03, 33.55, 100.59,
            45.43, 40.03, 53.42, 78.23, 63.51, 61.04, 30.8, 88.69, 69.16,
            39.33, 14.18, 60.43, 35.21, 98.71, 35.01, 39.88, 27.6, 32.33,
            69.26, 21.67, 62.35, 46.8, 59.15, 64.16, 72.91, 24.68, 36.44,
            45.34, 41.84, 36.28, 54.17, 45.36, 82.28, 45.25, 55.22, 30.04,
            51.01, 34.79, 46.13, 49.59, 54.52, 23.64, 57.98, 42.13, 43.14,
            67.11, 30.43, 47.95, 63.44, 54.26, 37.75, 49.57, 17.56, 67.66,
            32.16, 71.98, 36.13, 68.23, 38.82, 47.03, 34.53, 41.77, 43.25,
            47.08, 88.6, 31.61, 58.32, 58.27, 47.02, 38.34, 73.21, 45.28, 38,
            58.01, 79, 51.11, 61.2, 13.3, 50.21, 57.53, 71.4, 105.32, 39.89,
            51.98, 32.98, 20.59, 28.2, 33.96, 85.3, 63.19, 100.91, 44.62, 35.41,
            56.94, 39.75, 71.22, 12.32, 48.4, 80.24, 33.41, 73.47, 34.65, 71.1,
            40.3, 46.4, 52.37, 20.21, 5.5, 81.66, 78.47, 53.05, 47.3, 71.99,
            48.34, 56.94, 36.78, 57.21, 46.05, 54.79, 32.73, 50.19, 61.07,
            54.22, 37.26, 64.59, 50.72, 78.73, 65.26, 66.1, 52.95, 67.44,
            34.29, 60.13, 39.77, 54.8, 52.46, 60.72, 72.22, 25.38, 61.72,
            50.99, 43.96, 2.36, 71.13, 43.24, 82.37, 65.28, 88.13, 40.22,
            50.06, 62.81, 46.98, 42.26, 63.3, 46.53, 71.14, 49.58, 37.13,
            22.93, 90.91, 33.28, 52.73, 62.67, 43.31, 58.22, 43.04, 76.42,
            61.37, 32.68, 24.24, 55, 71.75, 55.95, 53.42, 16.42, 49.25,
            55.18, 77.89, 55.21, 24.17, 105.72, 21.06, 60.25, 32.05, 25.76,
            17.94, 48.27, 71.78, 58.91, 34.12, 12.98, 76.39, 13.59, 69.43,
            42.54, 81.56, 67.75, 45.33, 49.66, 53.43, 50.95, 30.04, 68.6,
            55.81, 18.16, 30.59, 72.27, 68.67, 28.25, 61.37, 40, 43.59,
            54.38, 34.63, 90.22, 69.85, 47.67, 38.38, 54.81, 47.04, 49.96,
            52.27, 76.31, 49.16, 45.46, 49.27, 59.86, 35, 50.06, 41.74, 64.21,
            68.83, 42.18, 57.58, 61.69, 44.13, 75.31, 68.29, 51.46, 57.52, 39.74
        )
        expect_equal(
            CoefVarCI$new(x)$cn_mh(), 0.0769772, tolerance = 0.0000001
        )

    }
)
test_that(
    desc = "a_value and b_value for sample sizes higher than 300", {
        x = rnorm(n = 302, mean = 50, sd = 20)
        expect_equal(
            unname(CoefVarCI$new(x)$a_value()$a),
            255.3057,
            tolerance = 0.0001
        )
        expect_equal(
            unname(CoefVarCI$new(x)$b_value()$b),
            351.8461,
            tolerance = 0.0001
        )
    }
)
