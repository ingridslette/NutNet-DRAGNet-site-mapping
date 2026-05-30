library(ggplot2)
library(ggmap)

nutnetsites <- read.csv("/Users/ingridslette/Desktop/NutNet/nutnet-site-coords-2025-11-20.csv")

register_stadiamaps("98dda47f-a35b-4ead-aa46-dda02c95d912", write = FALSE)
stadiamaps_key()
has_stadiamaps_key()

bbox <- c(left = -170, bottom = -60, right = 170, top = 80.5)
myMap <- get_stadiamap(bbox, zoom = 4, maptype = "stamen_terrain_background")

nutnetmap1 <- ggmap(myMap) +
  geom_point(
    data = nutnetsites,
    aes(x = longitude, y = latitude, fill = experiment_type), 
    cex = 2, shape = 21, col = "black") +
  scale_fill_manual(values = c("#ff924c", "#0092E0")) +
  labs(fill = "Site Type", shape = "Site Type", x = "", y = "")

nutnetmap1


nutnetmap2 <- ggmap(myMap) +
  geom_point(
    data = nutnetsites,
    aes(x = longitude, y = latitude, fill = experiment_type), 
    cex = 2, shape = 21, col = "black") +
  scale_fill_manual(values = c("#ff924c", "#0092E0")) +
  labs(x = "", y = "") +
  theme(
    legend.position = "none",
    axis.ticks = element_blank(),
    axis.text = element_blank()
  )

nutnetmap2


nutnetmap3 <- ggmap(myMap) +
  geom_point(
    data = nutnetsites,
    aes(x = longitude, y = latitude), 
    cex = 2, shape = 21, col = "black", fill = "#ff924c") +
  labs(x = "", y = "")

nutnetmap3


nutnetmap4 <- ggmap(myMap) +
  geom_point(
    data = nutnetsites,
    aes(x = longitude, y = latitude), 
    cex = 2, shape = 21, col = "black", fill = "#ff924c") +
  labs(x = "", y = "") +
  theme(
    legend.position = "none",
    axis.ticks = element_blank(),
    axis.text = element_blank()
  )

nutnetmap4





