

read_rds("data/scraping-2023-05-08.rds") -> datos05_08

combinada <- rbind(datos05_08, datos03_28)

filter(combinada,str_detect(url,"/seguridad/")) -> combinada_url_seguridad

filter(datos03_28,str_detect(title,"droga")) -> datos03_28_title_droga

filter(datos03_28,str_detect(content,"rosario")) -> datos03_28_content_rosario