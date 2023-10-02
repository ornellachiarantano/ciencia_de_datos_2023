library(readr)
source(here::here("R","scrape-news.R"))

mydata <- read_csv(here::here("data","-20230201-20230301.csv")) # Actualizar con las 11800

my_links <- mydata$URL
purrr::map(my_links ,~{
  scrape_news(.x,title_tag = "title",content_tag = "div.StoryTextContainer" )
}) %>% 
  bind_rows()-> my_data

output_filename <- here::here("data", "scraping-clarin-2023-09-25.rds") #actualizar cuando lo hagas

readr::write_rds(my_data, output_filename)