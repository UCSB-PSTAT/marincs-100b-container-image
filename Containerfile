FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN conda install -c conda-forge -y\
    r-here\
    r-palmerpenguins\
    r-quarto\
    r-terra\
    r-tidyterra

USER $NB_USER

