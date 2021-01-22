#' The name_nested function gives the same name to all the x_th columns of a nested list
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @param data A nested list
#' @param x An integer giving the position of the column to rename in the nested list
#' @param name A character
#' @return A \code{list} with modified column names
#' @import tidyverse
#' @importFrom purrr set_names map
#' @examples
#' \dontrun{
#' map(1:length(Time), ~names(x =Time[[.]][1]))
#' data <- name_nested(Time, 1 , "time")
#' map(1:length(data), ~names(x =data[[.]][1]))
#' }

name_nested <- function(data, x, name){
  Trials <- 1:length(data)
  data <- map(Trials, ~ set_names(x =data[[.]][x] , nm = rep(name, length(.)))) %>%
    set_names(names(data))
  return(data)
}
