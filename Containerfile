FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN conda install -c conda-forge -y\
    r-here\
    r-palmerpenguins\
    r-quarto\
    r-s2\
    r-sf\
    r-terra

RUN R -e "install.packages(c('tidyterra'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

USER $NB_USER

