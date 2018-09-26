#' Simultaneous Games Mixed Strategies
#'
#' This function finds the Nash equilibrium in mixed strategies of a 2-person simultaneous game. The function works only for 2x2 matrices,
#' @param a is the row player's payoff matrix.
#' @param b is the column player's payoff matrix.
#' @keywords microeconomic.
#' @export
#' @examples

sgms <- function(a, b) {
  if (isTRUE(all.equal(dim(a), c(2, 2)))) { ## Testando se a matriz é 2x2
    x_c <- (a[2,2] - a[1, 2])/(a[1, 1] - a[2, 1] - a[1, 2] + a[2, 2])
    x_l <- (b[2,2] - b[2, 1])/(b[1, 1] - b[2, 1] - b[1, 2] + b[2, 2]) ## Calculando a probabilidade da coluna e da linha
      if (x_c >= 0 & x_c <= 1) {
        print(c("Probability of playling the first row is =", x_l), quote = F)
        print(c("Probability of playling the first row is =", x_c), quote = F) ## Printando resultados
      } else {
        print("There's no mixed strategies equilibrium", quote = F)
      }
  } else {
    print("The matrix must be 2x2", quote = F)
  }
}
