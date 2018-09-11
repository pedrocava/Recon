#' Cournot Duopoly
#'
#' This function a Cournot duopoly model. One should provide demand and cost functions and the function returns the solution to the problem.
#' @param firm1 is a cost function. cost1 is provided in this package.
#' @param firm2 is a cost function. cost2 is provided in this package.
#' @param demand is an inverse demand curve. demand is also provided in this package.
#' @keywords microeconomics imperfect competition
#' @export
#' @examples
#' cournot_2()

cournot_2 = function(q0_1 = 0, c1 = 1, c1_2 = 0,
                     q0_2 = 0, c2 = 1, c2_2 = 0,
                     p_0, a = 1, b = 0) {
  
  firm1 = call(0_1 + c1 * q1 + c1_2 * q1)
  firm2 = call(q0_2 + c2 * q2 + c2_2 * q2)
  q = call(q1 + q2)
  
  demand = call(p_0 + a*q + b * q^2)
  
  mg_cost1 = D(firm1, q1)
  mg_cost2 = D(firm2, q2)
  
  dem = demand(q)
  
  profit1 = multiply(mg_cost1,dem) - firm1
  profit2 = multiply(mg_cost2,dem) - firm2
  
  mg_profit1 = D(profit1, q1)
  mg_profit2 = D(profit2, q2)
  
  q1_opt = uniroot(mg_profit1, c( - 1000000, 1000000))
  q2_opt = uniroot(mg_profit2, c( - 1000000, 1000000))
  
  q1sh = q1_opt / q
  q2sh = q2_opt / q
  
  p = demand(q)
  
  
  results = list("price" = p,
                 "total output" = q,
                 q1_share = q1sh,
                 q1_share = q2sh)
}
