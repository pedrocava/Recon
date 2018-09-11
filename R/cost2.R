#' Cost function
#'
#' This function provides a general cost curve in a symbolic of numeric manner. Needed to use some functions of this package.
#' @param q2 is output.
#' @param q0_2 is the firm's fixed cost. Defatults to 0.
#' @param c2 is linear marginal cost. Defatults to 1.
#' @param c2_2 is the quadratic term's coefficient. Defaults to zero.
#' @keywords microeconomics imperfect competition
#' @export
#' @examples
#' cost2()



cost2 = q0_2 + c2*q2 + c2_2*q2
  

