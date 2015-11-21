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
             h3("Prediction application documentation"),
             helpText("The aim of this application is to predict child height given parents height."),
             helpText("Start by entering father and mother heights in the top left panel",
                      "then click predict.",
                      "The application will predict child height",
                      "along with lower and upper bounds of 95% preddiction interval",
                      "and renders the outputs in the bottom left panel."),
             helpText("The prediction algorithm uses", a("Galton data", href="https://vincentarelbundock.github.io/Rdatasets/doc/HistData/Galton.html"),
                      "from UsingR package and builds a linear regression model",
                      "between child height and mid parents height."),
             helpText("The plot below renders a snowflower plot of children height on the y axis",
                      "by mid parent's height on the x axis.",
                      "The linear regression model is also rendered (deepskyblue line)",
                      "along with the predicted value of child height as horizontal line (dark green)."
                      )
           ),
           wellPanel(
             h3("Plot: Galton child height vs mid parent height"),
             plotOutput("dataPlot")      
           )
    )
    
  )
))

