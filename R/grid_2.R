#' Cobb-Douglas Model
#'
#' This function creates a grid (more especifically, a 2-cell) of coordinates in R^2. Useful for plotting and generating data points with which to apply some functions. 
#' @param a is the grid's lower bound. Defaults to 0.
#' @param b is the grid's upper bound. Defaults to 100.
#' @keywords microeconomics
#' @export
#' @examples
#' grid.2()

grid.2 <- function(a=0, b=100) {

x = vector()
y = vector()

x = seq(from = a,
          to = b,
            by = .5)

x = sort(rep(x,length(x)),
         decreasing = FALSE) 

y = seq(from = a,
          to = b,
            by = .5) 

y = rep(y,
        length(y)) 

return(data.fram(x,y))

}