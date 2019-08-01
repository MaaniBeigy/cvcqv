context("state_cv_versatile")
test_that(
    desc = "finds the correct findings", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_equal(
            cv_versatile(
                x,
                method = "kelley",
                correction = FALSE
                )$method,
            "cv with Kelley 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "kelley",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "kelley",
                correction = FALSE
            )$statistics$lower,
            41.5, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "kelley",
                correction = FALSE
            )$statistics$upper,
            98.5, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "kelley",
                correction = TRUE
            )$method,
            "Corrected cv with Kelley 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "kelley",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "kelley",
                correction = TRUE
            )$statistics$lower,
            41.5, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "kelley",
                correction = TRUE
            )$statistics$upper,
            98.5, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mckay",
                correction = FALSE
            )$method,
            "cv with McKay 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mckay",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mckay",
                correction = FALSE
            )$statistics$lower,
            41.4, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mckay",
                correction = FALSE
            )$statistics$upper,
            108.5, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mckay",
                correction = TRUE
            )$method,
            "Corrected cv with McKay 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mckay",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mckay",
                correction = TRUE
            )$statistics$lower,
            41.6, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mckay",
                correction = TRUE
            )$statistics$upper,
            109.4, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "miller",
                correction = FALSE
            )$method,
            "cv with Miller 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "miller",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "miller",
                correction = FALSE
            )$statistics$lower,
            34.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "miller",
                correction = FALSE
            )$statistics$upper,
            81.5, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "miller",
                correction = TRUE
            )$method,
            "Corrected cv with Miller 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "miller",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "miller",
                correction = TRUE
            )$statistics$lower,
            34.2, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "miller",
                correction = TRUE
            )$statistics$upper,
            81.9, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "vangel",
                correction = FALSE
            )$method,
            "cv with Vangel 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "vangel",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "vangel",
                correction = FALSE
            )$statistics$lower,
            41.3, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "vangel",
                correction = FALSE
            )$statistics$upper,
            105.4, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "vangel",
                correction = TRUE
            )$method,
            "Corrected cv with Vangel 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "vangel",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "vangel",
                correction = TRUE
            )$statistics$lower,
            41.4, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "vangel",
                correction = TRUE
            )$statistics$upper,
            106.2, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mahmoudvand_hassani",
                correction = FALSE
            )$method,
            "cv with Mahmoudvand-Hassani 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mahmoudvand_hassani",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mahmoudvand_hassani",
                correction = FALSE
            )$statistics$lower,
            43.5, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mahmoudvand_hassani",
                correction = FALSE
            )$statistics$upper,
            82.9, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mahmoudvand_hassani",
                correction = TRUE
            )$method,
            "Corrected cv with Mahmoudvand-Hassani 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mahmoudvand_hassani",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mahmoudvand_hassani",
                correction = TRUE
            )$statistics$lower,
            43.7, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "mahmoudvand_hassani",
                correction = TRUE
            )$statistics$upper,
            83.3, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "normal_approximation",
                correction = FALSE
            )$method,
            "cv with Normal Approximation 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "normal_approximation",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "normal_approximation",
                correction = FALSE
            )$statistics$lower,
            44.5, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "normal_approximation",
                correction = FALSE
            )$statistics$upper,
            85.3, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "normal_approximation",
                correction = TRUE
            )$method,
            "Corrected cv with Normal Approximation 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "normal_approximation",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "normal_approximation",
                correction = TRUE
            )$statistics$lower,
            44.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "normal_approximation",
                correction = TRUE
            )$statistics$upper,
            85.7, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "shortest_length",
                correction = FALSE
            )$method,
            "cv with Shortest-Length 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "shortest_length",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "shortest_length",
                correction = FALSE
            )$statistics$lower,
            42, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "shortest_length",
                correction = FALSE
            )$statistics$upper,
            81, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "shortest_length",
                correction = TRUE
            )$method,
            "Corrected cv with Shortest-Length 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "shortest_length",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "shortest_length",
                correction = TRUE
            )$statistics$lower,
            42.2, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "shortest_length",
                correction = TRUE
            )$statistics$upper,
            81.4, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "equal_tailed",
                correction = FALSE
            )$method,
            "cv with Equal-Tailed 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "equal_tailed",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "equal_tailed",
                correction = FALSE
            )$statistics$lower,
            43.9, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "equal_tailed",
                correction = FALSE
            )$statistics$upper,
            84.4, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "equal_tailed",
                correction = TRUE
            )$method,
            "Corrected cv with Equal-Tailed 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "equal_tailed",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "equal_tailed",
                correction = TRUE
            )$statistics$lower,
            44.2, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "equal_tailed",
                correction = TRUE
            )$statistics$upper,
            84.8, tolerance = 0.0001
        )
        expect_equal(
            cv_versatile(
                x,
                method = "norm",
                correction = FALSE
            )$method,
            "cv with Normal Approximation Bootstrap 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "norm",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_true(
            abs(
                cv_versatile(
                x,
                method = "norm",
                correction = FALSE
            )$statistics$lower -
            38.6
            )/100 < 0.05
        )
        expect_true(
            abs(
                cv_versatile(
                    x,
                    method = "norm",
                    correction = FALSE
                )$statistics$upper -
                    77.6
            )/100 < 0.05
        )
        expect_equal(
            cv_versatile(
                x,
                method = "norm",
                correction = TRUE
            )$method,
            "Corrected cv with Normal Approximation Bootstrap 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "norm",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_true(
            abs(
                cv_versatile(
                    x,
                    method = "norm",
                    correction = TRUE
                )$statistics$lower -
                    38.6
            )/100 < 0.05
        )
        expect_true(
            abs(
                cv_versatile(
                    x,
                    method = "norm",
                    correction = TRUE
                )$statistics$upper -
                    77.6
            )/100 < 0.05
        )
        expect_equal(
            cv_versatile(
                x,
                method = "basic",
                correction = FALSE
            )$method,
            "cv with Basic Bootstrap 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "basic",
                correction = FALSE
            )$statistics$est,
            57.8, tolerance = 0.0001
        )
        expect_true(
            abs(
                cv_versatile(
                    x,
                    method = "basic",
                    correction = FALSE
                )$statistics$lower -
                    37.1
            )/100 < 0.05
        )
        expect_true(
            abs(
                cv_versatile(
                    x,
                    method = "basic",
                    correction = FALSE
                )$statistics$upper -
                    77
            )/100 < 0.05
        )
        expect_equal(
            cv_versatile(
                x,
                method = "basic",
                correction = TRUE
            )$method,
            "Corrected cv with Basic Bootstrap 95% CI"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "basic",
                correction = TRUE
            )$statistics$est,
            58.1, tolerance = 0.0001
        )
        expect_true(
            abs(
                cv_versatile(
                    x,
                    method = "basic",
                    correction = TRUE
                )$statistics$lower -
                    38
            )/100 < 0.05
        )
        expect_true(
            abs(
                cv_versatile(
                    x,
                    method = "basic",
                    correction = TRUE
                )$statistics$upper -
                    77
            )/100 < 0.05
        )
        expect_error(
            cv_versatile(
                x,
                method = "perc",
                correction = FALSE
            ),
            "percent method is not developed yet"
        )

        expect_error(
            cv_versatile(
                x,
                method = "perc",
                correction = TRUE
            ),
            "percent method is not developed yet"
        )
        expect_error(
            cv_versatile(
                x,
                method = "bca",
                correction = FALSE
            ),
            "BCa method is not developed yet"
        )

        expect_error(
            cv_versatile(
                x,
                method = "bca",
                correction = TRUE
            ),
            "BCa method is not developed yet"
        )
        expect_equal(
            cv_versatile(
                x,
                method = "all",
                correction = TRUE
            )$method,
            "All methods"
        )
        expect_equal(
            nrow(cv_versatile(
                x,
                method = "all",
                correction = TRUE
            )$statistics),
            10
        )
        expect_equal(
            ncol(cv_versatile(
                x,
                method = "all",
                correction = TRUE
            )$statistics),
            4
        )
        expect_equal(
            cv_versatile(
                x,
                correction = FALSE
            )$method,
            "cv = sd/mean (may be biased)"
        )
        expect_equal(
            cv_versatile(
                x,
                correction = TRUE
            )$method,
            "Corrected (i.e., unbiased) cv"
        )
        expect_equal(
            cv_versatile(
                x,
                correction = FALSE
            )$statistics$est,
            57.8
        )
        expect_equal(
            cv_versatile(
                x,
                correction = TRUE
            )$statistics$est,
            58.1
        )
        expect_equal(
            cv_versatile(
                x,
                method = "all",
                correction = FALSE
            )$method,
            "All methods"
        )
        expect_equal(
            nrow(cv_versatile(
                x,
                method = "all",
                correction = FALSE
            )$statistics),
            10
        )
        expect_equal(
            ncol(cv_versatile(
                x,
                method = "all",
                correction = FALSE
            )$statistics),
            4
        )
    }
)
test_that(
    desc = "for sample sizes higher than 340", {
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
            cv_versatile(
                x, digits = 7, method = "mahmoudvand_hassani"
                )$statistics$est,
            37.97088,
            tolerance = 0.01
        )
        expect_equal(
            cv_versatile(
                x, digits = 7, method = "mahmoudvand_hassani", correction = TRUE
                )$statistics$est,
            37.95918,
            tolerance = 0.01
        )
        expect_equal(
            cv_versatile(
                x, digits = 7, method = "shortest_length"
            )$statistics$lower,
            37.32619,
            tolerance = 0.01
        )
        expect_equal(
            cv_versatile(
                x, digits = 7, method = "shortest_length", correction = TRUE
            )$statistics$lower,
            37.31469,
            tolerance = 0.01
        )
        expect_equal(
            cv_versatile(
                x,
                method = "all",
                correction = FALSE
            )$method,
            "All methods"
        )
        expect_equal(
            nrow(cv_versatile(
                x,
                method = "all",
                correction = FALSE
            )$statistics),
            10
        )
        expect_equal(
            ncol(cv_versatile(
                x,
                method = "all",
                correction = FALSE
            )$statistics),
            4
        )
        expect_equal(
            cv_versatile(
                x,
                method = "all",
                correction = TRUE
            )$method,
            "All methods"
        )
        expect_equal(
            nrow(cv_versatile(
                x,
                method = "all",
                correction = TRUE
            )$statistics),
            10
        )
        expect_equal(
            ncol(cv_versatile(
                x,
                method = "all",
                correction = TRUE
            )$statistics),
            4
        )
    }
)
