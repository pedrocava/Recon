# Recon - Economics with R

This package aims to provide undergraduate students and teachers realiable ways of computing and exploring canonical models in economics. 

# Installation

You can install the latest version of ``Recon`` by running:

``` r
install.packages('devtools')
devtools::install_github('pedrocava/Recon')
```

# Usage
So far, the package covers:

* Steady state solution to the model presented in Solow (1956)
* Steady state solution to the model presented in Mankiw, Romer and Weil (1992)
* Computing Cobb-Douglas functions with 2 inputs
* Computing Cobb-Douglas functions with $n$-inputs
* Grid generating function, so one can map results easily
* Finds the Pure Strategies Nash Equilibrium of a 2 person simultaneous game 
* Finds the Mixed Strategies Nash Equilibrium of a 2 person simultaneous game, for 2x2 pay-off matrices
* Solution to a Cournot Duopoly Model, with linear and non-linear cost and demand curves
* Solution to a Stackelberg Duopoly Model, with non-linear cost curves
* Solution to Monopoly Profit Maximization 


Things that are currently under work:

* Solution to a Bertrand Duopoly Model with differentiated goods
* Solution to a Cournot Oligpoly with n firms and homogenous cost functions
