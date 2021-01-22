#' @title plot_RB
#' @description plot_RB function plots the traces of the Rigid Body data
#'
#' @param trial The trial to plot
#' @param RB_name The name of the rigid body to plot
#' @param component The component to plot
#' @return A plot
#' @import ggplot2


plot_RB <- function(trial, RB_name, component=c("tx", "ty", "tz", "rx", "ry", "rz")){
  if (component=="tx"){ column = 1}
  if (component=="ty"){ column = 2}
  if (component=="tz"){ column = 3}
  if (component=="rx"){ column = 4}
  if (component=="ry"){ column = 5}
  if (component=="rz"){ column = 6}
  ggplot(data = Phase[[trial]],
         aes(
           x = Timing[[trial]]$time,
           y = RB[[trial]][[RB_name]][,column])) +
    geom_point(aes(colour = phase), size = 1) +
    ylab(paste(RB_name,component, sep=' ')) +
    xlab("time") +
    scale_color_manual(values = p1)+
    scale_fill_manual(values =  p1)+
    theme_minimal()+
    theme(legend.position = "none", axis.text.y = element_blank())

}
