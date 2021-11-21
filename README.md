
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ezlm

<!-- badges: start -->
<!-- badges: end -->

The goal of ezlm is to fit a simple linear regression model, outputting
easy-to-read results rounded to user’s preferred decimal place. A
wrapper for lm().

## Installation

The ezlm package is not yet available from
[CRAN](https://CRAN.R-project.org). Please download it from this
repository using the following R command:

``` r
devtools::install_github("deansn/ezlm")
```

## Example

### Fuel Economy and Horsepower in`mtcars`

As a basic demonstration of the `ezlm()` function, begin by calling the
function and inputting the appropriate variables (as described in the
documentation above).

Let’s say we’re interested in the effect of fuel economy on horsepower,
and we want to see our results to three decimal places:

``` r
library(ezlm)
ezlm(mtcars, mtcars$mpg, mtcars$hp, 3)
#> [1] "Regression complete! The intercept of your model is 324.082, with a p-value of 0. The coefficient for your independent variable is 27.433, with a p-value of 0. Overall, your model has an r-squared value of 0.602."
```

### Urban Population and Assaults in `USArrests`

While this function was designed primarily for linear regressions within
the `mtcars` dataset, it should work with other datasets, such as
`USArrests`. In this example, let’s look at the influence of the urban
population proportion on the number of assault charges.

``` r
ezlm(USArrests, USArrests$UrbanPop, USArrests$Assault, 2)
#> [1] "Regression complete! The intercept of your model is 73.08, with a p-value of 0.18. The coefficient for your independent variable is 53.85, with a p-value of 0.07. Overall, your model has an r-squared value of 0.07."
```

### Inappropriate Inputs

To force my function to throw one of my custom error messages, we can
try to replace one of the numerical parameters with a non-accepted input
class:

``` r
ezlm(mtcars, as.factor(mtcars$mpg), mtcars$hp, 3)
#> Error in ezlm(mtcars, as.factor(mtcars$mpg), mtcars$hp, 3): Sorry! Your IV must be numeric.
#>          It's currently of class factor
```

As expected, the function throws the custom error message when the IV is
defined as a factor variable.
