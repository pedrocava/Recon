% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Nash_Equilibrium.R
\name{sim_nasheq}
\alias{sim_nasheq}
\title{Simultaneous Games Strategies Nash Equilibria}
\usage{
sim_nasheq(a, b, type = "pure")
}
\arguments{
\item{a}{The row player's payoff matrix.}

\item{b}{The column player's payoff matrix.}

\item{type}{The type of equilibrium to calculate. Can be either "pure" or "mixed". Defaults to ``pure``.}
}
\value{
List with all Nash Equilibria
}
\description{
This function finds the Nash equilibrium in mixed or pure strategies of a 2-person simultaneous game.
}
\examples{

a = matrix(c(-8, -10, 0, -1), nrow = 2)
b = matrix(c(-8, 0, -10, -1), nrow = 2)
sim_nasheq(a, b)
sim_nasheq(a, b, "mixed")

}
\author{
Marcelo Gelati, National Institute of Pure and Applied Mathematics (IMPA) \email{marcelogelati@gmail.com}
}
