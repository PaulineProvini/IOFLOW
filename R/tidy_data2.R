#' @title tidy_data2
#' @description tidy_data2 combines two lists, keeping the names of nested lists
#' @param Trials A \code{vector} corresponding to a sequence from 1 to the number of trials
#' @param data1 A \code{list} of the same length as Trials
#' @param data2 A \code{list} of the same length as Trials
#' @return A \code{list}
#' @import tidyverse
#' @import purrr


tidy_data2 <- function(Trials, data1, data2) {

  nm1 <-deparse(substitute(data1))
  nm2 <-deparse(substitute(data2))

  map(.x = Trials,
      ~set_names(x = pluck(.x =
                             mapply(FUN = list, data1, data2,  SIMPLIFY=FALSE),.),
                 nm = c(nm1, nm2))) %>% set_names(names(data1))

}
