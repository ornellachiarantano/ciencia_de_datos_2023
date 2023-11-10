# Setup ####
## Select the video file
EE_Folder <- here::here("/cloud/project/Camila/Videos","EL EMPLEO _ THE EMPLOYMENT.mp4")

## Create output folder
my_image_folder1 <- here::here("ElEmpleo-Frames") # if analyzing in bulk, use a different structure
dir.create("ElEmpleo-Frames") # Will throw warning if the folder already exists.

# Process ####
library(av)
# Get Technical info
av_video_info(EE_Folder) 
av_video_images(EE_Folder, destdir = my_image_folder1) -> ee_images
