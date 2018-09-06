#' Cournot Duopoly
#'
#' This function a Cournot duopoly model. One should provide demand and cost functions and the function returns the solution to the problem.
#' @param cost1 is a cost function. cost1 is provided in this package.
#' @param cost1_q2 is a cost function. cost2 is provided in this package.
#' @param demand is an inverse demand curve. demand is also provided in this package.
#' @keywords microeconomics imperfect competition
#' @export
#' @examples
#' cournot_2()



 cournot_2 = function(cost1, cost2, demand){
   require(Deriv)
   
   mg_cost1 = Deriv(cost1)
   mg_cost2 = Deriv(cost2)
   
   profit1 = multiply(mg_cost1,demand) - cost1
   profit2 = multiply(mg_cost2,demand) - cost2
 
   mg_profit1 = Deriv(profit1, x = q1)
   mg_profit2 = Deriv(profit2, x = q2)
   
  q1 = uniroot(mg_profit1, lower = - 10000, upper = 10000)
  q2 = uniroot(mg_profit2, lower = - 10000, upper = 10000)
   q = q1 + q2
   
  p = demand(q)
  } 
  
  
