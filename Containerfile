FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN conda install -c conda-forge -y\
    libgdal-hdf5\
    libgdal-netcdf\
    r-here\
    r-palmerpenguins\
    r-s2\
    r-sf\
    r-terra

RUN R -e "install.packages(c('tidyterra'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN echo 'PROJ_LIB="/opt/conda/share/proj"' >> $(R RHOME)/etc/Renviron

USER $NB_USER

