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



 cournot_2 = function(firm1, firm2, demand){
   require(Deriv)
   require(rSymPy)

   mg_cost1 = Deriv(firm1)
   mg_cost2 = Deriv(firm2)

   profit1 = multiply(mg_cost1,demand) - firm1
   profit2 = multiply(mg_cost2,demand) - firm2

   mg_profit1 = Deriv(profit1, x = q1)
   mg_profit2 = Deriv(profit2, x = q2)

  q1 = uniroot(mg_profit1, lower = - 10000, upper = 10000)
  q2 = uniroot(mg_profit2, lower = - 10000, upper = 10000)
   q = q1 + q2

   q1sh = q1 / q
   q2sh = q2 / q

   p = demand(q)


  results = list(p = price, q = "total output", q1sh = q1sh, q1sh = q2sh)
  }


