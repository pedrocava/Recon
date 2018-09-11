#' Cost function
#'
#' This function provides a general cost curve in a symbolic of numeric manner. Needed to use some functions of this package.
#' @param q1 is output.
#' @param q0_1 is the firm's fixed cost. Defatults to 0.
#' @param c1 is linear marginal cost. Defatults to 1.
#' @param c1_2 is the quadratic term's coefficient. Defaults to zero.
#' @keywords microeconomics imperfect competition
#' @export
#' @examples
#' cost1()



cost1 = function(q1 = q1,
                 q0_1 = 0,
                 c1 = 1,
                 c1_2 = 0) {
  
  q0_1 + c1*q1 + c1_2*q1
  
}
