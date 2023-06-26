source(here::here("Camila", "scrape-infobae.R"))

mislinks2 <- 
  read_html("https://www.infobae.com/sitemap.xml") %>% 
  html_nodes("loc")


purrr::map(mislinks2,~{
  scrape_infobae(html_text2(.x))
}) %>% 
  bind_rows()-> misdatosc
readr::write_rds(misdatosc, here::here("Camila","scraping-infobae12-06.rds"))