# Latex Example
Lakshmi Arbatti  
Saturday, January 31, 2015  

If we have a series of n measurements of X and Y written as xi and yi where i = 1, 2, ..., n, then the sample correlation coefficient can be used to estimate the population Pearson correlation r between X and Y. The sample correlation coefficient is written

$$
\rho_{X,Y}=\mathrm{corr}(X,Y)={\mathrm{cov}(X,Y) \over \sigma_X \sigma_Y} ={E[(X-\mu_X)(Y-\mu_Y)] \over \sigma_X\sigma_Y}
$$

where x and y are the sample means of X and Y, and sx and sy are the sample standard deviations of X and Y.

(Source: Wikipedia)

In this example, we will calculate the correlation between age of a child and its weight.

```
##    age weight
## 1    1    4.4
## 2    3    5.3
## 3    5    7.2
## 4    2    5.2
## 5   11    8.5
## 6    9    7.3
## 7    3    6.0
## 8    9   10.4
## 9   12   10.2
## 10   3    6.1
```

Given the age and weight in the above table, the correlation is: 0.9075655
