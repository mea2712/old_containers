FROM trinityctat/infercnv:1.16.0-multiarch

RUN R -e 'install.packages("remotes")'
RUN R -e 'install.packages("BiocManager")'

RUN R -e 'BiocManager::install("rtracklayer")'

