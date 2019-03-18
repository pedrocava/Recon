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
    sgms                                    html  
    sgps                                    html  
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


Features that are currently under work:

* Solution to a Bertrand Duopoly Model with differentiated goods
* Solution to a Cournot Oligpoly with n firms and homogenous cost functions

