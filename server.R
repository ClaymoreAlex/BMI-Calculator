library(shiny)

BMICalculator <- function(inFeet, inInches, inWeight)
	outnow <- inFeet* 12 + inInches 
	

shinyServer(function(input, output) {
    # calculates BMI
    outnow1 <- reactive ({round((input$inWeight / (input$inFeet* 12 + input$inInches) ^ 2) * 703, digits = 1) })

    output$inputValue   <- renderPrint({input$inFeet})
    output$inputValue1  <- renderPrint({input$inInches})
    output$inputValue2  <- renderPrint({input$inWeight})
    output$outBMI       <- renderPrint({outnow1()})

    # calculates weight status
    outStatus <- reactive ({(if (outnow1() < 18.4) {
        outStatus <- 'underweight'
    }   else {if (outnow1() >= 18.5 && outnow1() <= 24.9) {
             outStatus <- 'normal'
    }   else {if (outnow1() >= 25.0 && outnow1() <= 29.9) {
             outStatus <- 'overweight'
    }
        else {
             outStatus <- 'obese'}} } )
 })
    output$outstat <- renderPrint({outStatus()})
} )
