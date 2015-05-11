Dimension Reduction
========================================================
author: Lakshmi Arbatti
date: 4/20/2015

Learning Objectives
========================================================

- What is a dimensionality reduction
- Why do we need to reduce dimensions
- Factor analysis
- Correlation

Dimensionality Reduction
========================================================
Visualizing mutivariate data is extremely complex when the number of dimensions are high.
In order to be able to make sense of highly dimensional and complex data and the interrelations
between the variables, it is essential to simplyfy complex multivariate data.


Principle Component Analysis
========================================================
- Principal Component Analysis (PCA) is a technique for simplyfying data. 
- PCA transforms a large number of correlated variables into a smaller set of uncorrelated variables
- These variables are called __Principal Components__
- Principal components are linear combinations of the observed variables

Principle Component Analysis (in R)
========================================================
```r
N <- 20
g1 <- rnorm(N, mean=100, sd=30)
g2 <- 0.5 * g1 + rnorm(N, sd=3)
g1 <- c(2.5, 0.5, 2.2, 1.9, 3.1, 2.3, 2.0, 1.0, 1.5, 1.1)
g2 <- c(2.4, 0.7, 2.9, 2.2, 3.0, 2.7, 1.6, 1.1, 1.6, 0.9)
N <- length(g1)
D <- rbind(g1, g2)

plot(D[1,], D[2,])
```
https://class.coursera.org/netsysbio-002/lecture/59

Principle Component Analysis (in R)
========================================================
```r
Dcentered <- D - rowMeans(D)
plot(Dcentered[1,], Dcentered[2,])
C <- (1/N) * Dcentered %*% t(Dcentered)
eigen(C)
eigenC <- eigen(C)
W <- eigenC$vectors[, order(eigenC$values, decreasing=TRUE)]
Dpca <- t(W) %*% Dcentered
```

Correlation (in R)
========================================================

```r
E <- function(v) sum(v) / (length(v) - 1)
sigma <- function(x, y) E( (x - mean(x)) * (y - mean(y)) )  # cov
rho <- function(x,y) sigma(x,y) / (sd(x) * sd(y))			# cor

x <- runif(100, min=0, max=100)
y <- 5 + 1.2 * x + rnorm(100, sd=3)
z <- runif(100, max=100)
std_df <- data.frame(lapply(df,function(v) v/sd(v)))
```

Correlation (contd...)
========================================================
PCA only needs the covariance matrix
```r
cov(std_df)
cor(df)
princomp(df)
princomp(covmat = cov(df))
```
http://en.wikipedia.org/wiki/Covariance#Calculating_the_sample_covariance

