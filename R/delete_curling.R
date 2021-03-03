#' @title delete_curling function
#'
#' @description clean the particles that circle back towards the entrance of
#the mouth (using lag)
#'
#' @param data a \code{data.frame} with variables named "WF_tx", "WF_ty", "WF_tz","Grp"
#' @param Particles a \code{vector} corresponding to the Particles names to clean
#' @param trial an \code{integer} corresponding to the trial number to clean
#'
#' @return a \code{data.frame} with the cleaned data (same variables)
#' @import tidyverse
#' @import purrr
#' @import stringr
#' @import dplyr
#'
#'
#' @export
#'

delete_curling <- function(data, Particles, trial) {

  Curling <- list()
  data_cut_clean <- 0
  for (i in 1:length(Particles)){
    Data <- data[which(data$Grp == Particles[i]),]
    Curling[[i]] <- which(diff(x = Data$WF_tx, lag = 1)>0)[1] #beginning of curling
    if (is.na(Curling[[i]]) == TRUE) { Curling[[i]] = nrow(Data) }

    Data <- Data[1: Curling[[i]],]
    data_cut_clean <- rbind(data_cut_clean, Data)
  }

  data_cut_clean <- data_cut_clean[-1,] # to delete the initial frame

  # data_cut_clean$WF_tx_pcent <- 100 - data_cut_clean$WF_tx/
  #   (max(data_cut_clean$WF_tx, na.rm=TRUE ))*100

  return(data_cut_clean)

}

