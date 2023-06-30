library(rvest)
library(tidyverse)
source(here::here("R","scrape-ambito.R"))
mis_links <- 
  read_html("https://www.ambito.com/sitemap.xml") %>% 
  html_nodes("loc")



purrr::map(mis_links,~{
  scrape_ambito(html_text2(.x))
}) %>% 
  bind_rows()-> datos_camila2
readr::write_rds(datos_camila2, here::here("data","scraping-2023-05-29.rds"))
