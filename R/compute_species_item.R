#' @title compute_species_item
#' @description compute_species_item computes the mean and standard deviation of the cumulative
#'  distance over all the items of a trial (if item = water, the cumulative distance will be averaged
#'  over all the water tracers of the trial)
#'
#' @param species A \code{string} corresponding to the species, either "carp" or "tilapia"
#' @param item A \code{string} corresponding to the item, either "food" or "water"
#' @param name A \code{string} corresponding to the name of the variable to store the mean and sd data
#' @return A \code{list}
#' @importFrom  stats sd
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr

compute_species_item <- function(species = c("carp", "tilapia"), item =c("food", "water"), name){

  my_mean <- partial(mean, na.rm = TRUE)
  my_sd <- partial(sd, na.rm = TRUE)

  if (species == "carp"){
    species <- "C"  }
  if (species == "tilapia"){
    species <- "T"  }
  if (item == "food"){
    item <- "A"  }
  if (item == "water"){
    item <- "F"  }

  # by species
  trial_by_species <- names(Sum_dist_WF)[starts_with(match = species, vars = names(Sum_dist_WF))]
  Species <- map(.x = trial_by_species, .f = ~get_sublist(lst = Sum_dist_WF, group_name = . )) %>% flatten

  Species_item <- map(.x = trial_by_species, .f = ~select(Species[[.]], starts_with(item))) %>%
    set_names(trial_by_species)

  nm1 <- print(paste0(name, "_mean"), quote=FALSE)
  nm2 <- print(paste0(name, "_sd"), quote=FALSE)

  Species_item <- map(.x = trial_by_species,
                      ~set_names(x = pluck(.x =
                                             mapply(FUN = list,
                                                    map(.x = trial_by_species,
                                                        ~apply(X = as.data.frame(Species_item[[.]]),
                                                               MARGIN = 1 , FUN = my_mean)) %>% set_names(trial_by_species),
                                                    map(.x = trial_by_species,
                                                        ~apply(X = as.data.frame(Species_item[[.]]),
                                                               MARGIN = 1 , FUN = my_sd)) %>% set_names(trial_by_species),
                                                    SIMPLIFY=FALSE),.),
                                 nm = c(nm1, nm2))) %>% set_names(trial_by_species)


  return(Species_item)

}

