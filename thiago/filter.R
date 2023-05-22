
read_rds("data/scraping-2023-05-22.rds") -> datos05_22

filter(datos05_22,str_detect(url,"/seguridad/")) -> datos05_22_url_seguridad

filter(datos05_22,str_detect(title,"droga")) -> datos05_22_title_droga

filter(datos05_22,str_detect(content,"narco")) -> datos05_22_content_narco