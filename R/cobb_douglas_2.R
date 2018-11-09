#' 2 inputs Cobb-Douglas Model
#'
#' This function allows you to compute a Cobb-Douglas production/ utility function with two inputs/goods.
#' @param x is a data frame with two columns.
#' @param alpha is the first input's elasticity. Defaults to a random number between 0 and 1, rounded to two digits.
#' @param beta is the second input's elasticity. Defaults to 1 - alpha.
#' @export


cobb_douglas_2 <- function(x,
                           TFP = 1,
                           alpha = round(runif(n=1,
                                               min=0,
                                               max=1), digits = 2),
                           beta = 1 - alpha) {
  y = vector()

  for (i in 1:nrow(x)) {

    y[i] = TFP * x[i,1]^alpha * x[i,2]^beta

  }
  cobb.douglas = list(y = y,
                      alpha = alpha,
                      beta = beta)
  print(cobb.douglas)
}
