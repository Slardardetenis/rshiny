require(shiny)
require(leaflet)

shinyUI(fluidPage(
  titlePanel("Skywalker"),

  sidebarLayout(
    sidebarPanel(
      helpText("bla bla bla"),
      
      selectInput("var",
                  label = "choose a variable to display",
                  choices = c("percent white", "percent black",
                              "percent hispanic", "percent asian"),
                  selected = "percent white"
                  ),
      sliderInput("range",
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0,100)
                  )
    ),
    mainPanel(
      textOutput("text1"),
      textOutput("text2")
    )
  )
))