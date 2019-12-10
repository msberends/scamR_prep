plotClarity <- function(clarity) {
  arg_clarity <- clarity
  diamconvhull <- diamonds %>% 
    filter(clarity == arg_clarity) %>% 
    select(carat, price) %>% 
    chull()
  diamconvhull2 <- diamonds %>% 
    filter(clarity == arg_clarity) %>% 
    select(carat, price) %>% 
    slice(diamconvhull)
  
  ggplot() +
    geom_point(data = diamonds,
               aes(carat, price)) +
    geom_point(data = diamonds %>% 
                 filter(clarity == arg_clarity),
               aes(carat, price), colour = "red") +
    geom_polygon(data=diamconvhull2, 
                 aes(carat, price), colour = "red", fill="red", alpha=0.5) +
    labs(title="Diamonds") + xlab("Weight in carat") + ylab("Price in dollar")
}
