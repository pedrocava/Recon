#' Cournot Duopoly
#'
#' This function solves analitically a Cournot Duopoly model. One should provide demand and cost functions and the function returns the solution to the problem.
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

  firm1 = quote(q0_1 + c1 * q1 + c1_2 * q1 ** 2) ## firm 1's cost curve
  firm2 = quote(q0_2 + c2 * q2 + c2_2 * q2 ** 2) ## firm 2's cost curve

  demand = quote(p_0 + a*q + b * (q1 + q2)^2) # market demand curve

  mg_cost1 = D(firm1, "q1") #firm 1's marginal cost/ supply curve
  mg_cost2 = D(firm2, "q2") # firm 2's marginal cost/ supply curve

  profit1 = quote((p_0 + a*q + b * (q1 + q2)^2)*(c1+c1_2*(2*q1)) -1*(q0_1 + c1 * q1 + c1_2 * q1 ** 2)) #each firm's profit curve
  profit2 = quote((p_0 + a*q + b * (q1 + q2)^2)*(c2+c2_2*(2*q2)) -1*(q0_2 + c2 * q2 + c2_2 * q2 ** 2))

  mg_profit1 = function() {D(profit1, "q1")} #marginal profits
  mg_profit2 = function() {D(profit2, "q2")}

  q1_opt = uniroot(mg_profit1) # locates optimal production
  q2_opt = uniroot(mg_profit2)

  q = q1_opt + q2_opt

  q1sh = q1_opt / q #calculates each firm's market share
  q2sh = q2_opt / q

  p = demand(q) #calcula o preço de mercado


  results = list("price" = p,
                 "total output" = q,
                 q1_share = q1sh,
                 q1_share = q2sh) #assembles a list
}
