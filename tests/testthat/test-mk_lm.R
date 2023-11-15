##test case for mk_lm


test_that("mk_lm", {
  data(mtcars)
  mk_test = mk_lm(Y = mtcars$mpg, X = cbind(mtcars$wt, mtcars$cyl), X_names = c("weight", "cylinders"))
  expect_equal(mk_test[1], 39.686261, tolerance = 0.000001)
  expect_equal(mk_test[2], -3.190972, tolerance = 0.000001)
  expect_equal(mk_test[3], -1.507795, tolerance = 0.000001)
  expect_equal(mk_test[4], 1.7149840, tolerance = 0.000001)
  expect_equal(mk_test[5], 0.7569065, tolerance = 0.000001)
  expect_equal(mk_test[6], 0.4146883, tolerance = 0.000001)
  expect_equal(mk_test[7], 23.140893, tolerance = 0.000001)
  expect_equal(mk_test[8], -4.215808, tolerance = 0.000001)
  expect_equal(mk_test[9], -3.635972, tolerance = 0.000001)
  expect_equal(mk_test[10], 0.000000000, tolerance = 0.000001)
  expect_equal(mk_test[11], 0.000222020, tolerance = 0.000001)
  expect_equal(mk_test[12], 0.001064282, tolerance = 0.000001)
})



##to test run devtools::test() in the console
##at the end run the test for coverage (want 100%) -> usethis::use_coverage() & usethis::use_github_action ("test coverage")
##for continuous integration use usethis::use_github_actions() then copy badge and add it to the readME
