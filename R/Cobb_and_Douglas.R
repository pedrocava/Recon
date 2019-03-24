#' 2 inputs Cobb-Douglas Model
#'
#' This function allows you to compute a Cobb-Douglas production/ utility function with two inputs/goods.
#'
#' @param x is a data frame with two columns.
#' @param alpha is the first input's elasticity. Defaults to a random number between 0 and 1, rounded to two digits.
#' @param beta is the second input's elasticity. Defaults to 1 - alpha.
#' @param TFP is the constant of the model. Defaults to 1.
#'
#' @return Returns a list object with compued y and elasticities.
#'
#' @examples
#'
#' x <- c(3, 4, 5)
#' y <- c(1, 4, 2)
#'
#' data <- data.frame(x = x, y = y)
#'
#' cobb_douglas_2(data)
#'
#'
#' @author Pedro Cavalcante Oliveira, Department of Economics, Fluminense Federal University
#'
#' @export


cobb_douglas_2 <- function(x,
                           TFP = 1,
                           alpha = .5,
                           beta = 1 - alpha) {
  y = vector()

  for (i in 1:nrow(x)) {

    y[i] = TFP * x[i,1]^alpha * x[i,2]^beta

  }
  results = list(y = y,
                 alpha = alpha,
                 beta = beta)

  return(results)
}


#' Cobb-Douglas Model
#'
#' This function allows you to compute a Cobb-Douglas production/ utility function with n inputs/goods.
#'
#' cobb_douglas_2 computes what - mathematically - is a particular case of this function, but computationally there are differentes. Here, the user must input two vectors, one for elasticies and one for quantities, whereas in cobb_douglas_2, the user specifies only quantities and elasticities are taken as parameters.
#'
#' @param I is a vector of inputs
#' @param Elas is a vector of elasticities, must be the same length as I. Defaults to equal elasticities to all inputs, with sum of elasticities equal to 1.
#' @param K is the constant of the model. Defaults to 1.
#'
#' @author Pedro Cavalcante Oliveira, Department of Economics, Fluminense Federal University
#'
#' @return A list with output, function's degree of homogeneity.
#'
#' @examples
#'
#' I <- c(3, 4, 5)
#'
#' cobb_douglas(I)
#'
#' @export


cobb_douglas <- function(I,
                         Elas = rep(1/length(I),
                                    times = length(I)),
                         K = 1) {
  Q = I * Elas
  S = prod(Q)
  y = K * S

  CD <-  list(y = y,
              Degree = sum(Elas))

  return(CD)

}
