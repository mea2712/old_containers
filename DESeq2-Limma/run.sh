#!/usr/bin/env bash

# Build docker image
# 2022-08-02: changed Dockerfile to include the tidyverse suit
# 2022-08-09: update Dockerfile to include pheatmap
# 2022-10-21: update Dockerfile to include svglite
# 2022-11-04: update Dockerfile to include ComplexHeatmap and mclust
# 2022-11-10: update Dockerfile to add limma

docker image build -f $PWD/Dockerfile -t deseq2:v1 --platform amd64 .

# docker run --rm -it --mount type=bind,source=$(PWD),target=/SANDBOX/ -w /SANDBOX/ bioc_ann_hub:v2 R

## tar ball image
docker images
docker save 102ef724ef14 -o deseq2_v1.tar

## ship to server
#$ sftp mararc-sens2018122@bianca-sftp.uppmax.uu.se
#sftp> put bioc_ann_hub_3.15_v2.tar
#bianca$ mv /castor/project/proj_nobackup/wharf/mararc/mararc-sens2018122/bioc_ann_hub_3.15_v2.tar /castor/project/home/mararc/bin

# create singularity image
# bianca$ module load bioinfo-tools
# bianca$ interactive -A sens2018122 -n 1 -t 01:00:00
# bianca$ module avail

#If the tarball is not in the current working directory, specify the path, for example, /tmp:
#bianca$ cd /castor/project/home/mararc/bin
#bianca$ singularity build bioc_ann_hub_3.15_v2.sif docker-archive:///castor/project/home/mararc/bin/bioc_ann_hub_3.15_v2.tar

# Go to server for downstream analysis
