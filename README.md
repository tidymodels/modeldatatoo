
<!-- README.md is generated from README.Rmd. Please edit that file -->

# modeldatatoo

<!-- badges: start -->

[![R-CMD-check](https://github.com/tidymodels/modeldatatoo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tidymodels/modeldatatoo/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](http://www.r-pkg.org/badges/version/modeldatatoo)](https://CRAN.R-project.org/package=modeldatatoo)
[![Downloads](http://cranlogs.r-pkg.org/badges/modeldatatoo)](https://CRAN.R-project.org/package=modeldatatoo)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- badges: end -->

modeldatatoo contains more data sets used in documentation and testing
for tidymodels packages. The package also contains a suite of simulation
functions for classification and regression data. This is extension to
the [modeldata](https://modeldata.tidymodels.org/) package.

## Installation

You can install the released version of modeldatatoo from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("modeldatatoo")
```

You can install the development version of modeldatatoo from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("tidymodels/modeldatatoo")
```

## Example

All the data sets in this package can be accessed by functions which are
prefixed with `data_`, and you call them like functions

``` r
library(modeldatatoo)
data_elevators()
#> # A tibble: 35,042 × 25
#>    device_number bin     tax_block tax_lot house_number street_name     zip_code
#>    <chr>         <chr>   <chr>     <chr>   <chr>        <chr>           <chr>   
#>  1 1D10028       1024795 1021      26      1614         BROADWAY        10019   
#>  2 1D10094       1041822 1392      25      53           E 77TH ST       10021   
#>  3 1D10097       1038223 1323      1       201          E 49 ST         10017   
#>  4 1D10146       1080443 1274      6       40           CENTRAL PARK S… <NA>    
#>  5 1D10200       1085777 1074      24      651          TENTH AVENUE    <NA>    
#>  6 1D10301       1002075 181       16      179          FRANKLIN STREET 10013   
#>  7 1D10302       1010518 606       4       121          WEST 10 STREET  10011   
#>  8 1D10303       1085955 1329      1       915          3 AVENUE        10022   
#>  9 1D10304       1044058 1430      5       220          E. 76 ST        10021   
#> 10 1D10305       1087468 1951      4       133          MORNINGSIDE AV… <NA>    
#> # ℹ 35,032 more rows
#> # ℹ 18 more variables: borough <fct>, device_type <chr>,
#> #   lastper_insp_date <date>, approval_date <date>, manufacturer <chr>,
#> #   travel_distance <chr>, speed_fpm <dbl>, capacity_lbs <dbl>,
#> #   car_buffer_type <chr>, governor_type <chr>, machine_type <chr>,
#> #   safety_type <chr>, mode_operation <chr>, floor_from <chr>, floor_to <chr>,
#> #   latitude <dbl>, longitude <dbl>, elevators_per_building <int>
```

The [pins](https://pins.rstudio.com/) package is used under the hood to
read, download, and cache the data.
