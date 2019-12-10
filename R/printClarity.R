printClarity <- function(clarity) {
  arg_clarity <- clarity
  df <- diamonds %>% 
    filter(clarity == arg_clarity)
  get_pctl <- ecdf(sort(diamonds$price))
  glue("The diamonds of {arg_clarity} clarity range from ${format(min(df$price), nsmall = 2)} - ${format(max(df$price), nsmall = 2)}, compared to the average for all diamonds, ${format(mean(diamonds$price), nsmall = 2)}. The most expensive diamond is at the {round(get_pctl(max(df$price)) * 100, 4)} percentile.")
}
