 #!/usr/bin/env bash

<<'_SKIP_'
# Build docker image
#docker image build -f $PWD/Dockerfile -t bioc_seurat:v2 --platform amd64 .

# Download docker image
docker pull satijalab/seurat:4.1.0

# docker run -it --user rstudio bioconductor/bioconductor_docker:RELEASE_3_15 R
#docker run -it bioc_ann_hub:v1 R
# docker run -it bioc_seurat:v1

# tar ball image
docker images
docker save 49ddba626fd8 -o satjalab-seurat_v4.1.0.tar

# ship to server
sftp mararc-sens2018122@bianca-sftp.uppmax.uu.se
sftp> put satjalab-seurat_v4.1.0.tar
bianca$ mv /castor/project/proj_nobackup/wharf/mararc/mararc-sens2018122/satjalab-seurat_v4.1.0.tar /castor/project/home/mararc/bin

# create singularity image
bianca$ module load bioinfo-tools
## bianca$ module load singularity # no need

#If the tarball is not in the current working directory, specify the path, for example, /tmp:
bianca$ cd /castor/project/home/mararc/bin
bianca$ singularity build satjalab-seurat_v4.1.0.sif docker-archive:///castor/project/home/mararc/bin/satjalab-seurat_v4.1.0.tar

# Go to server for downstream analysis
## Check what it is in there
bianca$ singularity shell satjalab-seurat_v4.1.0.sif
singularity$ R
R$ sessionInfo() # it has seurat, SeuratDisk dplyr, data.table, ggplot2 ...
_SKIP_

# 2023-04-08/09
# Add more packages to compute TPM and differential expression and read gft files
# Build docker image
docker image build -f $PWD/Dockerfile_v2 -t bioc_seurat:v1 --platform amd64 .

#docker run -it --rm bioc_seurat:v1 R

# tar ball image
docker images
docker save 48943eccae62 -o bioc_seurat_v1.tar

# ship to server
sftp mararc-sens2018122@bianca-sftp.uppmax.uu.se:/mararc-sens2018122
sftp> put bioc_seurat_v1.tar
sftp> bye
ssh mararc-sens2018122@bianca.uppmax.uu.se
bianca$ mv /castor/project/proj_nobackup/wharf/mararc/mararc-sens2018122/bioc_seurat_v1.tar /castor/project/home/mararc/bin

# create singularity image
bianca$ module load bioinfo-tools
## bianca$ module load singularity # no need

#If the tarball is not in the current working directory, specify the path, for example, /tmp:
bianca$ cd /castor/project/home/mararc/bin
bianca$ singularity build bioc_seurat_v1.sif docker-archive:///castor/project/home/mararc/bin/bioc_seurat_v1.tar
