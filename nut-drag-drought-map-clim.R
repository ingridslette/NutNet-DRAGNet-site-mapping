library(tidyverse)
library(ggmap)

sites <- read.csv("/Users/ingridslette/Desktop/nut-drag-drought-site-coords-clim.csv",
                  na.strings = c("NULL","NA"))

register_stadiamaps("98dda47f-a35b-4ead-aa46-dda02c95d912", write = FALSE)
stadiamaps_key()
has_stadiamaps_key()

bbox <- c(left = -170, bottom = -60, right = 177, top = 80.5)
myMap <- get_stadiamap(bbox, zoom = 4, maptype = "stamen_terrain_background")

site_map <- ggmap(myMap) +
  geom_point(
    data = sites,
    aes(x = longitude, y = latitude, fill = network, shape = network), 
    size = 1.5) +
  scale_fill_manual(values = c("#ff924c", "#0092E0", '#9656a2')) +
  scale_shape_manual(values = c(21, 22, 23)) +
  labs(fill = "Network", shape = "Network", x = "", y = "")

site_map

site_clim_fig <- ggplot(sites, aes(x = MAP, y = MAT, fill = network, shape = network)) +
  geom_point() + 
  labs(x = "Mean Annual Precipitaiton (mm)", fill = "Network", shape = "Network",
       y = expression(paste("Mean Annual Temperature (",degree,"C)"))) +
  scale_fill_manual(values = c("#ff924c", "#0092E0", '#9656a2')) +
  scale_shape_manual(values = c(21, 22, 23)) +
  scale_y_continuous(limits = c(-10, 30)) +
  scale_x_continuous(limits = c(0, 2600)) +
  theme_bw(base_size = 14)

site_clim_fig


