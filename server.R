library(shiny)

shinyServer(function(input, output) {
  
  uploaded_file <- reactive({
    
    inFile <- input$get_file
    if(is.null(inFile))
      return(NULL)
    
    uploaded_file <- read_csv(inFile$datapath)
    return(uploaded_file)
    
  })
  
  output$view_uploaded_file <- renderTable({
    uploaded_file()
  })
  
  output$downloadData <- downloadHandler(
    filename = function(){paste("test-", today(), ".xls", sep = '')},
    content = function(file) {
      data_output <- uploaded_file()
      WriteXLS(data_output, file,
               AdjWidth = TRUE,
               AutoFilter = TRUE,
               BoldHeaderRow = TRUE,
               FreezeRow = 1)
    }
  )
  
})

library(shiny)
library(readr)
library(WriteXLS)
library(lubridate)

shinyUI(fluidPage(
  
  titlePanel("Upload and Download Files"),
  
  sidebarLayout(
    sidebarPanel(
      
      fileInput("get_file",
                "Upload file"),
      
      downloadButton("downloadData",
                     "Download file")
      
    ),
    
    mainPanel(
      
      tableOutput("view_uploaded_file")
      
    )
  )
))
