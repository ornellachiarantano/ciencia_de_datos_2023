# Esta funcion es un ejemplo
# No pretende funcionar para ningun medio que conozcamos
source(here::here("R","scrape-news.R"))
# source("./R/scrape-news.R")
scrape_news_periodico_fantasma <- function(url){
  scrape_news(url, title_tag = "h2.titulo-fantasma")
}