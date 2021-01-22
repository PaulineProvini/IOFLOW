#' @title find_peaks 
#' @description find peaks in a vector
#' @author Stasia Grinberg https://github.com/stas-g/findPeaks/blob/master/find_peaks.R 
#'
#' @param x The vector where to find the peaks
#' @param m a number A (local) peak is defined as a point such that m points either side of it has a lower or equal value to it
#' @return a vector


find_peaks <- function (x, m = 3){
  shape <- diff(sign(diff(x, na.pad = FALSE)))
  pks <- sapply(which(shape < 0), FUN = function(i){
    z <- i - m + 1
    z <- ifelse(z > 0, z, 1)
    w <- i + m + 1
    w <- ifelse(w < length(x), w, length(x))
    if(all(x[c(z : i, (i + 2) : w)] <= x[i + 1])) return(i + 1) else return(numeric(0))
  })
  pks <- unlist(pks)
  pks
}
