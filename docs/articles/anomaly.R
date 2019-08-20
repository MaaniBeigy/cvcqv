# anomaly
# function of installing the uninstalled required packages
if (length(
  setdiff(c(
    "tidyverse", "cvcqv", "tibbletime", "anomalize"
    ), rownames(installed.packages()))
) > 0) {
  install.packages(setdiff(
    c(
      "tidyverse", "cvcqv", "tibbletime", "anomalize"
      ), rownames(installed.packages()))
  )
} 
# loading the required packages/libraries
lapply(c(
  "tidyverse", "cvcqv", "tibbletime", "anomalize"
  ), require, character.only = TRUE)
speed_df <- data.frame(
  date = as.Date(c(
    "2019-01-01", "2019-01-02", "2019-01-03", "2019-01-04", "2019-01-05",
    "2019-01-01", "2019-01-02", "2019-01-03", "2019-01-04", "2019-01-05",
    "2019-01-01", "2019-01-02", "2019-01-03", "2019-01-04", "2019-01-05"
  ), format = "%Y-%m-%d"),
  case = c(
    "A", "A", "A", "A", "A", "B", "B", "B", "B", "B", "C", "C", "C", "C", "C"
  ),
  speed = c(
    1.2, 1.3, 1.1, 1.1, 1.5, 1.2, 1.1, 20, 30, 100, 1.2, 1.1, 2, 3, 4
  )
)
speed_df
speed_tbl_df <- tibbletime::as_tbl_time(speed_df, date)
# cqv
cqv_speed_A <- cvcqv::CoefQuartVarCI$new(
  x = subset(speed_tbl_df, case == "A")$speed, 
  na.rm = TRUE, 
  digits = 3, 
  R = 1000, 
  alpha = 0.05
  )$basic_ci()

cqv_speed_B <- cvcqv::CoefQuartVarCI$new(
  x = subset(speed_tbl_df, case == "B")$speed, 
  na.rm = TRUE, 
  digits = 3, 
  R = 1000, 
  alpha = 0.05
)$basic_ci()

cqv_speed_C <- cvcqv::CoefQuartVarCI$new(
  x = subset(speed_tbl_df, case == "C")$speed, 
  na.rm = TRUE, 
  digits = 3, 
  R = 1000, 
  alpha = 0.05
)$basic_ci()

# cv
cv_speed_A <- cvcqv::CoefVarCI$new(
  x = subset(speed_tbl_df, case == "A")$speed, 
  na.rm = TRUE, 
  digits = 3, 
  R = 1000, 
  alpha = 0.05
)$basic_ci()

cv_speed_B <- cvcqv::CoefVarCI$new(
  x = subset(speed_tbl_df, case == "B")$speed, 
  na.rm = TRUE, 
  digits = 3, 
  R = 1000, 
  alpha = 0.05
)$basic_ci()

cv_speed_C <- cvcqv::CoefVarCI$new(
  x = subset(speed_tbl_df, case == "C")$speed, 
  na.rm = TRUE, 
  digits = 3, 
  R = 1000, 
  alpha = 0.05
)$basic_ci()

cvcqv_speed <- dplyr::bind_rows(list(
  cqv_speed_A$statistics,
  cqv_speed_B$statistics,
  cqv_speed_C$statistics,
  cv_speed_A$statistics,
  cv_speed_B$statistics,
  cv_speed_C$statistics
))
attr(cvcqv_speed, "row.names") <- c(
  "cqv_A", "cqv_B", "cqv_C", "cv_A", "cv_B", "cv_C"
  )
cvcqv_speed
anomalize::anomalize(speed_tbl_df, speed, method = "iqr", alpha = 0.05)
