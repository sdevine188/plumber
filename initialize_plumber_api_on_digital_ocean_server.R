library(analogsea)
library(plumber)
library(tidyverse)

# https://www.rplumber.io/docs/hosting.html
# https://github.com/sckott/analogsea
# http://www.exegetic.biz/blog/2017/06/deploying-minimal-plumber-api-digitalocean/
# https://github.com/sckott/analogsea/issues/154

# test connection to digital ocean
# will list droplets (projects) on digital ocean account
droplets()

# spin up virtual server with r and plumber pre-installed
# ?do_provision
mydrop <- do_provision(region = "nyc1", unstable = TRUE, example = FALSE) 
mydrop <- droplets()[[1]]

# install any additional packages
# ?install_r_package
# mydrop %>% install_r_package("tidyverse")

# deploy api to server
# ?do_deploy_api
do_deploy_api(droplet = mydrop, path = "plumber_api_on_digital_ocean", 
              localPath = "C:/Users/Stephen/Desktop/R/plumber/plumber_api_on_digital_ocean", 
              port = 8000)


# delete current droplets
current_droplets <- droplets()
current_droplets
length(current_droplets)
names(current_droplets)

droplet_delete(droplet = names(current_droplets))
droplets()



