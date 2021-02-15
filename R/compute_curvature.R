#' @title compute_curvature function
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @description Calculate the curvature (K : magnitude and orientation)
#'
#' @param data a \code{data.frame} 
#' @param x a \code{string} of the variable name x
#' @param y a \code{string} of the variable name y
#' @param span a \code{numeric} corresponding to the span on which the curvature is computed
#' 
#' @return A data.frame
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr
#' 
#' 
#' @export
#' 
#' 

compute_curvature <- function(data, x, y, span){
  X <- which(names(data) == x)
  Y <- which(names(data) == y)
  
  dx <- diff(c(data[,X], data[span,X])) # Distance between x coords with wrap-around
  dy <- diff(c(data[,Y], data[span,Y])) # Distance between y coords with wrap-around
  ds <- sqrt(dx^2 + dy^2)                    # Segment size between points
  ddx <- dx/ds                               # Ratio of x distance to segment size
  ddy <- dy/ds                               # Ratio of y distance to segment size
  ds2 <- (ds + c(ds[-span], ds[span]))/2           # Mean segment length either side per point
  Cx <- diff(c(ddx, ddx[span]))/ds2   # Change in ddx per unit length
  Cy <- diff(c(ddy, ddy[span]))/ds2   # Change in ddy per unit length
  
 
  K <- (ddy * Cx - ddx * Cy)/ ((ddx^2 + ddy^2)^(3/2))
  Curvature <- data.frame(Cx, Cy, K)
  
return(Curvature)
}
