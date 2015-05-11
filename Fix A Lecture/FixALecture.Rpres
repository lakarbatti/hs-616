Module 3a (external resource: Wikipedia.org)
Vectors and Matrices
========================================================
author: Lakshmi Arbatti
date: 03/30/15

Learning Objectives
========================================================

- Dot product of two vectors
- Matrix manipulations
- Multiplying a matrix with a vector
- Inverse of a matrix
- Gauss-Jordan elimination

Dot Product of two Vectors
========================================================

- Dot product is an algebraic operation performed on two vectors of equal length resulting in a single number
- Also called **scalar product** when the result is a scalar rather than a vector

Dot Product of two Vectors: Food Cost example
========================================================

```r
price <- c( rice=2.16/20, oil=12.00/67, 
            fish=12.10/12, beans=2.02/12)
servings <- c( rice=7, oil=2, 
               fish=2, beans=4)

sum(price * servings)
```

```
[1] 3.804209
```

```r
price %*% servings
```

```
         [,1]
[1,] 3.804209
```

Matrix manipulations
========================================================
- A matrix is a rectangular array with **elements** arranged in rows and columns
- Two matrices of the same size can be added or subtracted element by element
- Two matrices can be multiplied only if the number of *columns* of the first matrix is equal to the number of *rows* of the second matrix
- When two matrices are multiplied, the dimensions of the resulting matrix is equal to the number of *rows* of the first matrix and the number of *columns* of the second matrix

An example matrix : Nutrition Information
========================================================
A matrix can hold nutrition information for various foods.



```
           rice     oil   fish   beans
carb     35.000    0.000  0.000  23.000
fat       0.000   14.000  1.000   0.000
protein   3.000    0.000 16.000   9.000
kCal    155.800  123.200 74.400 131.200
cost      0.108    0.179  1.008   0.168
```

Dot Product of two Vectors
===
Find the calorie content of the given diet.

```r
N["kCal",] %*% servings
```

```
       [,1]
[1,] 2010.6
```

Multiplying a Matrix by a Vector
========================================================
Calculate the nutrition information for a given diet

```r
servings
```

```
 rice   oil  fish beans 
    7     2     2     4 
```

```r
N %*% servings
```

```
                [,1]
carb          337.000
fat            30.000
protein        89.000
kCal         2010.600
cost            3.804
```

Multiplying a Matrix by a Vector
========================================================


```r
diets
```

```
     [,1] [,2] [,3]
[1,]    7    4    4
[2,]    2    5    3
[3,]    2    7    0
[4,]    4    2    8
```

```r
N %*% diets
```

```
          [,1]      [,2]      [,3]
carb     337.000  186.000   324.000
fat       30.000   77.000    42.000
protein   89.000  142.000    84.000
kCal    2010.600 2022.400  2042.400
cost       3.804    8.722     2.315
```

Diagonal matrix
========================================================
A matrix in which all elements outside of the diagonal are zeroes
Diagonal matrices are usually square matrices i.e rows and columns are equal

```
     [,1] [,2] [,3]
[1,]    1    0    0
[2,]    0    2    0
[3,]    0    0    3
```
However rectangular matrices can also be diagonal

```
     [,1] [,2] [,3] [,4]
[1,]    1    0    0    0
[2,]    0    1    0    0
```

diag() in R
========================================================
- The *diag()* command can be used to R to work with diagonals in a matrix
- The behaviour of diag() depends on the input type
- If the input to diag is a matrix, then it extracts the diagonal
- If the input is missing, but `nrow` is specified an identity matrix is created
- If the input length is one vector an identity matrix is created
- If the input is numeric vector a matrix with the given diagonal and zeros elsewhere is created


diag() examples:
========================================================

```r
M <- matrix(1:25, 
        nrow=5)
diag(M)
```

```
[1]  1  7 13 19 25
```

```r
diag(nrow=2)
```

```
     [,1] [,2]
[1,]    1    0
[2,]    0    1
```

***


```r
diag(2)
```

```
     [,1] [,2]
[1,]    1    0
[2,]    0    1
```

```r
diag(1:2)
```

```
     [,1] [,2]
[1,]    1    0
[2,]    0    2
```
Identity Matrix
========================================================
In linear algebra, an **identity matrix** or unit matrix is a square *diagonal* matrix with ones on the main diagonal and zeros elsewhere.
```r
I <- diag(5)
I
```

```
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    0    0    0    0
[2,]    0    1    0    0    0
[3,]    0    0    1    0    0
[4,]    0    0    0    1    0
[5,]    0    0    0    0    1
```

Trace
========================================================
The **trace** of a matrix is the sum of the diagonal elements of a square matrix
```r
A <- matrix(sample(1:9), nrow=3)
A
```

```
     [,1] [,2] [,3]
[1,]    3    5    7
[2,]    4    9    1
[3,]    8    6    2
```

```r
# trace of (A)
sum(diag(A))
```

```
[1] 14
```

Determinant of a matrix
========================================================
- A determinant is a special value that can be computed from the elements of a square matrix.
- The determinant of a matrix M is denoted det(M), det M, or |M|
- When a matrix is used to represent coefficients in a system of linear equations, the determinant is used to solve these equations

Finding the determinant using R
========================================================

```r
library(Matrix)
elu <- expand(lu(A))
prod(diag(elu$U))
```

```
[1] 1215
```

```r
det(A)
```

```
[1] -1215
```
Inverse of a matrix
========================================================
- Given two matrices A and B, if the dot product of A and B is an identity matrix, B is said to be the inverse of A and is represented by A^-1
- A matrix that is its own inverse, i.e. A = A^-1 and A^2 = I, is called an involution.
- Gauss-Jordan elimination is an algorithm that can be used to determine if a given matrix is invertible and to find the inverse


Inverse of a matrix using in R
========================================================

```
A <- matrix(sample(1:4), nrow=2)
     [,1] [,2]
[1,]    4    2
[2,]    3    1
```
```
solve(A)
```
```
     [,1] [,2]
[1,] -0.5    1
[2,]  1.5   -2
```
Assignment:
========================================================
Consider the following simultaneous equations
x + y + z = 5
2x + 3y + 5z = 8
4x + 5z = 2

Solve the following system by using the Gauss-Jordan elimination method.

