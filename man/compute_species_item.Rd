% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_species_item.R
\name{compute_species_item}
\alias{compute_species_item}
\title{compute_species_item}
\usage{
compute_species_item(
  species = c("carp", "tilapia"),
  item = c("food", "water"),
  name
)
}
\arguments{
\item{species}{A \code{string} corresponding to the species, either "carp" or "tilapia"}

\item{item}{A \code{string} corresponding to the item, either "food" or "water"}

\item{name}{A \code{string} corresponding to the name of the variable to store the mean and sd data}
}
\value{
A \code{list}
}
\description{
compute_species_item computes the mean and standard deviation of the cumulative
distance over all the items of a trial (if item = water, the cumulative distance will be averaged
over all the water tracers of the trial)
}
