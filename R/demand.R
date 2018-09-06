#' Inverse demand curve
#'
#' This function provides a general inverse demand curve in a symbolic of numeric manner. Needed to use some functions of this package.
#' @param q is total output.
#' @param p_0 is the demand curve intercept. 
#' @param a is dq/dP. Defaults to 1.
#' @param b is the response to the quadratic q term. Defaults to 0.
#' @keywords microeconomics imperfect competition
#' @export
#' @examples
#' demand()



demand = function(q = Var("q"), p_0, a = 1, b = 0) 
{ require(rSymPy)
  p_0 + a*q + b*q^2 }