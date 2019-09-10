library(tidyverse)
library(httr)

# get string
response <- GET("http://134.209.120.25/echo?msg=hello")
http_status(x = response)
response
content(x = response, as = "parsed")

# get string with spaces
response <- GET("http://134.209.120.25/echo?msg=hello%20with%20spaces")
http_status(x = response)
response
content(x = response, as = "parsed")

# get image and write to disk
response <- GET("http://134.209.120.25/plot")
response
http_status(response)
# content(x = response, as = "parsed")
GET("http://134.209.120.25/plot", write_disk("data/response_image.png", overwrite = TRUE))

# get numeric response
response <- GET("http://134.209.120.25/sum?a=2&b=3")
http_status(x = response)
response
content(x = response, as = "parsed")

# get data
response <- GET("http://157.230.190.135/file?file_name=iris")
response <- GET("http://157.230.190.135/file?file_name=starwars")
response <- GET("http://157.230.190.135/file?file_name=movies")
http_status(x = response)
response
content(response, as = "text") %>% fromJSON(txt = .) %>% as_tibble()

# post data file
response <- POST("http://157.230.190.135/json_data",
              body = list(df = iris),
          encode = "json")
http_status(response)
response
content(x = response, as = "text") %>% fromJSON(txt = .) %>% as_tibble()
