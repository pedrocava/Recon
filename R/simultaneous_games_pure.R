#' Simultaneous Games Pure Strategies
#'
#' This function finds the Nash equilibrium in pure strategies of a 2-person simultaneous game.
#' @param a is the row player's payoff matrix.
#' @param b is the column player's payoff matrix.
#' @import stats
#' @export

sgps <- function(a, b){

  requireNamespace(stats)
  stats = stats

# Here I'm creating the container for the best responses

listcol <- list()
listrow <- list()

i <- 1


# I proceed by appending the best responses to the list

while (i <= nrow(a)) {
  listcol[[i]]<- which(b[i, ] == max(b[i, ]))
  i <- i + 1
}

i <- 1

# Here, I'm naming the list element with its column/row, i.e., if the best
# response for row 2 is col 3, then my list will have the second element (3) named 2

while (i <= nrow(a)){
  names(listcol)[i] <- i
  i <- i + 1
}

j <- 1

# Here I proceed as above

while (j <= ncol(b)){
  listrow[[j]]<- which(a[ , j] == max(a[ , j]))
  j <- j + 1
}

j <- 1

while (j <= ncol(b)){
  names(listrow)[j] <- j
  j <- j + 1
}


# Now i'll create another container

rowbr <- list()
colbr <- list()

# Here I'm unlisting the list and giving a proper name to each element (I had to figure
# how to solve this problem. If I had two best responses (2, 2) for, let's say, column 3, then
# we would have an unlisted vector named 31 and 32 on the elements (2, 2). I wanted to
# have the names just as the column 3 to have the output as (2, 2) and the names (3, 3))

rowunlisted <- stats::setNames(unlist(listrow, use.names=F),rep(names(listrow), lengths(listrow)))
colunlisted <- stats::setNames(unlist(listcol, use.names=F),rep(names(listcol), lengths(listcol)))

x <- 1

# Here I'm creating pairs of best responses

while (x <= length(rowunlisted)) {
  rowbr[[x]] <- c(rowunlisted[x], names(rowunlisted[x]))
  names(rowbr[[x]]) <- NULL
  x <- x + 1
}

x <- 1

# Same as above

while (x <= length(colunlisted)) {
  colbr[[x]] <- c(names(colunlisted[x]), colunlisted[x])
  names(colbr[[x]]) <- NULL
  x <- x + 1
}

# Creating the final container to print the answer

eqnash <- list()

i <- 1
j <- 1

# Now I compare each one of the pairs of best responses, and
# if they are equal, we have a Nash equilibrium (by definition)

while (i <= length(rowbr)){
  while (j <= length(colbr)){
    if (all(rowbr[[i]] == colbr[[j]]) == TRUE){
      eqnash[[i]] <- rowbr[[i]]
    }
    j <- j + 1
  }
  j <- 1
  i <- i + 1
}

# Now I'm removing some NULL values that appear in my output

eqnash[sapply(eqnash, is.null)] <- NULL

## And here I'm printint the answer

if (is.null(unlist(eqnash))){
    print("There's no pure strategies Nash Equilibrium", quote = F)
} else {
    print(eqnash)
  }
}
