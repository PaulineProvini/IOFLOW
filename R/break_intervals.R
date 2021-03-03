#' @title break_intervals function
#'
#' @description cut the trial into multiple intervals
#'
#' @param data a \code{data.frame} corresponding to the data to cut
#' @param breaks a \code{vector} with ordered integers corresponding to the
#' intervals
#'
#' @return a \code{data.frame} ordered by each interval
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr
#'
#'
#' @export
#'

break_intervals <- function(data, breaks, variable) {

 column <-  which(colnames(data) == variable)


  data_interval <- mutate(.data = data,
                         interval = cut(data[[column]],
                          breaks,
                          include.lowest = TRUE,
                          right = FALSE))

  return(data_interval)

}

