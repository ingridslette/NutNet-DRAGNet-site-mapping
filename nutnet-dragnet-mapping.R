library(ggplot2)
library(ggmap)

register_stadiamaps("98dda47f-a35b-4ead-aa46-dda02c95d912", write = FALSE)
stadiamaps_key()
has_stadiamaps_key()

# mapping DRAGNet and NutNet sites
dragnutsites <- read.csv("/Users/ingridslette/Desktop/nut-drag-site-coords-clim.csv",
                            na.strings = c("NULL","NA"))

bbox <- c(left = -170, bottom = -60, right = 177, top = 80.5)
myMap <- get_stadiamap(bbox, zoom = 4, maptype = "stamen_terrain_background")

desired_order <- c("NutNet", "DRAGNet", "Observational")
dragnutsites$network <- factor(dragnutsites$network, levels = desired_order)

head(dragnutsites)
unique(dragnutsites$network)

dragnutmap <- ggmap(myMap) +
  geom_point(
    data = dragnutsites,
    aes(x = longitude, y = latitude, fill = network, shape = network), 
    size = 1.5) +
  scale_fill_manual(values = c("#9656a2",  "#ff924c", "#0092E0")) +
  scale_shape_manual(values = c(21, 22, 23, 24)) +
  labs(fill = "Network", shape = "Network", x = "", y = "")

dragnutmap


