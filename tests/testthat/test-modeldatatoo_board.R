test_that("internal_board is a bins board", {
  expect_true(
    inherits(internal_board(), "pins_board")
  )
})
