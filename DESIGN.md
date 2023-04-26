# Design

This package works by having an internal pin board created with the [pins](https://pins.rstudio.com/) package, that is then used to manage the data sets, how they are downloaded, read and stored. This board is created in [R/aaa-board.R](R/aaa-board.R).

Each data set is accompanied by a function that is used to fetch the data set. These functions are a thin wrapper around `pins::pin_read()`.

# Adding a new data set.

1. Run `modeldatatoo:::.add_new_data("name_of_data_set")`.
1. In the newly created file under `data-raw`, write the code to produce desired data set, then source the file.
1. Push all changes except `R/name_of_data_set.R` to Main.
1. Modify `R/name_of_data_set.R`.
1. Run `devtools::document()`. (you will have to wait for pkgdown CI to do this step)
1. Update [NEWS.md](NEWS.md).
1. Add data set to [_pkgdown.yml](_pkgdown.yml).
1. Push everything to Main.
1. You are done!
