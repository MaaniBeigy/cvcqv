# anomaly
library(tidyverse)
library(anomalize)
library(cvcqv)
# install.packages("tibbletime")
# install.packages("cranlogs")
library(cranlogs)
library(tibbletime)
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

anomalize::anomalize(speed_tbl_df, speed, method = "iqr", alpha = 0.05)

a <- cranlogs::cran_downloads(
  packages = "cvcqv",
  # when = c("last-month"),
  from = "2019-01-01",
  to = "2019-08-15"
)
class(a)
sum(a$count)
shapiro.test(a$count)
cqv_versatile(a$count, na.rm = TRUE, digits = 3, method = "all", R = 100)
c <- tidyverse_cran_downloads %>%
  filter(package == "lubridate") %>% 
  ungroup()
cqv_versatile(c$count, na.rm = TRUE, digits = 3, method = "bonett", R = 100)
class(a)
b <- as_tbl_time(a, date)
b_anom <- anomalize::anomalize(b, count, method = "iqr", alpha = 0.05)
subset(b_anom, anomaly == "Yes")
b %>%
  ggplot(aes(date, count)) +
  geom_point(color = "#2c3e50", alpha = 0.25) +
  facet_wrap(~ package, scale = "free_y", ncol = 3) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
  labs(title = "cvcqv Package Daily Download Counts",
       subtitle = "Data from CRAN by way of cranlogs package")
b %>%
  # Data Manipulation / Anomaly Detection
  time_decompose(count, method = "stl") %>%
  anomalize(remainder, method = "iqr") %>%
  time_recompose() %>%
  # Anomaly Visualization
  plot_anomalies(time_recomposed = TRUE, ncol = 3, alpha_dots = 0.25) +
  labs(title = "cvcqv Anomalies", subtitle = "STL + IQR Methods") 
  


