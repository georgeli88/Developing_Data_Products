library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Old Faithful Eruption Time Prediction Using Regression Model"),
        sidebarPanel(
                numericInput("inputTime", "Enter a positive waiting time (in mins)", value =50),
                radioButtons("radio", "Select Regression Model",
                             choices = list("Use lm" = 1, "Use randomForest" = 2),selected = 1),
                actionButton("goButton", "Submit")
        ),
        mainPanel(
                #h3('Predicted eruption time (in mins)'),
                h4('Based on the observed Old Faithful Geyser Data which contains 272 observations of 
                   the waiting time between eruptions and the duration of the eruption for the Old 
                   Faithful geyser in Yellowstone National Park, enter a waiting time between eruptions 
                   to pedict the duration of eruption time.'),
                h4('Waiting time you entered (in mins):'),
                verbatimTextOutput("inputValue"),
                h4('Eruption time predicted (in mins):'),
                verbatimTextOutput("prediction")
        )
))