Docker Shinydashboard
================

This serves more as a reminder for myself. But in case anyone is
interested: This is a simple Shiny Dashboard. If you just want to run it
locally without using Docker you can clone the repo and just run the
shiny app via

``` r
shiny::runApp("app/")
```

You may also run it inside a Docker container:

``` bash
# In case of permission issues 
# sudo chmod 666 /var/run/docker.sock
docker build -t maxxxy-shinydashboard-image .
docker run -d --rm -p 8080:8080 maxxxy-shinydashboard-image
```

Go to <http://localhost:8080> and have fun. 🔥
# shinydashboard_docker
