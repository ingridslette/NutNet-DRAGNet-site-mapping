library(ggplot2)
library(ggmap)

nutnetsites <- read.csv("/Users/ingridslette/Desktop/NutNet/nutnet-site-coords-2025-11-20.csv")

register_stadiamaps("98dda47f-a35b-4ead-aa46-dda02c95d912", write = FALSE)
stadiamaps_key()
has_stadiamaps_key()

bbox <- c(left = -170, bottom = -60, right = 170, top = 80.5)
myMap <- get_stadiamap(bbox, zoom = 4, maptype = "stamen_terrain_background")

cbp2 <- c("#D55E00", "#56B4E9")

ggmap(myMap) + geom_point(data = nutnetsites, aes(x = longitude, y = latitude, fill = experiment_type), 
                          cex=2, shape = 21, col = 'black') + 
  scale_fill_manual(values = cbp2) + 
  labs(fill = "Site Type", x = "", y = "")

ggmap(myMap) +
  geom_point(
    data = nutnetsites,
    aes(x = longitude, y = latitude, fill = experiment_type),
    cex = 2, shape = 21, col = "black"
  ) +
  scale_fill_manual(values = cbp2) +
  labs(fill = "Site Type", x = "", y = "") +
  theme(
    legend.position = c(0.1, 0.3),   # lower-left corner in relative coordinates
    axis.ticks = element_blank(),    # remove tick marks
    axis.text = element_blank()      # remove tick labels
  )



