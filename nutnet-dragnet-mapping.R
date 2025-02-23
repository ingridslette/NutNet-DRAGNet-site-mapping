library(ggplot2)
library(ggmap)

## maping global NutNet sites
nutnetsites <- read.csv("/Users/ingridslette/Desktop/NutNet/NutNet-site-list.csv")

register_stadiamaps("98dda47f-a35b-4ead-aa46-dda02c95d912", write = FALSE)
stadiamaps_key()
has_stadiamaps_key()

bbox <- c(left = -170, bottom = -60, right = 170, top = 80.5)
myMap <- get_stadiamap(bbox, zoom = 4, maptype = "stamen_terrain_background")

cbp2 <- c("#D55E00", "#56B4E9")

ggmap(myMap) + geom_point(data = nutnetsites, aes(x = longitude, y = latitude, fill = experiment.type), 
                          cex=2, shape = 21, col = 'black') + 
  scale_fill_manual(values = cbp2) + 
  labs(fill = "Site Type", x = "Longitude", y = "Latitude")


## mapping US NutNet sites
bbox_us <- c(left = -137, bottom = 10, right = -57, top = 60)
myMap_us <- get_stadiamap(bbox_us, zoom = 4, maptype = "stamen_terrain_background")

ggmap(myMap_us) + geom_point(data = subset(nutnetsites, experiment.type == "Experimental"), aes(x = longitude, y = latitude, fill = experiment.type), 
                             cex = 2, shape = 21, col = 'black') + 
  scale_fill_manual(values = cbp2) + 
  labs(fill = "Site Type", x = "Longitude", y = "Latitude")


# mapping DRAGNet and NutNet sites
dragnutnetsites <- read.csv('/Users/ingridslette/Desktop/DRAGNet-NutNet-site-list.csv')

bbox <- c(left = -168, bottom = -60, right = 178, top = 80)
myMap <- get_stadiamap(bbox, zoom = 4, maptype = "stamen_terrain_background")

desired_order <- c("NutNet", "DRAGNet", "NutNet and DRAGNet", "Observational")
dragnutnetsites$experiment_type <- factor(dragnutnetsites$experiment_type, levels = desired_order)

cbp4 <- c("#ffa600", "#de324c", "#9656a2", "#56B4E9")

ggmap(myMap) + geom_point(data = dragnutnetsites, aes(x = longitude, y = latitude, fill = experiment_type), 
                          cex=2, shape = 21, col = 'black') +
  scale_fill_manual(values = cbp4) + 
  labs(fill = "Experiment Type", x = "Longitude", y = "Latitude")
