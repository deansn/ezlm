#' Easy-to-read Linear Model
#'
#' @description Fits a simple linear regression model, outputting easy-to-read
#' results rounded to user's preferred decimal place. A wrapper for `lm()`.
#'
#' @param dataset The data on which the modelling process will be run.
#' This parameter is so named to indicate to the user that a dataset is required
#'
#' @param iv The variable to be passed to the modelling function as predictor.
#' This parameter is so named to avoid any confusion about directionality.
#'
#' @param dv The variable to be passed to the modelling function as response.
#' As above, this parameter is so named to avoid confusion about directionality.
#'
#' @param digits The number of digits to display for all computed numbers.
#' This parameter is so named to indicate to the user that a number of digits
#' is required
#'
#' @param ... Additional arguments to lower level functions. `na.action` can be
#' useful and takes several values
#' (see https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html)
#'
#' @return Selected results of a linear regression on provided data in an
#' easy-to-read format composed of text and rounded digits.
#' @examples
#' ezlm(mtcars, mtcars$mpg, mtcars$hp, 3)
#' ezlm(USArrests, USArrests$UrbanPop, USArrests$Assault, 2)
#'
#' @export

ezlm <- function(dataset, iv, dv, digits, ...) {
  if (!is.numeric(iv)) {
    stop("Sorry! Your IV must be numeric.
         It's currently of class ", class(iv)[1])
  }
  if (!is.numeric(dv)) {
    stop("Sorry! Your DV must be numeric.
         It's currently of class ", class(dv)[1])
  }
  if (!is.numeric(digits)) {
    stop("Sorry! The rounding place (`digits`) must be numeric.
         It's currently of class ", class(digits)[1])
  }
  model <- stats::lm({{ dv }}~{{ iv}}, {{ dataset }})
  lm_output <- summary(model)
  lm_matrix <- round(lm_output$coefficients, {{ digits }})
  intercept <- lm_matrix[1,1]
  p_intercept <- lm_matrix[1,4]
  coef <- lm_matrix[1,2]
  p_coef <- lm_matrix[2,4]
  r_squared <- round(lm_output$r.squared, {{ digits }})
  sent1 <- paste0('Regression complete!')
  sent2 <- paste0("The intercept of your model is ",intercept,
                  ", with a p-value of ",p_intercept,".")
  sent3 <- paste0("The coefficient for your independent variable is ",coef,
                  ", with a p-value of ",p_coef,".")
  sent4 <- paste0("Overall, your model has an r-squared value of ",r_squared,".")
  return(paste(sent1,sent2,sent3,sent4))
}
