require(shiny)
require(leaflet)

shinyServer(function(input, output){
  
  output$text1 <- renderText({
    paste("you have selected this", input$var)
  })
  
  output$text2 <- renderText({
    paste("You have chosen a range
          that goes from ",input$range[1], "to",
          input$range[2])
  })
  
})