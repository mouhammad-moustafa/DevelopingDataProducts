library(shiny)
library(UsingR)
data(Galton)

# Define server logic required to predict child's height
shinyServer(function(input, output) {
  
  #build linear model between children height and their parent's mid height.
  #We apply the lm function to a formula that describes the variable child by the variable parent.
  buildmodel <- function(){
    reg <- lm(child ~ parent, data = Galton)
    reg
  }
  
  #Get Father height from input
  #Get Mother height from input
  #Compute mid parent height.
  #Create a new data frame that set parent value to mid parent height.
  #Apply the predict function and set the predictor variable in the newdata argument.
  #Set the interval type as "predict", and use the default 0.95 prediction level.
  predictChilddHeight <- reactive({
    midparent <- (input$fheight+input$mheight)/2
    newdata <- data.frame(parent = midparent)
    res <- predict(reg, newdata, interval = "predict")
    res
  }
    
  )
  
  # Expression that generates a sun flower plot of Galton data.
  # plot the linear regression model between children and parent
  # predict child height based on father and mother mid height
  # draw a vertical line for the predicted child height
  output$dataPlot <- renderPlot({
    with(Galton,{
    sunflowerplot(parent, child, xlim=c(62,74), ylim=c(62,74), xlab = "Mid parent height (inches)",
                  ylab = "Child height (inches)")
    reg <- buildmodel()
    abline(reg, col="deepskyblue", lwd=2)
    res <- predictChilddHeight()
    abline(h = res[1, 1], col = "darkgreen", lwd=2)
    text(x=62.6, y=res[1, 1], labels = paste("Predicted child height: ", round(res[1, 1], 2))
         , col = "darkgreen", pos = 3)
    })
    legend("bottomright", legend=c("sun flower plot", "linear regression", "Predicted child height"),
           col = c("red", "deepskyblue", "darkgreen"), lwd = 2,
           lty = c(NA, 1, 1), pch = c('*', NA, NA), pt.cex = 3)
    
  })
  
  # Predict Child height based on father and mother mid height
  # Returns 95% prediction interval of the child height with fit, lower and upper bound.
  output$fit <- renderText({
    round(predictChilddHeight()[1, 1], 2)
  })
  output$lwr <- renderText({
    round(predictChilddHeight()[1, 2], 2)
  })
  output$upr <- renderText({
    round(predictChilddHeight()[1, 3], 2)
  })
})
