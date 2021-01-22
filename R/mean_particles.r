#' @title mean_particles function
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @description Compute the mean, minimum, maximum and standard deviation of all the tracers
#'
#' @param trial string corresponding to the trial name
#' @param variable list containing the data for the variable of all the particles of a given variable (tx, ty, etc.)
#' @param item either F or A to choose what particle to average (F for fluid, A for food...)
#' @return A \code{dataframe} with \code{mean}, \code{sd}, \code{min} and \code{max} of all the particles of a given variable (tx, ty, etc.)
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr
#' @export
#' @importFrom  stats sd
#' @seealso \code{\link{build_mean}}

mean_particles <- function(trial, variable, item){
  mean_na_rm <- partial(mean, na.rm = TRUE)
  sd_na_rm <- partial(sd, na.rm = TRUE)
  min_na_rm <- partial(min, na.rm = TRUE)
  max_na_rm <- partial(max, na.rm = TRUE)

  to_average <- as.data.frame(variable[[trial]]) %>% select(starts_with(item))
  average <-  apply(X = to_average, MARGIN = 1 , FUN = mean_na_rm)
  std <- apply(X = to_average, MARGIN = 1 , FUN = sd_na_rm)
  min <- apply(X = to_average, MARGIN = 1 , FUN = min_na_rm)
  max <- apply(X = to_average, MARGIN = 1 , FUN = max_na_rm)

  df <- data.frame(item, average, std, min, max )
  # names(df) <- c(str_c("average", item, sep = "_"),
  #                str_c("std", item, sep = "_"))
  return(df)
}
