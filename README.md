# blockr.dataeditr
DataEditR block


## Installation

``` r
# install.packages("pak")
pak::pak("cynkra/blockr.dataeditr")
```

## Usage

```r
library(blockr.ui)
pkgload::load_all()

serve(
  new_data_edit_block(),
  data = list(
    .data = data.frame(
      stat = c("30", "40 (50)"),
      pattern = c("{mean}", {"{n} ({%})"}),
      .bold = c(T, F),
      .indent = c(1, 2)
    )
  )
)
```

<img src="man/figures/example-ui.png" alt="blockr.ui example" width="100%" />

## Caveats

This block requires the following development package versions to be installed:

```r
pak::pak("DillonHammill/DataEditR")
pak::pak("DillonHammill/rhandsontable")
```

