context("state_CoefQuartVar")
test_that(
    desc = "check if 0.75 percentile is zero to avoid NANs", {
        x = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 1771L, 0L, 0L, 106L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 84L, 168L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 124L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 127L, 0L, 0L, 0L, 100L, 0L,
              0L, 0L, 0L, 0L, 104L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 554L, 1174L, 0L, 0L, 0L, 0L, 8L, 0L, 0L, 0L, 0L, 263L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 2L, 130L, 0L, 0L, 0L, 272L, 0L, 0L, 0L, 0L, 42L,
              0L, 0L, 130L, 0L, 0L, 0L, 0L, 0L, 9L, 0L, 0L, 2L, 0L, 0L, 0L,
              0L, 0L, 826L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 231L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 177L, 0L, 550L, 0L, 0L, 0L, 0L, 9L, 531L, 0L,
              152L, 0L, 347L, 0L, 0L, 0L, 0L, 827L, 290L, 0L, 0L, 0L, 525L,
              0L, 0L, 122L, 0L, 0L, 0L, 546L, 0L, 10L, 0L, 0L, 0L, 81L, 5L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 53L, 0L, 0L, 0L, 0L, 0L, 241L, 0L, 0L, 261L, 0L, 0L,
              0L, 0L, 211L, 263L, 588L, 0L, 0L, 197L, 0L, 63L, 0L, 0L, 0L,
              0L, 0L, 297L, 0L, 177L, 0L, 0L, 0L, 0L, 5L, 203L, 139L, 73L,
              0L, 47L, 19L, 0L, 0L, 0L, 0L, 0L, 243L, 0L, 0L, 0L, 0L, 0L, 110L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 12L, 110L, 1217L, 386L, 0L, 600L,
              0L, 574L, 0L, 131L, 103L, 0L, 0L, 0L, 0L, 0L, 50L, 565L, 0L,
              0L, 0L, 1961L, 15L, 304L, 0L, 389L, 133L, 585L, 0L, 0L, 0L, 0L,
              0L, 240L, 12L, 0L, 0L, 119L, 21L, 0L, 717L, 0L, 729L, 0L, 1L,
              0L, 0L, 0L, 0L, 0L, 41L, 0L, 0L, 0L, 176L, 0L, 0L, 0L, 0L, 26L,
              322L, 0L, 0L, 37L, 0L, 528L, 271L, 0L, 0L, 0L, 0L, 127L, 0L,
              0L, 0L, 43L, 290L, 0L, 0L, 22L, 52L, 0L, 57L, 112L, 0L, 29L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1235L, 0L, 0L, 0L, 3131L,
              0L, 0L, 0L, 0L, 0L, 0L, 284L, 0L, 610L, 760L, 937L, 0L, 0L, 1176L,
              0L, 160L, 1463L, 0L, 607L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              44L, 0L, 0L, 0L, 0L, 0L, 0L, 1423L, 0L, 618L, 0L, 927L, 0L, 0L,
              0L, 0L, 483L, 111L, 805L, 0L, 0L, 0L, 356L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 954L, 0L, 845L, 0L, 182L, 475L, 328L, 0L, 0L, 0L,
              256L, 0L, 1126L, 0L, 422L, 0L, 0L, 0L, 0L, 0L, 501L, 0L, 0L,
              212L, 4299L, 4096L, 2148L, 12059L, 3945L, 4254L, 978L, 1406L,
              3500L, 1573L, 4207L, 1168L, 3153L, 3028L, 3155L, 1260L, 2469L,
              522L, 2313L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 836L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 49L, 1176L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
              0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L)
        expect_true(
            CoefQuartVar$new(x)$super_$super_$initialize(
                x, probs = 0.75
                ) == 0
        )
        expect_warning(
            CoefQuartVar$new(x)$est(),
            "cqv is NaN because both q3 and q1 are 0, max was used instead of q3"
        )
        expect_equal(
            CoefQuartVar$new(x)$est(),
            100
        )
        expect_equal(
            CoefQuartVar$new(x)$a(),
            124
        )
        expect_equal(
            CoefQuartVar$new(x)$b(),
            164
        )
        expect_equal(
            CoefQuartVar$new(x)$c(),
            411
        )
        expect_equal(
            CoefQuartVar$new(x)$d(),
            451
        )
        expect_equal(
            CoefQuartVar$new(x)$alphastar(),
            0.9934781,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVar$new(x)$Ya(),
            0
        )
        expect_equal(
            CoefQuartVar$new(x)$Yb(),
            0
        )
        expect_equal(
            CoefQuartVar$new(x)$Yc(),
            0
        )
        expect_equal(
            CoefQuartVar$new(x)$Yd(),
            37
        )
    }
)
test_that(
    desc = "check if 0.75 percentile is non-zero to avoid NANs", {
        x <- c(
            0.2, 0.5, 1.1, 1.4, 1.8, 2.3, 2.5, 2.7, 3.5, 4.4,
            4.6, 5.4, 5.4, 5.7, 5.8, 5.9, 6.0, 6.6, 7.1, 7.9
        )
        expect_true(
            CoefQuartVar$new(x)$super_$super_$initialize(
                x, probs = 0.75
            ) != 0
        )
        expect_equal(
            CoefQuartVar$new(x)$est(),
            45,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVar$new(x)$a(),
            2
        )
        expect_equal(
            CoefQuartVar$new(x)$b(),
            9
        )
        expect_equal(
            CoefQuartVar$new(x)$c(),
            12
        )
        expect_equal(
            CoefQuartVar$new(x)$d(),
            19
        )
        expect_equal(
            CoefQuartVar$new(x)$alphastar(),
            0.9330522,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVar$new(x)$Ya(),
            0.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVar$new(x)$Yb(),
            3.5,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVar$new(x)$Yc(),
            5.4,
            tolerance = 0.0001
        )
        expect_equal(
            CoefQuartVar$new(x)$Yd(),
            7.1,
            tolerance = 0.0001
        )
    }
)
test_that(
    desc = "finds the correct cqv", {
        x <- c(1.2, 1.3, 1.1, 1.1, 1.5)
        expect_equal(
            CoefQuartVar$new(x)$est(), 8.3,
            tolerance = 0.0001
        )
    }
)
test_that(
    desc = "detect R6 class", {
        x <- c(1.2, 1.3, 1.1, 1.1, 1.5)
        sample_cqv_1 <- CoefQuartVar$new(x)
        expect_true(
            R6::is.R6(sample_cqv_1)
        )
    }
)

