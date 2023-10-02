library(readr)
source(here::here("R","scrape-news.R"))
mydata <- read_csv("data/clarin-20230201-20230815.csv")
my_links <- mydata$URL
purrr::map(my_links,~{
  scrape_news(.x,title_tag = "title",content_tag = "div.StoryTextContainer" )
}) %>% 
  bind_rows()-> my_data