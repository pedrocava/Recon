#' Cournot Duopoly with numeric solution
#'
#' This function numerically finds the equilibrium in a Cournot duopoly model with quadratic functions. For guaranteed existence of equilibrium, the parameters should be non-negative.
#' The general functional form for a function of argument x is f(x) = p_0 + p_1 * x + p_2 * x^2. Parameters c1 and c2 refer to firms 1 and 2. Parameters p refer to the inverse demand function.
#' @param c1_0 intercept of firm 1's cost function
#' @param c1_1 linear term of firm 1's cost function
#' @param c1_2 quadratic term of firm 1's cost function
#' @param c2_0 intercept of firm 2's cost function
#' @param c2_1 linear term of firm 2's cost function
#' @param c2_2 quadratic term of firm 2's cost function
#' @param p_0 intercept of inverse demand function
#' @param p_1 linear term of inverse demand function
#' @param p_2 quadratic term of inverse demand function
#' @keywords microeconomics imperfect competition
#' @export
#' @examples
#' cournot_2_numeric()

cournot_2_numeric = function(c1_0 = 0, c1_1 = 1, c1_2 = 0,
                     c2_0 = 0, c2_1 = 1, c2_2 = 0,
                     p_0 = 0, p_1 = -1, p_2 = 0) {

  require(rootSolve)

  # Define the first order condition functions to search for a fixed point
  focs <- function(q) c(
      foc1 = ( (p_1 + 2*p_2*sum(q))*q[1] + (p_0 + p_1*sum(q) + p_2*sum(q)^2) - (c1_1 + 2*c1_2*q[1]) ),
      foc2 = ( (p_1 + 2*p_2*sum(q))*q[2] + (p_0 + p_1*sum(q) + p_2*sum(q)^2) - (c2_1 + 2*c2_2*q[2]) )
    )

  # A good initial guess is to set Q = 0
  q_eq <- multiroot(f = focs, start = c(0, 0))

  q_1 <- q_eq$root[1]
  q_2 <- q_eq$root[2]
  p <- p_0 + p_1*sum(q_1+q_2) + p_2*sum(q_1+q_2)^2

  results = list("price" = p,
                 "output_1" = q_1,
                 "output_2" = q_2)
}
