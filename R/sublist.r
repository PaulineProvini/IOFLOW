#' sublist
#' Extract a list from a nested list
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @param data A nested list
#' @param pattern A character
#' @return A \code{list}
#' @seealso \code{\link{to_nested_colnames}}
#' @importFrom purrr set_names
#' @examples
#' \dontrun{
#'Traj <- lapply(MayaWaterFood, subset, select=-1)
#'tx <- sublist(Traj, "tx")
#'}

sublist <- function(data, pattern){
  Trials <-  1:length(data)
  map(.x = Trials, ~data[[.]][to_nested_colnames(data, pattern)[[.]]]) %>%
    set_names(names(data))}
