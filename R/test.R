plotClarity2 <- function(clarity) {
  arg_clarity <- clarity
  ggplot() +
    geom_point(data = diamonds %>% 
                 filter(clarity != arg_clarity),
               aes(carat, price), size = 0.5) +
    geom_point(data = diamonds %>% 
                 filter(clarity == arg_clarity),
               aes(carat, price), colour = "red", size = 0.5) +
    labs(paste("Clarity:", clarity))
}
