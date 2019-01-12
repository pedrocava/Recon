#' Cobb-Douglas Model
#'
#' This function allows you to compute a Cobb-Douglas production/ utility function with n inputs/goods.
#'
#' cobb_douglas_2 computes what - mathematically - is a particular case of this function, but computationally there are differentes. Here, the user must input two vectors, one for elasticies and one for quantities, whereas in cobb_douglas_2, the user specifies only quantities and elasticities are taken as parameters.
#' @param I is a vector of inputs
#' @param Elas is a vector of elasticities, must be the same length as I. Defaults to equal elasticities to all inputs.
#' @param K is the constant of the model. Defaults to 1.
#' @export


cobb_douglas <- function(I,
                         Elas = rep(1/length(I),
                         times = length(I)),
                         K = 1) {
  Q = I * Elas
  S = prod(Q)
  y = K * S

 CD <-  list(y = y,
            Degree = sum(Elas),
            log = log)

  return(CD)

}
