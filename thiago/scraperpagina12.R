library(readr)
source(here::here("R","scrape-news.R"))
mydatap12 <- read_csv("data/pagina12-20230201-20230815.csv")
my_links <- mydatap12$URL
purrr::map(my_links,~{
  scrape_news(.x,title_tag = "title",content_tag = "div.StoryTextContainer" )
}) %>% 
  bind_rows()-> my_data