library(magick)
library(magrittr)

cars_front <- image_read(paste0("../", folders, "/01.jpg"))
image_info(cars_front)
cars_front
cars_front[1:2]

cars_grid <- sapply(0:6, function(base_inx) {
    cars_front[(5 * base_inx + 1):(5 * base_inx + 5)] %>% image_append()
}) %>% {do.call(c, .)} %>% image_append(stack = TRUE)

image_info(cars_grid)
image_write(cars_grid, path = "../cars_grid.jpg", format = "jpg", quality = 80)
