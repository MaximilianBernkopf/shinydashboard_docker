# Base image https://hub.docker.com/r/rocker/shiny-verse
# Adds tidyverse to rocker:shiny image
FROM rocker/shiny-verse:latest

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# copy app
COPY /app ./app

# install renv & restore packages
#RUN Rscript -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
RUN install2.r --error \
  shinydashboard

# expose port
EXPOSE 8080

# run app on container start
CMD ["R", "-e", "shiny::runApp('/app', host = '0.0.0.0', port = 8080)"]
