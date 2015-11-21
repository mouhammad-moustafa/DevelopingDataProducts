# DevelopingDataProducts

## Prediction application documentation  
The aim of this application is to predict child height given parents height.  

Start by entering father and mother heights in the top left panel then click predict.  
The application will predict child height along with lower and upper bounds of 95% preddiction interval and renders the outputs in the bottom left panel.


The prediction algorithm uses [Galton data]("https://vincentarelbundock.github.io/Rdatasets/doc/HistData/Galton.html") from UsingR package and builds a linear regression model between child height and mid parents height.  

The application renders a snowflower plot of children height on the y axis by mid parent's height on the x axis.   
The linear regression model is also rendered (deepskyblue line) along with the predicted value of child height as horizontal line (dark green).
