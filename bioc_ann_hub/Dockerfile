FROM bioconductor/bioconductor_docker:RELEASE_3_15

RUN R -e 'install.packages("tidyverse")'
RUN R -e 'install.packages("ggplot2")'
RUN R -e 'install.packages("svglite")'
RUN R -e 'install.packages("pheatmap")'
RUN R -e 'install.packages("mclust")'

# Install required Bioconductor packages
RUN R -e 'BiocManager::install("AnnotationHub")'
RUN R -e 'BiocManager::install("biomaRt")'
RUN R -e 'BiocManager::install("SingleCellExperiment")'
RUN R -e 'BiocManager::install("SingleR")'
RUN R -e 'BiocManager::install("celldex")'
RUN R -e 'BiocManager::install("scRNAseq")'
RUN R -e 'BiocManager::install("AnnotationHub")'
RUN R -e 'BiocManager::install("zellkonverter")'
RUN R -e 'BiocManager::install("scran")'
RUN R -e 'BiocManager::install("scuttle")'
RUN R -e 'BiocManager::install("scater")'
RUN R -e 'BiocManager::install("batchelor")'
RUN R -e 'BiocManager::install("ComplexHeatmap")'

#R version 4.2.0 (2022-04-22)
#Platform: x86_64-pc-linux-gnu (64-bit)
#Running under: Ubuntu 20.04.4 LTS

#Matrix products: default
#BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
#LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/liblapack.so.3

#locale:
# [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C
# [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8
# [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8
# [7] LC_PAPER=en_US.UTF-8       LC_NAME=C
# [9] LC_ADDRESS=C               LC_TELEPHONE=C
#[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C

#attached base packages:
#[1] stats4    stats     graphics  grDevices utils     datasets  methods
#[8] base

#other attached packages:
# [1] batchelor_1.12.3            scater_1.24.0
# [3] ggplot2_3.3.6               scran_1.24.0
# [5] scuttle_1.6.2               zellkonverter_1.6.3
# [7] scRNAseq_2.10.0             celldex_1.6.0
# [9] SingleR_1.10.0              SingleCellExperiment_1.18.0
#[11] SummarizedExperiment_1.26.1 Biobase_2.56.0
#[13] GenomicRanges_1.48.0        GenomeInfoDb_1.32.2
#[15] IRanges_2.30.0              S4Vectors_0.34.0
#[17] MatrixGenerics_1.8.0        matrixStats_0.62.0
#[19] AnnotationHub_3.4.0         BiocFileCache_2.4.0
#[21] dbplyr_2.2.0                BiocGenerics_0.42.0

#loaded via a namespace (and not attached):
#  [1] ggbeeswarm_0.6.0              colorspace_2.0-3
#  [3] rjson_0.2.21                  ellipsis_0.3.2
#  [5] bluster_1.6.0                 XVector_0.36.0
#  [7] BiocNeighbors_1.14.0          ggrepel_0.9.1
#  [9] bit64_4.0.5                   interactiveDisplayBase_1.34.0
# [11] AnnotationDbi_1.58.0          fansi_1.0.3
# [13] xml2_1.3.3                    codetools_0.2-18
# [15] sparseMatrixStats_1.8.0       cachem_1.0.6
# [17] jsonlite_1.8.0                Rsamtools_2.12.0
# [19] ResidualMatrix_1.6.0          cluster_2.1.3
# [21] png_0.1-7                     shiny_1.7.1
# [23] BiocManager_1.30.18           compiler_4.2.0
# [25] httr_1.4.3                    dqrng_0.3.0
# [27] basilisk_1.8.0                assertthat_0.2.1
# [29] Matrix_1.4-1                  fastmap_1.1.0
# [31] lazyeval_0.2.2                limma_3.52.2
# [33] cli_3.3.0                     later_1.3.0
# [35] BiocSingular_1.12.0           htmltools_0.5.2
# [37] prettyunits_1.1.1             tools_4.2.0
# [39] rsvd_1.0.5                    igraph_1.3.4
# [41] gtable_0.3.0                  glue_1.6.2
# [43] GenomeInfoDbData_1.2.8        dplyr_1.0.9
# [45] rappdirs_0.3.3                Rcpp_1.0.8.3
# [47] vctrs_0.4.1                   Biostrings_2.64.0
# [49] ExperimentHub_2.4.0           rtracklayer_1.56.0
# [51] DelayedMatrixStats_1.18.0     stringr_1.4.0
# [53] beachmat_2.12.0               mime_0.12
# [55] lifecycle_1.0.1               irlba_2.3.5
# [57] restfulr_0.0.14               ensembldb_2.20.1
# [59] statmod_1.4.36                XML_3.99-0.10
# [61] edgeR_3.38.4                  scales_1.2.0
# [63] zlibbioc_1.42.0               basilisk.utils_1.8.0
# [65] hms_1.1.1                     promises_1.2.0.1
# [67] ProtGenerics_1.28.0           parallel_4.2.0
# [69] AnnotationFilter_1.20.0       yaml_2.3.5
# [71] curl_4.3.2                    gridExtra_2.3
# [73] memoise_2.0.1                 reticulate_1.25
# [75] biomaRt_2.52.0                stringi_1.7.6
# [77] RSQLite_2.2.14                BiocVersion_3.15.2
# [79] BiocIO_1.6.0                  ScaledMatrix_1.4.0
# [81] GenomicFeatures_1.48.3        filelock_1.0.2
# [83] BiocParallel_1.30.3           rlang_1.0.2
# [85] pkgconfig_2.0.3               bitops_1.0-7
# [87] lattice_0.20-45               purrr_0.3.4
# [89] GenomicAlignments_1.32.0      bit_4.0.4
# [91] tidyselect_1.1.2              magrittr_2.0.3
# [93] R6_2.5.1                      generics_0.1.2
# [95] metapod_1.4.0                 DelayedArray_0.22.0
# [97] DBI_1.1.2                     withr_2.5.0
# [99] pillar_1.7.0                  KEGGREST_1.36.0
#[101] RCurl_1.98-1.7                tibble_3.1.7
#[103] dir.expiry_1.4.0              crayon_1.5.1
#[105] utf8_1.2.2                    viridis_0.6.2
#[107] progress_1.2.2                locfit_1.5-9.6
#[109] grid_4.2.0                    blob_1.2.3
#[111] digest_0.6.29                 xtable_1.8-4
#[113] httpuv_1.6.5                  munsell_0.5.0
#[115] viridisLite_0.4.0             beeswarm_0.4.0
#[117] vipor_0.4.5
