 #!/usr/bin/env bash

#2024-07-29
# Build docker image
docker image build -f $PWD/Dockerfile_v1 -t bioc3_19_seurat4_4_0_deconvs:v1 --platform amd64 .

# Download docker image
#docker pull satijalab/seurat:4.1.0

# docker run -it --user rstudio bioconductor/bioconductor_docker:RELEASE_3_19 R
# docker run -it bioc3_19_seurat4_4_0_deconvs:v1 R
# docker run -it bioc3_19_seurat4_4_0_deconvs:v1

# tar ball image
docker images
docker save 1058eb81587d -o bioc3_19_seurat4_4_0_deconvs_v1.tar

# ship to server
sftp mararc-sens2018122@bianca-sftp.uppmax.uu.se:mararc-sens2018122
sftp> put bioc_seurat_deconvs_v1.tar
bianca$ mv /castor/project/proj_nobackup/wharf/mararc/mararc-sens2018122/bioc3_19_seurat4_4_0_deconvs_v1.tar /castor/project/home/mararc/bin

# create singularity image
bianca$ module load bioinfo-tools
## bianca$ module load singularity # no need

#If the tarball is not in the current working directory, specify the path, for example, /tmp:
bianca$ cd /castor/project/home/mararc/bin/deconvs-d
bianca$ singularity build bioc3_19_seurat4_4_0_deconvs_v1.sif docker-archive:///castor/project/home/mararc/bin/deconvs-d/bioc3_19_seurat4_4_0_deconvs_v1.tar

# Go to server for downstream analysis
## Check what it is in there
bianca$ singularity shell bioc3_19_seurat4_4_0_deconvs_v1.sif
singularity$ R
R$ sessionInfo() # it has seurat, SeuratDisk dplyr, data.table, ggplot2 ...

# /usr/local/lib/R/site-library’
