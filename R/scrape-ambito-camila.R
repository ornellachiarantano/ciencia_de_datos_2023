library(rvest)
library(tidyverse)
source(here::here("R", "scrape.news.R"))

mis_links <- 
  read_html("https://www.ambito.com/sitemap.xml") %>%
  html_nodes("loc")

for(i in 1:length(mis_links)){
  
}

purrr::map(mis_links),~{
  scrape_news(html_text2(.x))
}) %>%
  bind_rows() -> datos_camila
readr::write_rds(datos_camila, here::here("data", "scraping-2023-05-21.rds"))
