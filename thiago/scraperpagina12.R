library(readr)
source(here::here("R", "scrape-news.R"))

mydata <- read_csv(here::here("data", "pagina12-20230201-20230815.csv"))


my_links <- mydata$URL
purrr::map(my_links, ~{
  scrape_news(.x, title_tag = "h1", content_tag = ".article-main-content.article-text")
}) %>% 
  bind_rows() -> my_data

output_filename <- here::here("data", "scraping-pagina12-2023-10-8.rds")

readr::write_rds(my_data, output_filename)