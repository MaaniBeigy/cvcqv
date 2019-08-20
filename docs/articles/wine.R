# wine.R
# function of installing the uninstalled required packages
if (length(
  setdiff(c("tidyverse", "cvcqv", "tibbletime"), rownames(installed.packages()))
  ) > 0) {
  install.packages(setdiff(
    c("tidyverse", "cvcqv", "tibbletime"), rownames(installed.packages()))
    )
} 
# loading the required packages/libraries
lapply(c("tidyverse", "cvcqv", "tibbletime"), require, character.only = TRUE)
wine <- read.csv(  # read the data.frame wine from the csv file
  file = "./docs/articles/wine.csv",
  header = TRUE
)
str(wine)  # see the structure of the data.frame
wine$measurement <- as.Date(  # transform the measurement data into Date format
  wine$measurement, format = "%Y-%m-%d"
  )
wine_tbl <- tibbletime::as_tbl_time(  # convert the data.frame to a tbl_time
  wine, measurement
  )
str(wine_tbl)    # see the structure of the tbl_time data.frame
wine_gather <- wine_tbl %>% gather(  # convert the data to long format
  key = "wines",
  value = "score",
  Wine_1:Wine_5, -measurement
)
shapiro.test(wine_gather$score)  # test the normality of the outcome variable
wine_var <- wine_gather %>% group_by(expert, wines) %>% mutate(
  # calculate the cqv and 95% bootstrap percentile confidence interval
  cqv_est = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$est,  # estimated cqv
  cqv_lower = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$lower,  # lower bound of the 95% CI
  cqv_upper = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$upper  # upper bound of the 95% CI
)
# draw a cluster bar plot to show the results
ggplot(data = wine_var, aes(x = expert, y = cqv_est, fill = wines)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(
    aes(ymin = cqv_lower, ymax = cqv_upper),
    width = 0.1, 
    position = position_dodge(0.9)
    ) + 
  scale_fill_manual(
    values = c("#a84551", "#963e48", "#843640", "#722f37", "#60282e")
    ) +
  xlab("Experts") + 
  ylab("cqv (%) with 95% CI")
wine_var %>% summarise(  # summarise the results for the experts
  cqv_est = first(cqv_est),
  cqv_lower = first(cqv_lower),
  cqv_upper = first(cqv_upper)
) 
