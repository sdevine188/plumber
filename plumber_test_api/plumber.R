library(plumber)
library(tidyverse)
library(jsonlite)

# setwd if running locally
# setwd("C:/Users/Stephen/Desktop/R/plumber/plumber_test_api")

# initialize api
test_api <- plumb("endpoints.R")  
test_api$run(port = 8000)

# get methods
# http://localhost:8000/plot 
# http://localhost:8000/echo?msg=hello
# http://localhost:8000/echo?msg=hello%20with%20spaces
# http://localhost:8000/sum?a=2&b=3
# http://localhost:8000/file?file_name=iris
# http://localhost:8000/file?file_name=starwars
# http://localhost:8000/file?file_name=movies

# post method
# https://community.rstudio.com/t/plumber-post-example-not-behaving-as-documented-using-curl/16198
# https://www.rplumber.io/docs/routing-and-input.html#input-handling
# https://stackoverflow.com/questions/27048361/posting-to-and-receiving-data-from-api-using-httr-in-r
# this may work: https://cran.r-project.org/web/packages/AzureContainers/vignettes/vig01_plumber_deploy.html
# r <- POST("http://157.230.190.135/json_data",
#               body = list(df = iris),
#           encode = "json")
# http_status(r)
# content(r)
# r
