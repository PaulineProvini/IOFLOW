#' @title list_to_df function
#' @author Pauline Provini <pauline.provini@gmail.com>
#'
#' @description Transform a nested list to a dataframe
#'
#' @param list a \code{list} to transform into a dataframe
#' @param id.vars a \code{vector} of id variables. Can be integer (variable position) or string (variable name). If blank, will use all non-measured variables.
#' @param replace_by a \code{vector} of 2 \code{string} the first item corresponding to the value to replace, the second item corresponding to the replacement string
#' @param replace_L1 a \code{string} replacing the "L1" column name of the new dataframe
#' @param replace_L2 a \code{string} replacing the "L2" column name of the new dataframe
#' @seealso [melt()] for argument details (L1, L2)
#'
#' @return A \code{data.frame}
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr
#' @import reshape2
#'
#' @export

list_to_df <- function(list, id.vars, replace_by = c("value.", ""), replace_L1 = "L1",  replace_L2= "L2" ) {


  DF <- melt(data = list,
                   id.vars=id.vars)
  if("value" %in% colnames(DF)) {
      DF <- subset(DF, select=-c(variable,value))
    }

  names(DF) <- gsub(replace_by[1], replace_by[2], names(DF))
  names(DF) <- gsub("L1", replace_L1, names(DF))
  names(DF) <- gsub("L2", replace_L2, names(DF))



  return(DF)
}

