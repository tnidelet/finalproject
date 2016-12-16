suppressPackageStartupMessages(c(
    library(shinythemes),
    library(shiny),
    library(tm),
    library(stringr),
    library(markdown),
    library(stylo)))



shinyUI(navbarPage("My Final project", 
                   theme = shinytheme("flatly"),
#First tab
                                      tabPanel("Next Word Prediction",
                            fluidRow(
                                column(3),
                                column(6,
                                       tags$div(textInput("text", 
                                                          label = h3("Enter your text here:"),
                                                          value = "Thanks you very"),
                                                h4("The predicted next word:"),
                                                tags$span(tags$strong(tags$h4(textOutput("predictedWord")))),
                                                br(),
                                                align="center")
                                ),
                                column(3)
                            )
                   ),
#Second Tab with the explication about the app
                                      tabPanel("About My Application",
                            fluidRow(
                                column(3),
                                column(6,tags$div(
                                    h4("This small application have been developp as a part of the final project of the Data Science specialisation of John Hopkins in Coursera"),
                                    tags$a(href="https://www.coursera.org/specializations/jhu-data-science",target="_blank","Data Science Specialization"),
                                    br(),
                                    tags$hr(),
                                     h4("From a data set of texts extract from Blogs, News and Twitts, I made a text mining analysis in order to build 4, 3 and 2-grams that are associations of N number of words."),
                                     h4("From these n-grams I build a function of prediction that analyze the input text and search in all n-grams the combinaison of words that inculde the last n input words and return the most frequent combinaison that can be found."),
                                     h4("If the combinaison of input words has never been found before the function return the word the that is the more frequent word."),
                                    br(),
                                    tags$hr(),
                                    h4("The dataset has been shared by Swiftkey :"),
                                    tags$a(href="https://swiftkey.com/en",target="_blank","Swiftkey"),
                                    h4("All analysis has been done with R, RStudio and Shiny :"),
                                    tags$a(href="http://www.r-project.org/",target="_blank","R"),
                                    tags$a(href="https://www.rstudio.com",target="_blank","RStudio"),
                                    tags$a(href="http://shiny.rstudio.com",target="_blank","Shiny"),
                                    br(),
                                    tags$hr(),
                                    h4("All the scripts used to build this application can be found in this Github repository:"),
                                    tags$a(href="http://shiny.rstudio.com",target="_blank","Scripts")
                                    )
                                ),
                                column(3)
                        )
                   )
        )
)

#https://swiftkey.com/en
