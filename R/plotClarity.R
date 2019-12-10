plotClarity <- function(clarity) {
  arg_clarity <- clarity
  ggplot() +
    geom_point(data = diamonds,
               aes(price, carat)) +
    geom_point(data = diamonds %>% 
                 filter(clarity == arg_clarity),
               aes(carat, price), colour = "red")
}