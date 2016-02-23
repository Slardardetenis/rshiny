library(shiny)
library(leaflet)
shinyServer(function(input, output) {
  output$mymap = renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 78.0419, lat = 27.1750, zoom = 15) %>%
      addMarkers(lng = 78.0419, lat = 27.1750, popup = "Taj Mahal, Aeww, Giovani")
  })
})