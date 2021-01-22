#' @title plot_mean
#' @description plot_Mean function plots the mean and standard deviation of a given variable
#'
#' @param d The dataframe returned by the mean_particles function (2 columns: mean and sd)
#' @param xlab a \code{string} with the name of the x axis
#' @param ylab a \code{string} with the name of the y axis
#' @param subtitle a \code{string} with the name of the subtitle
#' @param color a \code{vector} with the colors used in the plot
#'
#' @return A plot
#' @import ggplot2

plot_mean <- function(d, ylab="", xlab="",subtitle="", color = c("black", p1[5])) {
  p <- ggplot(data = d,
              aes(
                x = time,
                y =  average,
                ymin = (average + std),
                ymax = (average - std), group=item
              )) +
    geom_line(aes(colour = item), size= 1) +
    geom_ribbon(aes(fill = item), alpha = 0.3, size= 1) +
    ylab(ylab) +
    xlab(xlab) +
    theme_minimal()+
    theme(legend.position = "none")+
    scale_color_manual(values = color)+
    scale_fill_manual(values =  color)+
    labs(subtitle = subtitle )

  return(p)

}
