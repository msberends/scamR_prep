


GetClarityPriceQuant <- function(argclar) {
  diamonds %>% 
    filter(clarity==argclar) -> diamondsubset
  clarpricemax <- max(diamondsubset$price)
  clarpricemax
  diampriceecdf <- ecdf(diamonds$price)
  diampriceecdf(clarpricemax)
}

