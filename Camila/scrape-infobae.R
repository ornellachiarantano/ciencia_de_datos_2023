source(here::here("R", "scrape-news.R"))
scrape_infobae <- function(url){
  scrape_news(url = url, 
              title_tag = ".d23-article-headline",
              content_tag = ".d23-body-article",
              author_tag = ".d23-authors-name-txt-ctn")
}

