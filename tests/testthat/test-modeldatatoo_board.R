test_that("internal_board is a bins board", {
  skip_on_cran()
  expect_true(
    inherits(internal_board(), "pins_board")
  )
})
