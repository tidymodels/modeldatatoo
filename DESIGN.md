# Design

This package works by having an internal pin board created with the [pins](https://pins.rstudio.com/) package, that is then used to manage the data sets, how they are downloaded, read and stored. This board is created in [R/aaa-board.R](R/aaa-board.R).

Each data set is accompanied by a function that is used to fetch the data set. These functions are a thin wrapper around `pins::pin_read()`.

# Adding a new data set.

1. Run `usethis::use_data_raw("name_of_data_set")`
1. In the newly created file, write the code to produce desired data set.
1. The include the following code to have the data set saved as a pin. Remember to change `name_of_data_set` to match the name of your data set.

    ```r
    library(pins)

    board <- board_folder("data-raw/", versioned = FALSE)
    
    board |>
      pin_write(name_of_data_set, "name_of_data_set", type = "rds")
    ```
    
1. Push changes to Main.
1. Update `modeldatatoo_board` in [R/aaa-board.R](R/aaa-board.R) to include new data set.
1. Run `usethis::use_r("name_of_data_set")`
1. Populate with the following code. Changing `name_of_data_set` to reflect the name you used earlier.
    
    ```r
    #' name_of_data_set data set
    #'
    #' @return tibble
    #'
    #' @details
    #'
    #' # tibble print
    #'
    #' ```{r}
    #' data_name_of_data_set()
    #' ```
    #'
    #' # glimpse()
    #'
    #' ```{r}
    #' tibble::glimpse(data_name_of_data_set())
    #' ```
    #'
    #' @examples
    #' \dontrun{
    #' data_name_of_data_set()
    #' }
    #' @export
    data_name_of_data_set <- function() {
      pins::pin_read(modeldatatoo_board, "name_of_data_set")
    }
    ```

1. Add more information under @details and @source.
1. Run `devtools::document()`
1. Update [NEWS.md](NEWS.md)
1. Add data set to [_pkgdown.yml](_pkgdown.yml)
1. You are done!
