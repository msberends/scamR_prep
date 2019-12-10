plotClarity <- function(clarity) {
  arg_clarity <- clarity
  diamconvhull_clarity <- diamonds %>% 
    filter(clarity == arg_clarity) %>% 
    select(carat, price) %>% 
    chull()
  diamconvhull_all <- diamonds  %>% 
    filter(clarity != arg_clarity) %>% 
    select(carat, price) %>% 
    chull()
  diamconvhull2_clarity <- diamonds %>% 
    filter(clarity == arg_clarity) %>% 
    select(carat, price) %>% 
    slice(diamconvhull_clarity)
  diamconvhull2_all <- diamonds %>% 
    filter(clarity != arg_clarity) %>% 
    select(carat, price) %>% 
    slice(diamconvhull_all)
  
  ggplot() +
    geom_point(data = diamonds %>% 
                 filter(clarity != arg_clarity),
               aes(carat, price)) +
    geom_polygon(data = diamconvhull2_all, 
                 aes(carat, price), 
                 colour = "#00000055", 
                 fill="black", alpha = 0.2) +
    geom_point(data = diamonds %>% 
                 filter(clarity == arg_clarity),
               aes(carat, price), colour = "red") +
    geom_polygon(data = diamconvhull2_clarity, 
                 aes(carat, price), 
                 colour = "#ff000055", 
                 fill="red", alpha = 0.2) +
    labs(title = paste("Diamonds, in red: clarity", arg_clarity)) +
    xlab("Weight in carat") +
    ylab("Price in dollar")
}
