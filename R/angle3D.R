#' @title angle3D function
#'
#' @description compute the Euclidian distance between two points
#'
#' @param A a \code{vector} corresponding to the x, y, and z coordinates of the first point forming the angle
#' @param B a \code{vector} corresponding to the x, y, and z coordinates of the middle point forming the angle
#' @param C a \code{vector} corresponding to the x, y, and z coordinates of the last point forming the angle
#' 
#' @return a \code{vector} with the distance
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr
#' 
#' 
#' @export
#' 


angle3D <- function(A, B, C){
  v1= c(A[1]-B[1], A[2]-B[2], A[3]-B[3])
  v2= c(C[1]-B[1], C[2]-B[2], C[3]-B[3])
  
  v1mag <- sqrt(v1[1] * v1[1] + v1[2] * v1[2] + v1[3] * v1[3])
  v1norm <- c(v1[1] / v1mag, v1[2] / v1mag, v1[3] / v1mag)
  
  v2mag <- sqrt(v2[1] * v2[1] + v2[2] * v2[2] + v2[3] * v2[3])
  v2norm <- c(v2[1] / v2mag, v2[2] / v2mag, v2[3] / v2mag)
  
  res <- v1norm[1] * v2norm[1] + v1norm[2] * v2norm[2] + v1norm[3] * v2norm[3]
  angle <- acos(res) *180/pi
  return(angle)
}
