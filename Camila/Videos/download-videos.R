library("googledrive")
drive_auth()
my_files <- drive_ls(path = "CIENCIA DE DATOS - COPIA")

## Set working directory
setwd(here::here("/cloud/project/Camila/Videos"))

## download all
for(i in 1:nrow(my_files)){
  drive_download(my_files[i,])  
}

