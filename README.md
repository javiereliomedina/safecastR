
# safecastR

## Overview

*safecastR* package provides functions for interacting with the
[Safecast API](https://api.safecast.org/).

## Installation

``` r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("javiereliomedina/safecastR")
```

## Usage

``` r
  library(safecastR) 
```

Example,

``` r
dat <- get_measurements(100, 34.5, 135.5)
```

`sf` object

``` r
dat
#> Simple feature collection with 19 features and 14 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 135.4989 ymin: 34.49936 xmax: 135.501 ymax: 34.50055
#> Geodetic CRS:  WGS 84
#> First 10 features:
#>          id user_id value unit location_name device_id original_id
#> 1  44593235     161    32  cpm            NA        NA          NA
#> 2  44593236     161    32  cpm            NA        NA          NA
#> 3  44593240     161    25  cpm            NA        NA          NA
#> 4  44593097     161    29  cpm            NA        NA          NA
#> 5  44593098     161    32  cpm            NA        NA          NA
#> 6  44593099     161    33  cpm            NA        NA          NA
#> 7  44593140     161    44  cpm            NA        NA          NA
#> 8  44593234     161    32  cpm            NA        NA          NA
#> 9  44593142     161    39  cpm            NA        NA          NA
#> 10 44593238     161    28  cpm            NA        NA          NA
#>    measurement_import_id              captured_at height devicetype_id
#> 1                  18114 2015-03-19T22:40:14.000Z     NA            NA
#> 2                  18114 2015-03-19T22:40:19.000Z     NA            NA
#> 3                  18114 2015-03-19T22:40:39.000Z     NA            NA
#> 4                  18114 2015-03-19T22:28:37.000Z     NA            NA
#> 5                  18114 2015-03-19T22:28:42.000Z     NA            NA
#> 6                  18114 2015-03-19T22:28:48.000Z     NA            NA
#> 7                  18114 2015-03-19T22:32:15.000Z     NA            NA
#> 8                  18114 2015-03-19T22:40:09.000Z     NA            NA
#> 9                  18114 2015-03-19T22:32:25.000Z     NA            NA
#> 10                 18114 2015-03-19T22:40:29.000Z     NA            NA
#>    sensor_id station_id channel_id                  geometry
#> 1         NA         NA         NA POINT (135.4998 34.49999)
#> 2         NA         NA         NA POINT (135.4999 34.49994)
#> 3         NA         NA         NA  POINT (135.4992 34.4994)
#> 4         NA         NA         NA  POINT (135.499 34.49991)
#> 5         NA         NA         NA POINT (135.4992 34.50019)
#> 6         NA         NA         NA POINT (135.4993 34.50034)
#> 7         NA         NA         NA POINT (135.4996 34.50045)
#> 8         NA         NA         NA POINT (135.4996 34.50011)
#> 9         NA         NA         NA POINT (135.5005 34.49991)
#> 10        NA         NA         NA POINT (135.4996 34.49955)
```
