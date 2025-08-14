 #!/usr/bin/env bash

# Build docker image -- Note: the name points to an older version of seurat.
docker image build -f $PWD/Dockerfile -t bioc3_19_seurat4_3_1:v1 --platform amd64 .

# docker run -it --user rstudio bioconductor/bioconductor_docker:RELEASE_3_15 R
#docker run -it bioc_ann_hub:v1 R
# docker run -it bioc_seurat:v1

# tar ball image
docker images
docker save 6bc3c3b1eb52 -o bioc3_19_seurat4_3_1.tar

# ship to server
sftp mararc@rackham.uppmax.uu.se:/crex2/proj/sllstore2017016/Paper2024_TPM/bin/Seurat_4_4_0_Bioconductor_3_19-d
sftp> put bioc3_19_seurat4_3_1.tar

# create singularity image
rackham$ module load bioinfo-tools

#If the tarball is not in the current working directory, specify the path, for example, /tmp:
rackham$ cd /crex2/proj/sllstore2017016/Paper2024_TPM/bin/Seurat_4_4_0_Bioconductor_3_19-d
rackham$ singularity build bioc3_19_seurat4_3_1.sif docker-archive:///crex2/proj/sllstore2017016/Paper2024_TPM/bin/Seurat_4_4_0_Bioconductor_3_19-d/bioc3_19_seurat4_3_1.tar

## Check what it is in there
rackham$ singularity shell bioc3_19_seurat4_3_1.sif
singularity$ R  # R/4.4.0
R$ sessionInfo() # it has seurat, SeuratDisk dplyr, data.table, ggplot2 ...

rackham$ rm bioc3_19_seurat4_3_1.tar

#docker run -it --rm bioc_seurat:v1 R
