#!/bin/env bash

# Download the image 
#docker run -it --rm  vpetukhov/baysor:master
# Or
## Dockerfile downloaded from github
docker image build -f $PWD/Dockerfile -t vpetukhov-baysor --platform amd64 .

# By hand
#docker pull julia:latest
#cd Baysor/docker
#docker build .

# Tar ball
docker images
docker save 278ad16914da -o vpetukhov-baysor.tar

# Ship to server
sftp mararc-sens2018122@bianca-sftp.uppmax.uu.se:/mararc-sens2018122
sftp$ put vpetukhov-baysor.tar
sftp$ bye

# log into server
ssh mararc-sens2018122@bianca.uppmax.uu.se
bianca$ cd ../../proj/maria.d
mv ../../proj_nobackup/wharf/mararc/mararc-sens2018122/vpetukhov-baysor.tar /castor/project/home/mararc/bin/
cd /castor/project/home/mararc/bin
module load bioinfo-tools
interctive -A sens2018122 -n 1 -t 01:00:00
singularity build vpetukhov-baysor.sif docker-archive:///castor/project/home/mararc/bin/vpetukhov-baysor.tar
singularity shell vpetukhov-baysor.sif
