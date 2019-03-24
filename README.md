[![Build Status](https://travis-ci.org/pedrocava/Recon.svg?branch=master)](https://travis-ci.org/pedrocava/Recon)


# Recon - Economics with R

This package aims to provide undergraduate students and professors realiable ways of computing and exploring canonical models in economics. It creates a rich enviroment for comparative statics, visualization of results and better understanding of model outcomes.

# Installation

You can install the latest version of ``Recon`` by running:

``` r
install.packages('devtools')
devtools::install_github('pedrocava/Recon')
```

Which should return something similar to:

``` r
Installing package into ‘C:/Users/Pedro/Documents/R/win-library/3.5’
(as ‘lib’ is unspecified)
* installing *source* package 'Recon' ...
** R
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
  converting help for package 'Recon'
    finding HTML links ... done
    MRW_steady_state                        html  
    cobb_douglas                            html  
    cobb_douglas_2                          html  
    cournot_solver                          html  
    grid2                                   html  
    monopoly_solver                         html  
    sim_mixed_nasheq                        html  
    sim_pure_nasheq                         html  
    solow_steady_state                      html  
    stackelberg_solver                      html  
** building package indices
** testing if installed package can be loaded
*** arch - i386
*** arch - x64
* DONE (Recon)
In R CMD INSTALL
```

Please note that you should have [Rtools](http://cran.r-project.org/bin/windows/Rtools/) installed. 

# Features by theme

To get a general view of what's implemented in ``Recon`` directly from R you can run:

``` r
help(package = Recon)
```

## Economic Growth

* Steady state solution to the model presented in Solow (1956)
* Steady state solution to the model presented in Mankiw, Romer and Weil (1992)

## Cobb-Douglas Functions

* Computing Cobb-Douglas functions with 2 inputs
* Computing Cobb-Douglas functions with $n$-inputs

## Miscellaneous
* Grid generating function, so one can map results easily

## Game Theory
* Finds the Pure Strategies Nash Equilibrium of a 2 person simultaneous game 
* Finds the Mixed Strategies Nash Equilibrium of a 2 person simultaneous game, for 2x2 pay-off
matrices

## Imperfect Competition
* Solution to a Cournot Duopoly Model, with linear and non-linear cost and demand curves
* Solution to a Stackelberg Duopoly Model, with non-linear cost curves
* Solution to Monopoly Profit Maximization 


# Upcoming Features and Suggestions

Feel free to ask/suggest a model for implementation. If you want to implement one youself, fork this repo and then do a pull request with your new functions. After reviewing, you'll be credited and your functions will be part of ``Recon``. Features that are currently under work:

* Solution to a Bertrand Duopoly Model with differentiated goods
* Solution to a Cournot Oligpoly with n firms and homogenous cost functions

# Documentation and Examples

Example coverage by group:

| Group                          | Example Coverage |
|--------------------------------|------------------|
| Imperfect Competition          |Covered           |
| Growth Models and Steady State |Covered           | 
| Cobb-Douglas Functions         |Covered           | 
| Nash Equilibrium               |Covered           | 
| Misc.                          |Covered           |  

