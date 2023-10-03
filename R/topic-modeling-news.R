library(tidyverse)
library(tidytext)
library(ldatuning)

#' Topic Modeling on Newspaper articles
#'
#' Performs a topic modelling excercise on a dataframe from our scraper
#' 
#'
#' @param news dataframe from our scraping
#' @param output_filename where do the results go?
#' @param n_topics number of topics to evaluate
#' @param my_stop_words stop words to use
#' @param mc.cores number of cores for evaluation
#'
#' @return the output filename
#' @export
topic_modeling_news <- function(news, output_filename, n_topics = c(2,30), my_stop_words = spanish_stop_words(), mc.cores = 4L){
  file.create(output_filename) # Stop if path cannot be found
  news %>% 
    unnest_tokens(word,content) %>% 
    anti_join(my_stop_words) %>% 
    group_by(title) %>% 
    count(title, word, sort=TRUE) %>% 
    cast_dtm(title, word, n) -> myDTM
  my_eval <- xfun::cache_rds({
    FindTopicsNumber(
      myDTM,
      topics = seq(from = min(n_topics) , to = max(n_topics), by = 1),
      metrics = c("Griffiths2004", 
                  "CaoJuan2009", "Arun2010", "Deveaud2014"),
      method = "Gibbs",
      control = list(seed = 77),
      mc.cores = mc.cores,
      verbose = TRUE
    )
  }, clean = FALSE)
  
  list(
    DTM = myDTM,
    evaluation = my_eval
  ) %>% readr::write_rds(output_filename)
}


spanish_stop_words <- function(){
  data.frame(word = 
               c(
                 stopwords::stopwords("es",source = "snowball"),
                 stopwords::stopwords("es",source = "stopwords-iso"),
                 stopwords::stopwords("es",source = "nltk")
               ) %>% unique()
  )
}