#' Cournot Duopoly with numeric solution
#'
#' This function numerically finds the equilibrium in a Cournot duopoly model with quadratic functions. For guaranteed existence of equilibrium, cost parameters should be non-negative.
#'
#'
#' @param firm1 a vector of cost curve coefficients, which must be in order: intercept of firm 1's cost function, linear term's parameter of firm 1's cost function and quadratic term's parameter of firm 1's cost function
#' @param firm2 a vector of cost curve coefficients, which must be in order: intercept of firm 2's cost function, linear term's parameter of firm 2's cost function and quadratic term's parameter of firm 2's cost function
#' @param demand a vector of demand curve coefficients, which must be in order: intercept of inverse demand function, linear coefficient, secon degree coefficient
#'
#'
#' @return List with market price, firm output, profits and market share
#'
#' @import rootSolve
#'
#' @examples
#'
#' d = c(20,-1,0)
#' cournot_solver(demand = d)
#'
#' @author Diego S. Cardoso, Dyson School of Applied Economics & Management, Cornell University \email{mail@@diegoscardoso.com}
#'
#' @export

cournot_solver = function(firm1 = c(0,1,0),
                          firm2 = c(0,1,0),
                          demand = c(0,-1,0)) {


    p0 = demand[1]
    p1 = demand[2]
    p2 = demand[3]

    c1_0 = firm1[1]
    c1_1 = firm1[2]
    c1_2 = firm1[3]

    c2_0 = firm2[1]
    c2_1 = firm2[2]
    c2_2 = firm2[3]



    if(p1 > 0) {
            message("p1 > 0 makes the demand curve upwards sloping")
    }
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
#' @param cost a vector of cost curve coefficients, which must be in order: intercept of the cost function, linear term's parameter of the cost function and quadratic term's parameter of the cost function
#' @param demand a vector of demand curve coefficients, which must be in order: intercept of inverse demand function, linear coefficient, secon degree coefficient
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
#'
#' c = c(50, 3, 1)
#' p = c(500, -8, -1)
#' monopoly_solver(cost = c, demand = p)
#'
#' @author Pedro Cavalcante Oliveira, Department of Economics, Fluminense Federal University \email{pedrocolrj@@gmail.com}
#'
#' @export



monopoly_solver = function(cost = c(0,1,0),
                           demand = c(0,-1,0),
                           q0 = 0) {


  p0 = demand[1]
  p1 = demand[2]
  p2 = demand[3]

  c0 = cost[1]
  c1 = cost[2]
  c2 = cost[3]


  if(p1 > 0) {
    message("p1 > 0 makes the demand curve upwards sloping")
  }

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
#' @param leader vector of coefficients of the leader's cost function which in order must be: intercept of leader's cost function and linear term's parameter of leader's cost function
#' @param follower vector of coefficients of the follower's cost function which in order must be: intercept of intercept of follower's cost function linear term's parameter of follower's cost function
#' @param demand vector of coefficients of the market demand curve. Must be, in order, intercept and linear coefficient.
#' @param l0 Initial guess for leader's output. Defaults to 0. Strongly advised not to set this parameter unless you are very aware of what you're doing.
#' @param f0 Initial guess for follower's output. Defaults to 0. Strongly advised not to set this parameter unless you are very aware of what you're doing.
#'
#' @return
#'
#' A list with market price, firm output, profits and market share
#'
#' @examples
#'
#' l = c(100, 4)
#' f = c(120, 5)
#' p = c(300, -10)
#' stackelberg_solver(leader = l, follower = f, demand = p)
#'
#' @import rootSolve
#'
#' @author Pedro Cavalcante Oliveira, Department of Economics, Fluminense Federal University \email{pedrocolrj@@gmail.com}
#'
#' @export

stackelberg_solver = function(leader = c(0,1),
                              follower = c(0,1),
                              demand = c(0,-1),
                              l0 = 0, f0 = 0) {

  p0 = demand[1]
  p1 = demand[2]


  cl_0 = leader[1]
  cl_1 = leader[2]


  cf_0 = follower[1]
  cf_1 = follower[2]



  if(p1 > 0) {
    message("p1 > 0 makes the demand curve upwards sloping")
  }

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
