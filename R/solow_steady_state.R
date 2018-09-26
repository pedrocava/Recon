#' Solow Growth Model Steady State
#'
#' This function computes steady state income and capital per worker given relevant parameters according to the canonical model proposed by Solow (1956).
#' @param s is the savings rate. Defaults to 1%.
#' @param delta is the capital stock's depreciation rate. Defaults to 1%.
#' @param n is population growth rate. Defaults to 1%.
#' @param alpha is capital-output elasticity. Defaults to .5.
#' @param g is the technological growth rate. Defaults to 1%.
#' @keywords macroeconomics growth theory
#' @export
#' @examples
#' demand()
#'

solow_steady_state <- function(n = .01,
                               g = .01,
                               alpha = .5,
                               s = .01,
                               delta = .01) {

  k = (s/(n + g + delta))^(1 / (1-alpha))
  y = (s/(n + g + delta))^(alpha / (1-alpha))

results = list(k = "Capital per capita",
               y = "Income per capita")

print(results)
  }
