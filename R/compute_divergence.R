#' @title compute_divergence function
#'
#' @description compute the Angle and the Menger Curvature formed by three points
#'
#' @param A a \code{vector} corresponding to the x, y, and z coordinates of the first point
#' @param B a \code{vector} corresponding to the x, y, and z coordinates of the middle point
#' @param C a \code{vector} corresponding to the x, y, and z coordinates of the last point
#'
#' @return a \code{vector} with the angle in degrees and the curvature in m-1
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr
#'
#'
#' @export
#'


compute_divergence <- function(A, B, C){
  v1= c(A[1]-B[1], A[2]-B[2], A[3]-B[3])
  v2= c(C[1]-B[1], C[2]-B[2], C[3]-B[3])

  v1mag <- sqrt(v1[1] * v1[1] + v1[2] * v1[2] + v1[3] * v1[3])
  v1norm <- c(v1[1] / v1mag, v1[2] / v1mag, v1[3] / v1mag)

  v2mag <- sqrt(v2[1] * v2[1] + v2[2] * v2[2] + v2[3] * v2[3])
  v2norm <- c(v2[1] / v2mag, v2[2] / v2mag, v2[3] / v2mag)

  res <- v1norm[1] * v2norm[1] + v1norm[2] * v2norm[2] + v1norm[3] * v2norm[3]
  angle <- acos(res) *180/pi

  names(angle) <- "angle"
  menger_curvature <- 2* sin(acos(res))/distance(as.data.frame(t(A)), as.data.frame(t(C)))
  names(menger_curvature) <- "curvature"
  return(c(angle, menger_curvature))
}

