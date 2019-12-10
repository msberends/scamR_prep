getClarityDF <- function(clarity, n = 10) {
  arg_clarity <- clarity
  diamonds %>% 
    filter(clarity == arg_clarity) %>% 
    sample_n(n)
}