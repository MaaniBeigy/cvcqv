# wine.R
wine <- read.csv(
  file = "./docs/articles/wine.csv",
  header = TRUE
)
str(wine)
View(wine)
wine$measurement <- as.Date(wine$measurement, format = "%Y-%m-%d")
wine_tbl <- tibbletime::as_tbl_time(wine, measurement)
str(wine_tbl)
View(wine_tbl)
library(tidyverse)
library(anomalize)
library(cvcqv)
wine_gather <- wine_tbl %>% gather(
  key = "wines",
  value = "score",
  Wine_1:Wine_5, -measurement
)
View(wine_gather)
shapiro.test(wine_gather$score)
wine_var <- wine_gather %>% group_by(expert, wines) %>% mutate(
  cqv_est = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$est,
  cqv_lower = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$lower,
  cqv_upper = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$upper
)
View(wine_var)

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

expert_var <- wine_gather %>% group_by(expert) %>% mutate(
  cqv_est = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$est,
  cqv_lower = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$lower,
  cqv_upper = cvcqv::CoefQuartVarCI$new(
    x = score, na.rm = TRUE, alpha = 0.05, R = 100, digits = 3,
  )$perc_ci()$statistics$upper
)
View(expert_var)
expert_var2 <- expert_var %>% group_by(expert, measurement) %>% summarise(
  cqv_est = first(cqv_est), 
  cqv_lower = first(cqv_lower),
  cqv_upper = first(cqv_upper)
)
View(expert_var2)
ggplot(data = expert_var2, aes(x = expert, y = cqv_est, fill = expert)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(
    aes(ymin = cqv_lower, ymax = cqv_upper),
    width = 0.1, 
    position = position_dodge(0.9)
  ) + 
  scale_fill_manual(
    values = c("#a84551", "#963e48", "#843640")
  ) +
  xlab("Experts") + 
  ylab("cqv (%) with 95% CI")
