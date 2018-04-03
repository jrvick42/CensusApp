# server.R

source("helpers.R")
counties = readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      if(input$var == "Percent White")
      {
        var = counties[,3]
        color = "green"
        legend.title = "Percent White"
      }
      else if(input$var == "Percent Black")
      {
        var = counties[,4]
        color = "blue"
        legend.title = "Percent Black"
        }
      else if(input$var == "Percent Hispanic")
      {
        var = counties[,5]
        color = "red"
        legend.title = "Percent Hispanic"
      }
      else if(input$var == "Percent Asian")
      {
        var = counties[,6]
        color = "black"
        legend.title = "Percent Asian"
      }
      
      min = input$range[1]
      max = input$range[2]
      
      percent_map(var, color, legend.title, min, max)
    })
      
  }
)
    