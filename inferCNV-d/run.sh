#!/usr/env bash

# 2023/05/05
# Create dir to hold image in L:/
mkdir /Volumes/Documents-D/Schlisio_lab/maria.d/mararc/bin/inferCNV-d/
cd /Volumes/Documents-D/Schlisio_lab/maria.d/mararc/bin/inferCNV-d/

# Pull image
#wget https://data.broadinstitute.org/Trinity/CTAT_SINGULARITY/InferCNV/infercnv.1.16.0.simg # doesn't work
#docker pull trinityctat/infercnv:1.16.0
# 2023-05-22: Build image including rtracklayer
#docker image build -f $PWD/Dockerfile -t trinityctat_infercnv_1.16.0 --platform amd64 .
#docker image build -f $PWD/Dockerfile -t trinityctat_infercnv:1.16.0 --platform amd64 .
#2023-05-26:
docker image build -f $PWD/Dockerfile -t trinityctat_infercnv:1.16.0 --platform amd64 --no-cache .

# tar ball image
docker images
docker save a0f7375e35b4 -o trinityctat-infercnv.1.16.0.tar

# Compress and ship to server
cd ..
tar -cvzf inferCNV-d.tar.gz inferCNV-d
sftp mararc-sens2018122@bianca-sftp.uppmax.uu.se:/mararc-sens2018122
sftp$ put inferCNV-d.tar
sftp$ bye
bianca$ mv /castor/project/proj_nobackup/wharf/mararc/mararc-sens2018122/inferCNV-d.tar.gz /castor/project/home/mararc/bin/
bianca$ cd /castor/project/home/mararc/bin/
bianca$ tar -xvzf inferCNV-d.tar.gz

# create singularity image
bianca$ module load bioinfo-tools

#If the tarball is not in the current working directory, specify the path, for example, /tmp:
bianca$ cd /castor/project/home/mararc/bin/inferCNV-d/
bianca$ singularity build trinityctat-infercnv.1.16.0.sif docker-archive:///castor/project/home/mararc/bin/inferCNV-d/trinityctat-infercnv.1.16.0.tar

# Go to server for downstream analysis
