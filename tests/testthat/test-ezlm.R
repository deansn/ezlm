test_that("Rejects invalid variables", {
  expect_error(ezlm(mtcars, mtcars$mpg, as.factor(mtcars$hp), 3))
})

test_that("Produces correct result", {
  expect_equal("Regression complete! The intercept of your model is 4.451, with a p-value of 0. The coefficient for your independent variable is 0.236, with a p-value of 0.001. Overall, your model has an r-squared value of 0.309.",
               ezlm(mtcars, mtcars$disp, mtcars$gear, 3))
})

test_that("Rounds correctly", {
  expect_failure(
    expect_identical(ezlm(mtcars, mtcars$disp, mtcars$gear, 9),
                     ezlm(mtcars, mtcars$disp, mtcars$gear, 3)))
})
