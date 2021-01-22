#' @title get_sublist
#' @description get a list in a nested list, based on the name of the nested variable
#' @author Pauline Provini
#'
#' @param lst The \code{list} from which to extract the sublist
#' @param group_name \code{character} corresponding to the name of the variable we want to extract
#' @return a \code{list}

get_sublist <- function(lst, group_name) {
  lst[names(lapply(lst, function(x) x[[1]][])) == group_name]
}
