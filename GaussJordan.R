random_invertible_matrix <- function(n, seed="lnavinarbatti@usfca.edu"){
  if (!is.na(seed)){
    if(is.character(seed)){
      require(digest)
      seed <- strtoi(paste0("0x",substr(digest(seed),1,4)))
    }
    set.seed(seed)
  }
  # Initialize with a singular matrix
  A <- matrix( 1:n^2, nrow=n)
  # Choose random integer matrixes until we find a non-singular one
  while (det(A) == 0)
    A <- matrix( sample(1:99, n^2, replace=T), nrow=n)
  A
}

A <- random_invertible_matrix(3, "lnavinarbatti@usfca.edu")
A
Aaug <- cbind(A, diag(3))

Aaug[1,] <- Aaug[1,]/Aaug[1,1]
Aaug[2,] <- Aaug[2,] -Aaug[1,]*Aaug[2,1]
Aaug[2,] <- Aaug[2,]/ Aaug[2,2]


Aaug[3,] <- Aaug[3,] - Aaug[1,] * Aaug [3,1]
Aaug[3,] <- Aaug[3,] + Aaug[2,]*(-Aaug[3,2])
Aaug[3,] <- Aaug[3,] / Aaug[3,3]


Aaug[2,] <- Aaug[2,] - Aaug[3,]* Aaug[2,3]
Aaug[1,] <- Aaug[1,] - Aaug[3,] * Aaug[1,3]
Aaug[1,] <- Aaug[1,] - Aaug[2,] * Aaug[1,2]

Aaug 

Ainv <- Aaug[,4:6]

Ainv

A %*% Ainv
round(A %*% Ainv,12)

solve(A)

