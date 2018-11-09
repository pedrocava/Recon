#' Mankiw-Romer-Weil Growth Model Steady State
#'
#' This function computes steady state income, capital and human capital per worker given relevant parameters according to the modelo presented in Mankiw, Romer and Weil (1992).
#' @param sk is the savings rate devoted to physical capital. Defaults to .01.
#' @param sh is the savings rate devoted to human capital. Defaults to 0.1.
#' @param delta is the physical capital stock's depreciation rate. Defaults to .01.
#' @param gamma is the human capital stock's depreciation rate. Defaults to 0.
#' @param n is population growth rate. Defaults to .01.
#' @param alpha is capital-output elasticity. Defaults to .33 as estimated by Mankiw, Romer and Weil.
#' @param beta is the human capital-output elasciticy. Defatults to .33 as estimated by Mankiw, Romer and Weil.
#' @param g is the technological growth rate. Defaults to .01.
#' @export


MRW_steady_state <- function(n = .01,
                               g = .01,
                               alpha = .33,
                               beta = .33,
                               sk = .01,
                               sh = .01,
                               delta = .01,
                               gamma = 0) {

  h = (sk^(1 - beta) * sh^beta) / ((n + g + delta + gamma)^(1 / (1 - alpha - beta)))
  k = (sh^(1 - alpha) * sk^alpha) / ((n + g + delta + gamma)^(1 / (1 - alpha - beta)))

  y = (k^alpha) * (h^beta)

  results = list(h = "Human Capital per capita",
                 k = "Capital per capita",
                 y = "Income per capita")
  print(results)
}

