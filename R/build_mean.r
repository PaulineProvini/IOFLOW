#' The build_mean function build the mean variable, based on the computation of the mean
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @param Trials A vector of the length of the data list (number of analysed trials)
#' @param data A list with the trajectory data
#' @param item A character corresponding to the type of tracers we are refering to, either "F" for water or "A" for food
#' @return A \code{list} with the column numbers with names containing the pattern
#' @import tidyverse
#' @importFrom  purrr set_names
#' @seealso \code{\link{compute_velocity}}
#' @examples
#' \dontrun{
#' build_mean(Trials, WF_tx, item="F")
#' }

build_mean <- function(Trials, data, item) {
  
  map(.x = Trials, .f = ~mean_particles(trial = ., variable = data, item = item)) %>%
    set_names(names(data))
  
}
