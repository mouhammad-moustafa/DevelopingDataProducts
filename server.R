library(shiny)
library(UsingR)
data(Galton)

# Define server logic required to predict child's height
shinyServer(function(input, output) {
  
  # Expression that generates a plot of Galton data.
  output$dataPlot <- renderPlot({
    with(Galton,{
    sunflowerplot(parent, child, xlim=c(62,74), ylim=c(62,74))
    reg <- lm(child ~ parent)
    abline(reg)
    lines(lowess(parent, child), col="deepskyblue", lwd=2)
    })
  })
})
