#' @title delete_beginning function
#'
#' @description clean the particles (passed the entrance of the mouth)
#'
#' @param data a \code{data.frame} corresponding to FS_trial with at least
#'   variables named "WF_tx", "WF_ty", "WF_tz","Grp"
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


delete_beginning <- function(data, trial) {

  # Carps
  if (str_starts(string = names(Maya_WF)[trial], pattern = "C1")) {

    data_cut <- data %>% filter(WF_tx > 0) %>%
      filter(WF_tx < 5.5) }

  if (str_starts(string = names(Maya_WF)[trial], pattern = "C2")) {

    data_cut <- data %>% filter(WF_tx > 0) %>%
      filter(WF_tx < 4) }

  # Tilapias
  if (str_starts(string = names(Maya_WF)[trial], pattern = "T1")) {

    data_cut <- data %>% filter(WF_tx > 0) %>%
      filter(WF_tx < 4) }

  if (str_starts(string = names(Maya_WF)[trial], pattern = "T2")) {

    data_cut <- data %>% filter(WF_tx > 0) %>%
      filter(WF_tx < 5) }

  return(data_cut)

 }

