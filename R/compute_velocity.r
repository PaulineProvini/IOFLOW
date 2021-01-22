#' The compute_velocity function computes the velocity
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @param data A list with the trajectory data
#' @param duration A number corresponding to the time lag between two data rows
#' @return A \code{list} with the column numbers with names containing the pattern
compute_velocity <- function(data, duration) {
  v <- vector()
  for (j in 1: length(data)-1){
    v[j] <- (data[j+1]-data[j])/duration
  }
  v[length(data)] <- v[length(data)-1]
  return(v)
}
