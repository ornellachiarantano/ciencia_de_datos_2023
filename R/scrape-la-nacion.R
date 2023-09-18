library(rvest)
library(tidyverse)
source(here::here("R","scrape-news.R"))
my_links <- 
  read_html("https://www.lanacion.com.ar/sitemap-news.xml") %>% 
  html_nodes("loc")

# my_links <- 
#   read_html("https://www.lanacion.com.ar/sitemap-index-historico.xml") %>% 
#   html_nodes("loc")

for(i in 1:length(my_links)){
# igual que en el ppt
}

purrr::map(my_links,~{
  scrape_news(html_text2(.x))
}) %>% 
  bind_rows()-> my_data
readr::write_rds(my_data, here::here("thiago/datos","scraping-2023-06-04.rds"))

