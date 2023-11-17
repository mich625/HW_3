
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hw3mklinreg

<!-- badges: start -->

[![R-CMD-check](https://github.com/mich625/HW_4/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mich625/HW_4/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/mich625/HW_4/branch/main/graph/badge.svg)](https://app.codecov.io/gh/mich625/HW_4?branch=main)
<!-- badges: end -->

# Description

The goal of the package hw3mklinreg is to run a linear regression
comparrable to what is found with the lm() function. mk_lm can run for
simple and multiple linear regression.

## Installation

You can install the development version of hw3mklinreg from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mich625/HW_3")
```

## Example

This is a basic example which shows you how to run a regression using
this package with the r base mtcars data set. It will use mpg as the
outcome based on the covariates for cylinders and weight:

``` r
library(hw3mklinreg)
mk_lm(Y = mtcars$mpg, X = cbind(mtcars$wt, mtcars$cyl), X_names = c("weight", "cylinders"))
#>            estimate std error    t stat     p value
#> intercept 39.686261 1.7149840 23.140893 0.000000000
#> weight    -3.190972 0.7569065 -4.215808 0.000222020
#> cylinders -1.507795 0.4146883 -3.635972 0.001064282
```
