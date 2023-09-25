library(readr)
source(here::here("R","scrape-news.R"))
mydata <- read_csv("data/-20230201-20230301.csv")
my_links <- mydata$URL
purrr::map(my_links[1:2],~{
  scrape_news(.x,title_tag = "title",content_tag = "div.StoryTextContainer" )
}) %>% 
  bind_rows()-> my_data