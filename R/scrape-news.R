library(rvest)
library(tidyverse)

scrape_news <- function(url, 
                        title_tag = "h1.com-title",
                        content_tag =".cuerpo__nota p.com-paragraph" ,
                        author_tag = ".container-firma a.com-link"
                        ){
  html <- read_html(url)
  
  html %>% 
    html_element(title_tag) %>% 
    html_text2() -> my_title
  
  html %>% 
    html_nodes(content_tag) -> my_nodes
  html_text2(my_nodes) %>% paste(collapse = " ") -> my_content
  
  html %>% 
    html_element(author_tag) %>% 
    html_text2() -> my_author
  
  data.frame(url = url, title = my_title, content = my_content, author = my_author)
  
}

