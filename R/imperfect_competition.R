#' Cournot Duopoly with numeric solution
#'
#' This function numerically finds the equilibrium in a Cournot duopoly model with quadratic functions. For guaranteed existence of equilibrium, cost parameters should be non-negative.
#' The general functional form for a function of argument x is \eqn{f(x) = p_0 + p_1 x + p_2 x^2}. Parameters c1 and c2 refer to firms 1 and 2. Parameters p refer to the inverse demand function.
#'
#'
#' @param c1_0 intercept of firm 1's cost function
#' @param c1_1 linear term's parameter of firm 1's cost function
#' @param c1_2 quadratic term's parameter of firm 1's cost function
#' @param c2_0 intercept of firm 2's cost function
#' @param c2_1 linear term's parameter of firm 2's cost function
#' @param c2_2 quadratic term's parameter of firm 2's cost function
#' @param p0 intercept of inverse demand function
#' @param p1 linear term's parameter of inverse demand function
#' @param p2 quadratic term's parameter of inverse demand function
#'
#'
#' @return List with market price, firm output, profits and market share
#'
#' @import rootSolve
#'
#' @examples
#'
#' cournot_solver(p0 = 20)
#'
#' @author Diego S. Cardoso, Dyson School of Applied Economics & Management, Cornell University \email{mail@@diegoscardoso.com}
#'
#' @export

cournot_solver = function(c1_0 = 0, c1_1 = 1, c1_2 = 0,
                          c2_0 = 0, c2_1 = 1, c2_2 = 0,
                          p0 = 0, p1 = -1, p2 = 0) {


    message(expr = p1 > 0,
            "p1 > 0 makes the demand curve upwards sloping")

  # Define the first order condition functions to search for a fixed point
  focs <- function(q) c(
    foc1 <-  ( (p1 + 2*p2*sum(q))*q[1] + (p0 + p1*sum(q) + p2*sum(q)^2) - (c1_1 + 2*c1_2*q[1]) ),
    foc2 <-  ( (p1 + 2*p2*sum(q))*q[2] + (p0 + p1*sum(q) + p2*sum(q)^2) - (c2_1 + 2*c2_2*q[2]) )
  )

  # A good initial guess is to set Q = 0
  q_eq <- rootSolve::multiroot(f = focs, start = c(0, 0))
  q_1 <- q_eq$root[1]
  q_2 <- q_eq$root[2]
  p <- p0 + p1*sum(q_1+q_2) + p2*sum(q_1+q_2)^2
  q <- q_1 + q_2
  q_1sh <- round(q_1/q, digits = 3)
  q_2sh <- round(q_2/q, digits = 3)
  f_1profit <- q_1*p - c1_0 - c1_1*q_1 - c1_2*q_1^2
  f_2profit <- q_2*p - c2_0 - c2_1*q_2 - c2_2*q_2^2

  results <-  list(price = p,
                   output_1 = q_1,
                   output_2 = q_2,
                   total_output = q,
                   firm1_share = q_1sh,
                   firm2_share = q_2sh,
                   firm1_profit = f_1profit,
                   firm2_profit = f_2profit)
  return(results)
}

#' Monopoly Profit Maximization
#'
#' This function numerically finds the profit-maximizing output for a monopolist with linear and non-linear cost and demand curves. For guaranteed existence of feasible solution (in which both price and output are positive), a linear demand curve might be necessary.
#'
#' @param c0 intercept of monopolist's cost function. Defaults to 0.
#' @param c1 linear term's parameter of monopolist's cost function. Defaults to 1.
#' @param c2 quadratic terms's parameter of the monopolist's cost function. Defaults to 0.
#' @param p0 intercept of inverse demand function. Defaults to 0.
#' @param p1 linear term's parameter of inverse demand function. Defaults to -1. Note that it is important to specify it as a negative number, or the demand curve will be upward sloping.
#' @param p2 quadratic terms's parameter of the demand curve. Defaults to 0.
#' @param q0 Initial guess for monopolist's output. Defaults to 0. Strongly advise not to set this parameter unless you are very aware of what you're doing.
#'
#' @return
#'
#' A list with market price, output, profits, markup, profitrate.
#'
#' @import rootSolve
#'
#' @examples
#'
#' monopoly_solver(c0 = 20, p0 = 50 )
#'
#' @author Pedro Cavalcante Oliveira, Department of Economics, Fluminense Federal University
#'
#' @export



monopoly_solver = function(c0 = 0,
                           c1 = 1,
                           c2 = 0,
                           p0 = 0,
                           p1 = -1,
                           p2 = 0,
                           q0 = 0) {

    message(expr = p1 > 0,
            "A positive p1 makes the demand curve upwards sloping. Consider setting it as a negative number.")

  # define First Order Condition (FOC) to search for a fixed point
  foc = function(q) c(p0 + 2*p1*q - c1 - 2*c2*q + 3*p2*(q^2))

  # find root of FOC, that's the system's fixed point
  q_eq = rootSolve::multiroot(f = foc,
                              start = q0)$root

  price = p0 + p1 * q_eq + p2*(q_eq^2)
  marginalcost = c1 + 2*p2*q_eq
  markup = price/marginalcost

  totalcost = c0 + c1*q_eq + c2*(q_eq^2)
  profit = price*q_eq - totalcost
  profit_rate = profit/totalcost

  results = list(price = price,
                 output = q_eq,
                 totalcost = totalcost,
                 profit = profit,
                 profit_rate = profit_rate,
                 marginalcost = marginalcost,
                 markup = markup)

  return(results)
}

#' Stackelberg Duopoly with numeric solution
#'
#' This function numerically finds the equilibrium in a Stackelberg duopoly model with linear functions. For guaranteed existence of equilibrium, cost parameters should be non-negative.
#' The general functional form for a function of argument x is \eqn{f(x) = p_0 + p_1 x}. Parameters p refer to the inverse demand function.
#' The firm indexed by "l" is the leader, and the one indexed by "f" is the follower.
#'
#' @param cl_0 intercept of leader's cost function
#' @param cl_1 linear term's parameter of leader's cost function
#' @param cf_0 intercept of follower's cost function
#' @param cf_1 linear term's parameter of follower's cost function
#' @param p0 intercept of inverse demand function. Defaults to 0.
#' @param p1 linear term's parameter of inverse demand function. Defaults to -1. Note that it is important to specify it as a negative number, or the demand curve will be upward sloping.
#' @param l0 Initial guess for leader's output. Defaults to 0. Strongly advised not to set this parameter unless you are very aware of what you're doing.
#' @param f0 Initial guess for follower's output. Defaults to 0. Strongly advised not to set this parameter unless you are very aware of what you're doing.
#'
#' @return
#'
#' A list with market price, firm output, profits and market share
#'
#' @examples
#'
#' stackelberg_solver(p0 = 30)
#'
#' @import rootSolve
#'
#' @author Pedro Cavalcante Oliveira, Department of Economics, Fluminense Federal University
#'
#' @export

stackelberg_solver = function(cl_0 = 0, cl_1 = 1,
                              cf_0 = 0, cf_1 = 1,
                              p0 = 0, p1 = -1,
                              l0 = 0, f0 = 0) {




    message(expr = p1 > 0,
            "p1 > 0 makes the demand curve upwards sloping")

  # Define the first order condition functions to search for a fixed point
  focs <- function(q) c(

    foc_l <- ( p0/2 + cf_1/2 - cl_1 + p1*q[1] ),
    foc_f <- ( p0 + p1*q[1] - cf_1 + 2*p1*q[2] )
  )

  q_eq <- rootSolve::multiroot(f = focs, start = c(l0, f0))
  q_l <- q_eq$root[1]
  q_f <- q_eq$root[2]
  p <- p0 + p1*sum(q_l + q_f)
  q <- q_l + q_f
  q_lsh <- round(q_l/q,
                 digits = 3)
  q_fsh <- round(q_f/q,
                 digits = 3)

  results <-  list(price = p,
                   leader_output = q_l,
                   follower_output = q_f,
                   total_output = q,
                   leader_share = q_lsh,
                   follower_share = q_fsh)
  return(results)
}
