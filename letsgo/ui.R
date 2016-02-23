require(shiny)
require(leaflet)
shinyUI(bootstrapPage(
  h5("integrating leaflet with shiny - mapping taj mahal"),
  leafletOutput("mymap", height = "600")
))