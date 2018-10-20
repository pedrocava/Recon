#' Cobb-Douglas Model
#'
#' This function allows you to compute a Cobb-Douglas production/ utility function with n inputs/goods.
#' @param I is a vector of inputs
#' @param Elas is a vector of elasticities, must be the same length as I.
#' @param K is the constant of the model. Defaults to 1.
#' @param log is logical. If TRUE, then output is in natural logarithm. Defaults to FALSE.
#' @keywords microeconomics
#' @export
#' @examples
#' cobb.douglas()


cobb_douglas <- function(I,
                           Elas,
                           K = 1,
                           log = FALSE) {
  Q = I * Elas
  S = prod(Q)
  y = K * S

  ifelse(log == TRUE,   cobb.douglas = list(y = log(y),
                                            Degree = sum(Elas),
                                            log = log),

         cobb.douglas = list(y = y,
                             Degree = sum(Elas),
                             log = log) )

  print(cobb.douglas)

}
