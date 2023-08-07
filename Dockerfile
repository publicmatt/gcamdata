FROM rocker/tidyverse:4.1

WORKDIR /tmp
RUN wget https://github.com/JGCRI/gcamdata/archive/refs/heads/main.zip -O gcamdata.zip

RUN unzip gcamdata.zip && mv gcamdata-main /gcamdata

WORKDIR /gcamdata

# RUN R -e 'install.packages("devtools")'
# RUN R -e 'devtools::load_all(".")' -e 'devtools::install_deps(".")' -e "driver_drake()"

RUN R -e 'install.packages( "https://cran.r-project.org/src/contrib/Archive/renv/renv_0.12.5.tar.gz", repos = NULL, type = "source" )'
RUN R -e 'renv::consent(provided = TRUE)'
RUN R -e 'renv::init(bare = TRUE)'
RUN R -e 'renv::restore()'
RUN R -e 'renv::activate()'
