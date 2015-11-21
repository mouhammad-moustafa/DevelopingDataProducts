library(shiny)

# Define UI for application that plots random distributions 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Children Height Prediction"),
  fluidRow(
    column(3,
           wellPanel(
             numericInput("fheight", "Father's height (inches):", min = 60, max = 90, step = 0.5, value = 68),
             numericInput("mheight", "Mother's height (inches):", min = 60, max = 90, step = 0.5, value = 63),
             
             submitButton("Predict")
           ),
           wellPanel(
             h4('Results of prediction (inches)'),
             h5('Predicted Height of child'),
             verbatimTextOutput("fit"),
             h5('Lower bound of 95% prediction interval'),
             verbatimTextOutput("lwr"),
             h5('Lower bound of 95% prediction interval'),
             verbatimTextOutput("upr")
           )
      
    ),
    column(9,
           wellPanel(
             h3("Plot"),
             plotOutput("dataPlot")      
           )
    )
    
  )
))

