# Credits to https://qunis.de/how-to-make-a-dockerized-plumber-api-secure-with-ssl-and-basic-authentication/

# start from the rocker/r-ver:3.6.0 image
FROM rocker/r-ver:3.6.0

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# install other R packages required for this project
RUN R -e "install.packages(c('plumber', 'ranger', 'jsonlite'))"

# setup nginx
RUN apt-get update && \
apt-get install -y nginx apache2-utils && \
htpasswd -bc /etc/nginx/.htpasswd test test

RUN openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/server.key \
        -out /etc/ssl/private/server.crt
 
ADD ./nginx.conf /etc/nginx/nginx.conf
 
EXPOSE 80 443

# Move project files
ADD . /app
WORKDIR /app

# when the container starts, start the main.R script in folder "r"
CMD service nginx start && R -e "source('r/main.R')"