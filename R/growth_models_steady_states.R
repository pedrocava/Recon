#' Mankiw-Romer-Weil Growth Model Steady State
#'
#' This function computes steady state income, capital and human capital per worker given relevant parameters according to the modelo presented in Mankiw, Romer and Weil (1992).
#'
#'
#' @param sk is the savings rate devoted to physical capital. Defaults to .01.
#' @param sh is the savings rate devoted to human capital. Defaults to 0.1.
#' @param delta is the physical capital stock's depreciation rate. Defaults to .01.
#' @param gamma is the human capital stock's depreciation rate. Defaults to 0.
#' @param n is population growth rate. Defaults to .01.
#' @param alpha is capital-output elasticity. Defaults to .33 as estimated by Mankiw, Romer and Weil.
#' @param beta is the human capital-output elasciticy. Defatults to .33 as estimated by Mankiw, Romer and Weil.
#' @param g is the technological growth rate. Defaults to .01.
#'
#' @author Pedro Cavalcante Oliveira, Department of Economics, Fluminense Federal University
#'
#' @return List with steady state capital, human capital and income per capita
#'
#' @examples
#'
#' MRW_steady_state(gamma = .005)
#'
#'
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

  results = list(human_capital = h,
                 capital = k,
                 income = y)
  return(results)
}

#' Solow Growth Model Steady State
#'
#' This function computes steady state income and capital per worker given relevant parameters according to the canonical model proposed by Solow (1956).
#' @param s is the savings rate. Defaults to .01.
#' @param delta is the capital stock's depreciation rate. Defaults to .01.
#' @param n is population growth rate. Defaults to .01.
#' @param alpha is capital-output elasticity. Defaults to .5.
#' @param g is the technological growth rate. Defaults to .01.
#'
#' @author Pedro Cavalcante Oliveira, Department of Economics, Fluminense Federal University
#'
#' @return List with steady state capital and income per capita
#'
#' @examples
#'
#' solow_steady_state()
#'
#'
#' @export

solow_steady_state <- function(n = .01,
                               g = .01,
                               alpha = .5,
                               s = .01,
                               delta = .01) {

  k = (s/(n + g + delta))^(1 / (1-alpha))
  y = (s/(n + g + delta))^(alpha / (1-alpha))

  results = list(capital = k,
                 income = y)

  return(results)
}
