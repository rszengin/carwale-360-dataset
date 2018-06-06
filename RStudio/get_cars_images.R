library(tidyverse)
library(rvest)
library(stringr)
library(curl)

carwale <- "https://www.carwale.com"

# brands <- paste0(carwale, "/sitemap.aspx") %>% read_html() %>% 
#     html_nodes('#left_container_onethird div.smap.grid-12.bg-white div 
#                div:nth-child(2) div:nth-child(1) ul ul:nth-child(2) li a') %>% 
#     html_attr('href')

brands <- paste0(carwale, "/new/") %>% read_html() %>% 
    html_nodes('#brand-type li a') %>% 
    html_attr('href')

# brand_pages <- paste0(carwale, brands)

# cars <- paste0(carwale, brands[1]) %>% read_html() %>% 
#     html_nodes('#divModels .grid-5.alpha a') %>% 
#     html_attr('href')

cars <- sapply(paste0(carwale, brands), function(page) {
    read_html(page) %>% 
        html_nodes('#divModels .grid-5.alpha a') %>% 
        html_attr('href')
}) %>% unlist(use.names = FALSE)

# views <- paste0(carwale, cars[1]) %>% read_html() %>% 
#     html_node('.item--360-padding') %>% 
#     html_attr('href')

views <- sapply(paste0(carwale, cars), function(page) {
    read_html(page) %>% 
        html_node('.item--360-padding') %>% 
        html_attr('href')
}) %>% unname() %>% {.[!is.na(.)]} %>% {.[order(.)]} %>% 
    {.[!str_detect(., '/interior/')]}

# views %>% {.[!str_detect(., '/interior/')]} -> views

# paste0(carwale, views[1])

# target <- paste0(carwale, views[1]) %>% read_html() %>%
#     html_node('#loadingClosedDoor') %>%
#     html_attr('src') %>% str_match('/cw/360/(\\w+/\\d+)/closed-door/') %>% '['(2)

targets <- sapply(paste0(carwale, views), function(page) {
    read_html(page) %>% 
        html_node('#loadingClosedDoor') %>%
        html_attr('src') %>% str_match('/cw/360/(\\w+/\\d+)/closed-door/') %>% '['(2)
}) %>% unname()

# targets %>% unname() -> targets

# folders <- str_extract(views, '/[-\\w]+/\\w+') %>% {paste0('cars', .)}

folders <- str_match(views, '/(\\w+)-\\w+/([-\\w]+)/') %>% {paste0('cars/', .[,2], '/', .[,3])}

base_url <- "https://imgd.aeplcdn.com/1280x720/cw/360/"

for (car_inx in 1:length(targets)) {
    if(!dir.exists(paste0("../", folders[car_inx]))) {
        dir.create(paste0("../", folders[car_inx]), recursive = TRUE)
    } else next # if directory exists don't touch
    
    print(car_inx)
    
    for (img_inx in 1:99) {
        req <- curl_fetch_disk(paste0(base_url, targets[car_inx], "/closed-door/", img_inx, ".jpg"),
                               paste0("../", folders[car_inx], "/", str_pad(img_inx, 2, pad = "0"), ".jpg"))
        if(req$status_code == 404) {
            file.remove(paste0("../", folders[car_inx], "/", str_pad(img_inx, 2, pad = "0"), ".jpg"))
            print(paste("Image count =", img_inx - 1))
            break
        }
    }
}

if(!dir.exists("../car_videos")) {
    dir.create("../car_videos")
}

# system('ffmpeg -f image2 -framerate 24 -i "..\\cars\\audi\\a6\\%02d.jpg" "..\\car_videos\\a6.mp4"')

for (car_inx in 1:length(targets)) {
    paste0('ffmpeg -f image2 -framerate 24 -i "..\\',
           str_replace_all(folders[car_inx], '/', '\\\\'),
           '\\%02d.jpg" "..\\car_videos\\',
           str_match_all(folders[car_inx], '[-\\w]+') %>% unlist() %>% {paste0(.[2], '_', .[3])},
           '.mp4"') %>% system()
}

# For final concatanation of all car videos
# all_videos.txt file has line by line all car videos
# ffmpeg -f concat -i all_videos.txt -c copy carwale_360.mp4

