#' Simultaneous Games
#'
#' This function finds the Nash equilibrium of a 2-person simultaneous game. In the present moment, it can only find pure equilibrium.
#' @param a is the row player's payoff matrix.
#' @param b is the column player's payoff matrix.
#' @keywords microeconomics
#' @export
#' @examples

sg <- function(a, b){ ## Os argumentos são as matrizes nxn de payoff do jogador das linhas e do jogador das colunas, respectivamente

  brc <- matrix(NA, nrow = nrow(a)*ncol(a), ncol = 2, dimnames = list(NULL, c("row", "col")))
  brl <- matrix(NA, nrow = nrow(a)*ncol(a), ncol = 2, dimnames = list(NULL, c("row", "col"))) ## Criando os contâiners das melhores respostas

  i <- 1 ## Criando um índice para o while

  while (i <= nrow(a)) { ## Coletando as melhores respostas do jogador da coluna
    brc[i, ] <- c(i, which(b[i, ] == max(b[i, ])))
    i <- i + 1
  }

  i <- 1 # Criando um índice para o while

  while (i <= ncol(a)) { ## Coletando as melhores respostas do jogador da coluna
    brl[i, ] <- c(which(a[, i] == max(a[, i])), i)
    i <- i + 1
  }

  matriz_br <<- list(pos_linha = brl[complete.cases(brl), ], pos_coluna = brc[complete.cases(brc), ]) ## Criando a matriz de melhores respostas


  i <- 1
  j <- 1 ## Criando índices para o while

  matriz <- matrix(NA, nrow = length(a), ncol = 2, dimnames =
                     list(paste(rep("equi", length(a)), seq(1:length(a))), c("row", "col"))) ## Criando o contâiner para os equilíbrios

  while (i <= nrow(matriz_pos$pos_linha)){ ## Achando o equilíbrio de Nash, isto é, comparando as melhores respostas
    while (j <= nrow(matriz_pos$pos_coluna)){
      if (all(matriz_pos$pos_linha[i, ] == matriz_pos$pos_coluna[j, ]) == TRUE){
        matriz[i, ] <- matriz_pos$pos_linha[i, ]
      }
      j <- j + 1
    }
    j <- 1
    i <- i + 1
  }
  print(matriz[complete.cases(matriz), ]) ## Printando resultado
}
