---
output:
  pdf_document:
    keep_tex: yes
---
HS - 616 Questions week-wise
================================================================
author: Lakshmi Arbatti

date: 01/31/2015



## Lecture 1a  

If x <- 1:4 and y <- 5:8 what is the output of x + y ?

* A vector with values 6 8 10 12
* A numeric integer with value 6
* A numeric integer with values 6 8 10 12
* Running the statement gives an error

## Lecture 1b  

What is the class() of the vector 'var' in the statement var <- runif (10) < 0.5?

* Logical
* Integer
* Character
* List

## Lecture 2a  

Which of the following equation represents the sensitivity of a test?

* sensitivity = number of true positives / number with disease
* sensitivity = number of true negatives / number without disease
* sensitivity = number with disease / total population
* sensitivity = number of true positives / number of true negatives

## Lecture 2b  

Poisson Probability Distribution is a type of 

* Discrete Probability Distribution
* Continuous Probability Distribution
* Cumulative distibution
* Random number generation

## Lecture 3a  

Given a matrix
```
x <- matrix (1:12,4,3)
x
```
what is the output of the statement __x[1, ]__

* [1] 1 5 9
* [1] 1
* [1] 1 2 3 4
* System generates a syntax error

### Lecture 3b   

Given a matrix A
```
x <- matrix (1:12,4,3)
x
```
what is the output of A * Transpose(A)

*
```
x <- matrix (1:12,4,3)
trans <- t(x)
x %*% trans
```

*
```
diag(nrow=4)
```

* [1] 1 2 3 4
* System generates a syntax error

### Lecture 4a  

To find the square of each number from 1 to N, which of the following is the fastest approach

*
x <- 1:N
y <- x^2
*
y <- numeric()
for (i in 1:N) y[i] <- i^2
*
y <- numeric(N)
for (i in 1:N) y[i] <- i^2

### Lecture 4b  

Which of the following function keeps track of the function stack and tabulates how much time is spent on each function?

* RProf()
* runif()
* system.time()
* rnorm()

### Lecture 5a  

Which function in R is best suited to read very large data sets?

* read.table()
* read.csv()
* data.frame()
* None of the choices

### Lecture 5b  

What does the selectorGadget do?

* Allows you to interactively click on a web page and helps generate CSS selectors
* Generates data for a linear model
* Selects the best function in a given program
* Helps to select and time profiler functions

### Lecture 6a

Which statement below best describes "natural join"?

* "natural join"" uses an obviously similar column for join.
* "natural join" keeps only records in first table
* "natural join" keeps only the information from second table if available
* SQL does not support natural join

### Lecture 6b

In database management, what is meant by "Data Aggregation"?

* The process by which data is gathered and summarized for further statistical analyses
* Using an inner join to extract data from a table
* Normalizing the data in a database table
* Finding the mean of columns in a database table

