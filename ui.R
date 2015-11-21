library(shiny)

# Define UI for application that plots random distributions 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Children Height Prediction"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("fheight", "Father's height (inches):", min = 60, max = 90, step = 0.5, value = 68),
      numericInput("mheight", "Mother's height (inches):", min = 60, max = 90, step = 0.5, value = 63),
      
      submitButton("Predict")
    ),
    
    # Show a plot of Galton dataset
    mainPanel(
      h4("Plot"),
      plotOutput("dataPlot")
    )
  )
))
