library(shiny)


# Define UI for application that determines BMI
shinyUI(pageWithSidebar
(
  # Application title
    headerPanel("Body Mass Index Calculator"),

    sidebarPanel(
        h4('This application determines your body mass index and corresponding weight status category based upon you height and weight.'),
        h4(' '),
        h4('Enter your height in feet and inches and your weight in pounds.'),
        h4(' '),
        numericInput('inFeet','Height - Feet', 5, min = 4, max = 6),
        numericInput('inInches','Height - Inches', 0, min = 0, max = 11),
        numericInput('inWeight','Weight - Pounds', 120, min = 80, max = 400),
        submitButton('Calculate BMI')
    ),
    mainPanel(
        h4('Based on your height and weight, your body mass index is'),
        verbatimTextOutput("outBMI"),
        h4('and your weight status category is'),
        verbatimTextOutput("outstat")
    )
))
