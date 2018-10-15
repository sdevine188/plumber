library(plumber)
# library(tidyverse)

# https://www.rplumber.io/
# https://www.rplumber.io/docs/routing-and-input.html#static-file-handler

# setwd("C:/Users/Stephen/Desktop/R/plumber")


######################################################################


#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
        list(msg = paste0("The message is: '", msg, "'"))
}


#############

#* Plot a histogram
#* @png
#* @get /plot
function(){
        rand <- rnorm(100)
        hist(rand)
}


####################


#* Return the sum of two numbers - note that the tutorial structures this as a post request, but get seems better
#* @param a The first number to add
#* @param b The second number to add
#* @get /sum
function(a, b){
        as.numeric(a) + as.numeric(b)
}



# then to create this api, run the code below in the console or seperate script
# plumber_tutorial_api <- plumb("plumber_tutorial_api.R")  
# plumber_tutorial_api$run(port=8000)

# then you can hit the api with following commands
# http://localhost:8000/plot 
# http://localhost:8000/echo?msg=hello
# http://localhost:8000/sum?a=2&b=3


