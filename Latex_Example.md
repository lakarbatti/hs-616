---
title: "Latex Example"
author: "Lakshmi Arbatti"
date: "Saturday, January 31, 2015"
---

If we have a series of n measurements of X and Y written as xi and yi where i = 1, 2, ..., n, then the sample correlation coefficient can be used to estimate the population Pearson correlation r between X and Y. The sample correlation coefficient is written

$$
\rho_{X,Y}=\mathrm{corr}(X,Y)={\mathrm{cov}(X,Y) \over \sigma_X \sigma_Y} ={E[(X-\mu_X)(Y-\mu_Y)] \over \sigma_X\sigma_Y}
$$

where x and y are the sample means of X and Y, and sx and sy are the sample standard deviations of X and Y.

(Source: Wikipedia)

In this example, we will calculate the correlation between age of a child and its weight.
```{r,calc_correlation,echo = FALSE}

age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
aframe <- data.frame(age,weight)
aframe

```

Given the age and weight in the above table, the correlation is: `r cor(age,weight)`