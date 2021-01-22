#' @title build_particle function
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @description Organize the data into Trials and Particle names with tx, ty, tz as columns
#'
#' @param data a list corresponding to the Traj dataset for a given trial
#' @param sequ sequence corresponding to the column number corresponding to tx on the Traj dataset of a given trial

#' @return A \code{list} of all the particles of a given trial, organizes in list of tx, ty, tz
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr
#' @export


build_particle <- function(data, sequ){
  Particle <- list()
  for (i in 1: length(sequ)){
    Particle[[i]] <- data[c(sequ[i]:(sequ[i]+2))]
  }

  Particle <- Particle %>% set_names(substr(x=names(data %>%  select(ends_with("tx"))),
                                            start = 1, stop = 3))


  return(Particle)
}
