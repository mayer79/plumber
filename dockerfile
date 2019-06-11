# Credits to https://medium.com/tmobile-tech/using-docker-to-deploy-an-r-plumber-api-863ccf91516d

# start from the rocker/r-ver:3.6.0 image
FROM rocker/r-ver:3.6.0

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# install other R packages required for this project
RUN R -e "install.packages(c('plumber', 'ranger', 'jsonlite'))"

# create directories
RUN mkdir -p /r

## copy files
COPY /r/main.R /r/main.R
COPY /r/rest_controller.R /r/rest_controller.R
COPY /fit.rds /fit.rds

# open port 80 to traffic
EXPOSE 80

# when the container starts, start the main.R script in folder "r"
ENTRYPOINT ["Rscript", "r/main.R"]