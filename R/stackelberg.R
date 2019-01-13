#' Stackelberg Duopoly with numeric solution
#'
#' This function numerically finds the equilibrium in a Stackelberg duopoly model with linear functions. For guaranteed existence of equilibrium, the parameters should be non-negative.
#' The general functional form for a function of argument x is f(x) = p_0 + p_1 x + p_2 x^2. Parameters p refer to the inverse demand function.
#' The firm indexed by "l" is the leader, and the one indexed by "f" is the follower.
#' @param cl_0 intercept of leader's cost function
#' @param cl_1 linear term's parameter of leader's cost function
#' @param cf_0 intercept of follower's cost function
#' @param cf_1 linear term's parameter of follower's cost function
#' @param p_0 intercept of inverse demand function. Defaults to 0.
#' @param p_1 linear term's parameter of inverse demand function. Defaults to -1.
#' @param l0 Initial guess for leader's output. Defaults to 0. Strongly advise not to set this parameter unless you are very aware of what you're doing.
#' @param f0 Initial guess for follower's output. Defaults to 0. Strongly advise not to set this parameter unless you are very aware of what you're doing.
#' @import rootSolve
#' @export

stackelberg_linear_solver = function(cl_0 = 0, cl_1 = 1,
                   cf_0 = 0, cf_1 = 1,
                   p_0 = 0, p_1 = -1,
                   l0 = 0, f0 = 0) {

  requireNamespace(rootSolve)
  rootSolve = rootSolve

  # Define the first order condition functions to search for a fixed point
  focs <- function(q) c(

    foc_l <- ( p_0/2 + cf_1/2 - cl_1 - p_1*q[1] ),
    foc_f <- ( p_0 + p_1*q[1] - cf_1 -2*p_1*q[2] )
  )

  q_eq <- rootSolve::multiroot(f = focs, start = c(l0, f0))
  q_l <- q_eq$root[1]
  q_f <- q_eq$root[2]
  p <- p_0 + p_1*sum(q_l + q_f)
  q <- q_l + q_f
  q_lsh <- q_l/q
  q_fsh <- q_f/q

  results <-  list(price = p,
                   leader_output = q_l,
                   follower_output = q_f,
                   total_output = q,
                   leader_share = q_1sh,
                   follower_share = q_2sh)
  print(results)
}
