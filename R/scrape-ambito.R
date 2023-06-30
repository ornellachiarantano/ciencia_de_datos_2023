source(here::here("R","scrape-news.R"))

scrape_ambito <- function(url){
  scrape_news(url = url, 
              title_tag = ".news-headline__title",
              content_tag = ".detail-news__main-column",
              author_tag = ".news-headline__author")
}

