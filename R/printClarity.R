printClarity <- function(clarity) {
  library(glue)
  library(dplyr)
  arg_clarity <- clarity
  df <- diamonds %>% 
    filter(clarity == arg_clarity)
  get_pctl <- ecdf(sort(diamonds$price))
  glue("The diamonds of {arg_clarity} clarity range from ${min(df$price)} - ${max(df$price)}, compared to the average for all diamonds, ${round(mean(diamonds$price), 2)}. The most expensive diamond is at the {round(get_pctl(max(df$price)), 4)} percentile.")
}
