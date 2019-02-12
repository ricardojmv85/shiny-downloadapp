library(shiny)
library(readr)
library(WriteXLS)
library(lubridate)

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Old Faithful Geyser Data"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("get_file","Upload"),
      downloadButton("downloadData","Download")
    ),
    
    mainPanel(
      tableOutput("view_uploaded_file")
    )
  )
))
