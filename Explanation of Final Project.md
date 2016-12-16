A New Word Prediction App
========================================================
author: Thibault Nidelet 
date: 08/12/2016
autosize: true


Overall Goal
========================================================


The overall goal of this presentation it to explain how I build a application that predict the next word from a text entered by the user. 
You can find this application at [here](https://tnidelet.shinyapps.io/tnidelet_word_prediction/)

This application hase been created as the final project of the of the [Data Science specialization](https://www.coursera.org/specializations/jhu-data-science) of John Hopkins in Coursera. 

The dataset that I used to build my prediction application has been shared by : [Swiftkey](https://swiftkey.com/en)

It is composed of texts extract from:
- Blogs
- News
- Twitts


How the app works
========================================================

Just type a word, phrase or sentence and the app will print in the lower windows the most probable next prediected word. 

Steps to predict the next word : 
- load the N-grams (that are associations of words)
- Read the user text input and clean it (Put everything in lowercase, supress numbers etc.)
- Compare the input text with the N-grams with a backoff algorithm 
- print the most probabled next word 


Details of how tha application has been build
========================================================

I first build the 2-grams, 3-grams and 4-grams from the dataset with the **tidytext** and **quanteda** packages.Then I clean the user thex input and keep at most the last 3 words that I will compare to my N-grams.

- first search in the 4-gram data frame if the last 3 input words is found, if yes return the most probable one. Otherwise;
- Search in the 3-gram data frame if the last 2 input words is found, if yes return the most probable one. Otherwise; 
- Search in 2-gram data frame if the last 1 input words is found, if yes return the most probable one. Otherwise;
- At last, if none matching, displays word **"the"** the most frequent word.



Focus of this application
========================================================

To build this application I make different decision that impact the prediction quality. Here my first priority was the speed of prediction and the memory used. In order to maximize this two factors I only keep the unique N-grams that represent 90% of the total numbers of a N-grams. For example from the 52 000 000 possible 4-grams I only keep 8 000 000 of associations.

By making this optimization I obtain a final application that : 
- Predict the next word in approximately **0.08** seconds
- That weighs less than **80Mo**
- Have à **20%** final accuracy 



Usefull Links
========================================================

[Swiftkey](https://swiftkey.com/en)  
[R](http://www.r-project.org/)  
[RStudio](https://www.rstudio.com)   
[Shiny](http://shiny.rstudio.com)  
The application can be found [here](https://tnidelet.shinyapps.io/tnidelet_word_prediction/)  
All the scripts used to build this application can be found in this [Github](https://github.com/tnidelet/finalproject)  
                                    






