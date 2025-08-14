# install devtools if necessary
install.packages('devtools')
library(devtools)
library(dplyr)

# install the MuSiC package
install.packages("DWLS")
devtools::install_github("Moonerss/CIBERSORT")
devtools::install_github('xuranw/MuSiC')
devtools::source_url("https://github.com/favilaco/deconv_matching_bulk_scnRNA/blob/master/helper_functions.R?raw=TRUE")
install_github("mjnajafpanah/SQUID")
install_github("Danko-Lab/BayesPrism/BayesPrism")


# load
library(CIBERSORT)
library(MuSiC)
library(SQUID)
library(CIBERSORT)
library(BayesPrism)

avail_pks <- available.packages()
deps <- tools::package_dependencies(packages = avail_pks[1:200, "Package"],recursive = TRUE)
