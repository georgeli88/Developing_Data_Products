library(shiny)
library(caret)
library(randomForest)

# the following code gets called once
data(faithful)

# build a simple linear regression model
set.seed(12345)
inTrain <- createDataPartition(y=faithful$waiting, p=0.70, list=FALSE)
trainFaith <- faithful[inTrain, ]
testFaith <- faithful[-inTrain, ]
model1 <- lm(eruptions ~ waiting, data=trainFaith)
model2 <- randomForest(eruptions ~ waiting, data=trainFaith)

shinyServer(
        function(input, output) {
                output$inputValue <- renderText({
                        
                        if (input$goButton==0)
                                isolate("")
                        else
                                isolate(input$inputTime)
                                
                })
                
                output$prediction <- renderText({
                        
                        if (input$goButton==0)
                                isolate("")
                        else
                        {  
                                isolate({
                                t <- as.integer(input$inputTime)
                                newt <- data.frame(waiting=t)
                                if (t<=0)
                                        isolate("Warning: re-enter a number > 0")
                                else
                                        # do prediction with the entered number
                                        if (input$radio ==1 )
                                                predict(model1, newt)
                                        else
                                                predict(model2, newt)
                                })
                        }
                })
                
        }
)

