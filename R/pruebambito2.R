library(rvest)
library(tidyverse)
source(here::here("R","scrape-ambito.R"))
mis_links <- 
  read_html("https://www.ambito.com/sitemap.xml") %>% 
  html_nodes("loc")


index <- 0
purrr::map(mis_links,~{
  cat(index, ":", html_text2(.x),"\n")
  index <<- index +1
  tryCatch(
    scrape_ambito(html_text2(.x)),
    error = function(e){
      data.frame(url=html_text2(.x),title = "Error", content = "", author = "")
    }
  )

}) %>% 
  bind_rows()-> datos_camila2
readr::write_rds(datos_camila2, here::here("data","scraping-2023-05-29.rds"))
