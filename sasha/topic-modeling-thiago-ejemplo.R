library(tidyverse)
source(here::here("R/topic-modeling-news.R"))
my_news <- read_csv(here::here("data/clarin-20230201-20230815.csv")) # cambiar según 
output_filename <- here::here('data/topic-modeling-2023-10-8.rds') # cambiar según
my_news %>% 
  #sample_n(size=20) %>%  # Quitar para probar rápido
  topic_modeling_news(output_filename = output_filename)