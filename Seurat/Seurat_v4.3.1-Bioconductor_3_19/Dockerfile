FROM bioconductor/bioconductor_docker:RELEASE_3_19

RUN R -e 'install.packages("remotes")'
RUN R -e 'install.packages("reticulate")'

RUN R -e 'BiocManager::install("rtracklayer")'
RUN R -e 'BiocManager::install("SingleCellExperiment")'
RUN R -e 'BiocManager::install("scuttle")'
RUN R -e 'BiocManager::install("scran")'
RUN R -e 'BiocManager::install("scater")'
RUN R -e 'BiocManager::install("batchelor")'
RUN R -e 'BiocManager::install("SingleR")'
RUN R -e 'BiocManager::install("LoomExperiment")'

RUN R -e 'remotes::install_version("Seurat",version="4.4.0",dependencies=TRUE)'
RUN R -e 'remotes::install_version("SeuratObject",version="4.1.4",dependencies=TRUE)'

RUN R -e 'remotes::install_github("mojaveazure/seurat-disk")'
RUN R -e 'remotes::install_github("satijalab/seurat-wrappers")'
RUN R -e 'remotes::install_github("satijalab/seurat-wrappers")'

RUN R -e 'remotes::install_version("harmony",version="0.1.1",dependencies=TRUE)'

RUN R -e 'remotes::install_github("immunogenomics/presto")'
RUN R -e 'remotes::install_github("cellgeni/sceasy")'

RUN R -e 'install.packages("data.table")'
RUN R -e 'install.packages("tidyverse")'

RUN R -e 'install.packages("igraph")'
RUN R -e 'install.packages("mclust")'

RUN R -e 'install.packages("ggplot2")'
RUN R -e 'install.packages("gridGraphics")'
RUN R -e 'install.packages("cowplot")'
RUN R -e 'install.packages("RColorBrewer")'
RUN R -e 'install.packages("scales")'
RUN R -e 'install.packages("svglite")'
RUN R -e 'install.packages("pheatmap")'
RUN R -e 'BiocManager::install("ComplexHeatmap")'
RUN R -e 'BiocManager::install("karyoploteR")'
RUN R -e 'BiocManager::install("regioneR")'

RUN R -e 'install.packages("xml2")'
RUN R -e 'install.packages("rvest")'
