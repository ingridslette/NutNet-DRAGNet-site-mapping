library(ggplot2)
library(ggmap)

register_stadiamaps("98dda47f-a35b-4ead-aa46-dda02c95d912", write = FALSE)

sites <- read.csv("/Users/ingridslette/Desktop/DRAGNet/site-info-2025-11-06.csv")

bbox <- c(left = -168, bottom = -60, right = 178, top = 78)
myMap <- get_stadiamap(bbox, zoom = 4, maptype = "stamen_terrain_background")

ggmap(myMap) +
  geom_point(data = sites, aes(x = longitude, y = latitude),
             cex = 2, shape = 21, col = 'black', fill = '#9656a2') +
  geom_text(data = sites,
            aes(x = longitude, y = latitude, label = site_code),
            vjust = -0.7, size = 3, color = "black") +
  labs(x = "", y = "") +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank())


ggmap(myMap) +
  geom_point(data = sites,
             aes(x = longitude, y = latitude),
             size = 3, shape = 21, 
             color = "black", fill = "#9656a2", stroke = 0.7) +
  labs(x = "", y = "") +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank())
