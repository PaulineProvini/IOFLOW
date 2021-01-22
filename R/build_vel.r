#' The build_vel function build the velocity variable, based on the computation of the velocity
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @param Trials A vector of the length of the data list (number of analysed trials)
#' @param data A list with the trajectory data
#' @param duration A number corresponding to the time lag between two data rows
#' @return A \code{list} with the column numbers with names containing the pattern
#' @import tidyverse
#' @importFrom purrr set_names
#' @import stringr
#' @seealso \code{\link{compute_velocity}}
build_vel <- function(Trials, data, duration) {
  nm <-deparse(substitute(data))
  vx <- modify_depth(.x = data,
                     .depth = 2,
                     ~ compute_velocity(data = ., duration = duration))
  vx %>%
    map(.x = Trials, .f = ~ set_names(x = pluck(.x = vx, .),
                                      nm = str_replace(string = names(pluck(.x = vx, .)),
                                                          pattern = paste0(".", nm),
                                                          replacement = str_replace(string = paste0(".", nm),
                                                                                    pattern = "t",
                                                                                    replacement = "v")))) %>%
    set_names(nm = str_replace(string = names(data),
                                  pattern =  paste0("_", nm),
                                  replacement = str_replace(string = paste0("_", nm),
                                                            pattern = "t",
                                                            replacement = "v")))

}


