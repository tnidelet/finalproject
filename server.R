
suppressPackageStartupMessages(c(
    library(shinythemes),
    library(shiny),
    library(stringr),
    library(markdown),
    library(stylo),
    library(quanteda),
    library(data.table),
    library(dplyr))
)

source("./my_functions.R")
# # load("./Data/2gram.RData")
# # load("./Data/3gram.RData")
# # print(getwd())
# 
# load("./Data/2gram.RData")
# load("./Data/3gram.RData")

shinyServer(function(input, output) {
    
    
    
    wordPrediction <- reactive({
        text <- input$text
        my.words <- Fsimpliy.word(text)
        predicted.word <- Fgobal.prediction(my.words)
    })
    
    output$predictedWord <- renderPrint(wordPrediction())
    output$enteredWords <- renderText({ input$text }, quoted = FALSE)
})