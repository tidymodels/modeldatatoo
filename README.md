
<!-- README.md is generated from README.Rmd. Please edit that file -->

# modeldatatoo

<!-- badges: start -->
<!-- badges: end -->

modeldatatoo contains more data sets used in documentation and testing
for tidymodels packages. The package also contains a suite of simulation
functions for classification and regression data. This is extension to
the [modeldata](https://modeldata.tidymodels.org/) package.

## Installation

You can install the development version of modeldatatoo from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/modeldatatoo")
```

## Example

All the data sets in this package can be accessed by functions which are
prefixed with `data_`, and you call them like functions

``` r
data_elevators()
#> # A tibble: 35,042 × 25
#>    device_number bin     tax_b…¹ tax_lot house…² stree…³ zip_c…⁴ borough devic…⁵
#>    <chr>         <chr>   <chr>   <chr>   <chr>   <chr>   <chr>   <fct>   <chr>  
#>  1 1D10028       1024795 1021    26      1614    BROADW… 10019   Manhat… Dumbwa…
#>  2 1D10094       1041822 1392    25      53      E 77TH… 10021   Manhat… Dumbwa…
#>  3 1D10097       1038223 1323    1       201     E 49 ST 10017   Manhat… Dumbwa…
#>  4 1D10146       1080443 1274    6       40      CENTRA… <NA>    Manhat… Dumbwa…
#>  5 1D10200       1085777 1074    24      651     TENTH … <NA>    Manhat… Dumbwa…
#>  6 1D10301       1002075 181     16      179     FRANKL… 10013   Manhat… Dumbwa…
#>  7 1D10302       1010518 606     4       121     WEST 1… 10011   Manhat… Dumbwa…
#>  8 1D10303       1085955 1329    1       915     3 AVEN… 10022   Manhat… Dumbwa…
#>  9 1D10304       1044058 1430    5       220     E. 76 … 10021   Manhat… Dumbwa…
#> 10 1D10305       1087468 1951    4       133     MORNIN… <NA>    Manhat… Dumbwa…
#> # … with 35,032 more rows, 16 more variables: lastper_insp_date <date>,
#> #   approval_date <date>, manufacturer <chr>, travel_distance <chr>,
#> #   speed_fpm <dbl>, capacity_lbs <dbl>, car_buffer_type <chr>,
#> #   governor_type <chr>, machine_type <chr>, safety_type <chr>,
#> #   mode_operation <chr>, floor_from <chr>, floor_to <chr>, latitude <dbl>,
#> #   longitude <dbl>, elevators_per_building <int>, and abbreviated variable
#> #   names ¹​tax_block, ²​house_number, ³​street_name, ⁴​zip_code, ⁵​device_type
```

The [pins](https://pins.rstudio.com/) package is used under the hood to
read, download, and cache the data.
