
read_rds("thiago/datos/scraping-2023-03-28.rds") -> datos03_28

filter(datos03_28,str_detect(url,"/seguridad/")) -> datos03_28_url_seguridad

filter(datos03_28,str_detect(title,"droga")) -> datos03_28_title_droga

filter(datos03_28,str_detect(content,"rosario")) -> datos03_28_content_rosario