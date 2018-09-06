#' Function Multiplication
#'
#' This function provides symbolic multiplication and is used in many functions of this package.
#' @param a is a function.
#' @param b is a function.
#' @keywords microeconomics imperfect competition
#' @export
#' @examples
#' multiply()

multiply = function(a,b) {
  force(a)
  force(b)
  function(x){a(x)*b(x)}
}