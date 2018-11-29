#' Cobb-Douglas Model
#'
#' This function allows you to compute a Cobb-Douglas production/ utility function with n inputs/goods.
#'
#' cobb_douglas_2 computes what - mathematically - is a particular case of this function, but computationally there are differentes. Here, the user must input two vectors, one for elasticies and one for quantities, whereas in cobb_douglas_2, the user specifies only quantities and elasticities are taken as parameters.
#' @param I is a vector of inputs
#' @param Elas is a vector of elasticities, must be the same length as I.
#' @param K is the constant of the model. Defaults to 1.
#' @param log is logical. If TRUE, then output is in natural logarithm. Defaults to FALSE.
#' @export


cobb_douglas <- function(I,
                         Elas,
                         K = 1,
                         log = FALSE) {
  Q = I * Elas
  S = prod(Q)
  y = K * S

  switch(log == TRUE, cobb.douglas = list(y = log(y),
                                          Degree = sum(Elas),
                                          log = log),

         cobb.douglas = list(y = y,
                             Degree = sum(Elas),
                             log = log))

  print(cobb.douglas)

}
