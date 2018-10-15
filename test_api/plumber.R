library(plumber)
library(tidyverse)

# initialize api
test_api <- plumb("test_api_endpoints.R")  
test_api$run(port=8000)

# then you can hit the api with following commands
# http://localhost:8000/plot 
# http://localhost:8000/echo?msg=hello
# http://localhost:8000/sum?a=2&b=3