# programmer: giovani c r
# date: 02/21/2016
# description: learning leaflet package for map visualization and some
#              other features

require(leaflet)
require(htmlwidgets)
require(sp)
require(maps)
require(RColorBrewer)

mymap = leaflet()
mymap = addTiles(mymap)
mymap = setView(mymap, lng = 78.0419, lat = 27.1750, zoom = 15)
mymap = addMarkers(mymap,lng = 78.0419, lat = 27.1750, popup = "Taj Mahal, Agra, India"  )
mymap

#require(htmlwidgets)
saveWidget(widget = mymap, file = "mymap1.html")


# or we can do the same thing in this way
# same code logic but using the pipe operator
mymap = leaflet() %>%
  addTiles() %>%
  setView(lng = 78.0419, lat = 27.1750, zoom = 15) %>%
  addMarkers(lng = 78.0419, lat = 27.1750, popup = "Taj Mahal, Agra, India"  )
mymap

m = leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 174.768, lat = -36.852, popup = "The birthplace of R") %>%
  setView(lng = 174.768, lat = -36.852, zoom = 10)
m =   setView(m,lng = 174.768, lat = -36.852, zoom = 10)
m

####

df = data.frame(lat = 1:10, long = rnorm(10))
# leaflet(df) %>% addCircles()
leaflet(df) %>%
  addTiles() %>%
  addCircles()

###### we can do this way too
leaflet() %>%
  addCircles(data = df)

leaflet() %>%
  addCircles(data = df, lat = ~ lat, lng = ~ long)
#######

# lets see some examples of 'sp' and 'maps' to draw on the map
require(sp)
Sr1 = Polygon(cbind(c(2, 4, 4, 1, 2), c(2, 3, 5, 4, 2)))
Sr2 = Polygon(cbind(c(5, 4, 2, 5), c(2, 3, 2, 2)))
Sr3 = Polygon(cbind(c(4, 4, 5, 10, 4), c(5, 3, 2, 5, 5)))
Sr4 = Polygon(cbind(c(5, 6, 6, 5, 5), c(4, 4, 3, 3, 4)), hole = TRUE)
Srs1 = Polygons(list(Sr1), "s1")
Srs2 = Polygons(list(Sr2), "s2")
Srs3 = Polygons(list(Sr4, Sr3), "s3/4")
SpP = SpatialPolygons(list(Srs1, Srs2, Srs3), 1:3)
leaflet(height = "300px") %>% addPolygons(data = SpP) %>% addTiles()
# it s a little hard but don't worry about this now

# now using the package 'maps'

require(maps)
mapStates = map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>%
  addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)


####

m = leaflet() %>% addTiles()
df = data.frame(
  lat = rnorm(100),
  lng = rnorm(100),
  size = runif(100, 5, 20),
  color = sample(colors(), 100)
)
m = leaflet(df) %>% addTiles()
m %>% addCircleMarkers(radius = ~size, color = ~color, fill = FALSE)
m %>% addCircleMarkers(radius = runif(100, 4, 10), color = c('red'))
