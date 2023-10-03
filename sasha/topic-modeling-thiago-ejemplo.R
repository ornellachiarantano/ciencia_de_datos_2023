library(tidyverse)
source(here::here("R/topic-modeling-news.R"))
my_news <- read_rds(here::here("data/scraping-clarin-2023-09-25.rds")) # cambiar según 
output_filename <- here::here('data/topic-modeling-2023-10-02.rds') # cambiar según
my_news %>% 
  #sample_n(size=20) %>%  # Quitar para probar rápido
  topic_modeling_news(output_filename = output_filename)