#' The to_nested_colnames function store the columns of a nested list, which names contain a given pattern
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @param data A nested list
#' @param pattern A character
#' @return A \code{list} with the column numbers with names containing the pattern
#' @seealso \code{\link{sublist}}
#' @import tidyverse
#' @importFrom purrr set_names
to_nested_colnames <- function(data, pattern) {
  Trials <-  1:length(data)

  if (is.character(pattern) == TRUE){
    map(Trials,
        ~ grep(
          pattern = pattern,
          x = map(Trials, ~ colnames(data[[.]]))[[.]]))  %>%
      set_names(names(data))

  } else if (is.numeric(pattern) == TRUE){
    map(Trials, ~ colnames(data[[.]][pattern])) %>%
      set_names(names(data))
  }
}


