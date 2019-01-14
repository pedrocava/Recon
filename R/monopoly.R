#' Monopoly Profit Maximization
#'
#' This function numerically finds the profit-maximizing output for a monopolist wih linear and non-linear cost and demand curves. For guaranteed existence of feasible solution (in which both price and output are positive), a linear demand curve might be necessary.
#' @param c0 intercept of monopolist's cost function. Defaults to 0.
#' @param c1 linear term's parameter of monopolist's cost function. Defaults to 1.
#' @param c2 quadratic terms's parameter of the monopolist's cost function. Defaults to 0.
#' @param p0 intercept of inverse demand function. Defaults to 0.
#' @param p1 linear term's parameter of inverse demand function. Defaults to -1. Note that it is important to specify it as a negative number, or the demand curve will be upward sloping.
#' @param p2 quadratic terms's parameter of the demand curve. Defaults to 0.
#' @param q0 Initial guess for monopolist's output. Defaults to 0. Strongly advise not to set this parameter unless you are very aware of what you're doing.
#' @import rootSolve
#' @export



monopoly_solver = function(c0 = 0,
                           c1 = 1,
                           c2 = 0,
                           p0 = 0,
                           p1 = -1,
                           p2 = 0) {

  if (p1 > 0)
    warning("A positive p1 makes the demand curve upwards sloping. Consider setting it as a negative number.")


  foc = function(q) c(p0 + 2*p1*q - c1 - 2*c2*q + 3*p2*(q^2))

  q_eq = rootSolve::multiroot(f = foc,
                              start = q0)

  price = p0 + p1*q_eq + p2*(q_eq^2)
  marginalcost = c1 + 2*p2*q_eq
  markup = price/marginalcost
  abs_elasticity = 1 - (price/marginalcost)

  totalcost = c0 + c1*e_eq + c2*(q_eq^2)
  profit = price*e_eq - totalcost
  profit_rate = profit/totalcost

  results = list(price = price,
                 output = e_eq,
                 totalcost = totalcost,
                 profit = profit,
                 profit_rate = profit_rate,
                 marginalcost = marginalcost,
                 markup = markup,
                 abs_elasticity = abs_elasticity)

  return(results)
  }
