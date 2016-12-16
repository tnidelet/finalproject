


#loading files
#this three files has been generated with the tidytext package
load("tidy4gram.RData")
load("tidy3gram.RData")
load("tidy2gram.RData")



#function to transform the input text in a serie of word. Use a fonction of the quanteda package. 
Fsimpliy.word <- function(my.text){
    my.words <- toLower(tokenize(my.text,
                         removeNumbers = TRUE,
                         removePunct = TRUE,
                         removeSymbols = TRUE, 
                         removeSeparators = TRUE,
                         removeTwitter = TRUE,
                         removeHyphens = TRUE,
                         removeURL = TRUE,
                         ngrams = 1)[[1]])
    return(my.words)
}


#Function to predict the next word when the length of the input text is at least 3.
fword.prediction.4 <- function(my.words){
    predicted.word <- "the"
    
    my.res <- my4Gram %>%
        filter(word1 == my.words[1]) %>%
        filter(word2 == my.words[2]) %>%
        filter(word3 == my.words[3])
    if(nrow(my.res)!=0){
        predicted.word <- my.res$word4[which.max(my.res$n)]
    }else{
        my.res <- my3Gram %>%
            filter(word1 == my.words[1]) %>%
            filter(word2 == my.words[2])
        if(nrow(my.res)!=0){
            predicted.word <- my.res$word3[which.max(my.res$n)] 
        }else{
            my.res <- my2Gram %>%
                filter(word1 == my.words[2])
            if(nrow(my.res)!=0){
                predicted.word <- my.res$word2[which.max(my.res$n)] 
            }
        }   
    }
    return(predicted.word) 
}

#Function to predict the next word when the length of the input text is at least 2.
fword.prediction.3 <- function(my.words){
    predicted.word <- "the"
    
    my.res <- my3Gram %>%
        filter(word1 == my.words[1]) %>%
        filter(word2 == my.words[2])
    if(nrow(my.res)!=0){
        predicted.word <- my.res$word3[which.max(my.res$n)] 
    }else{
        my.res <- my2Gram %>%
            filter(word1 == my.words[2])
        if(nrow(my.res)!=0){
            predicted.word <- my.res$word2[which.max(my.res$n)] 
        }
    }   
    return(predicted.word) 
}

#Function to predict the next word when the length of the input text is one.
fword.prediction.2 <- function(my.words){
    predicted.word <- "the"
    my.res <- my2Gram %>%
        filter(word1 == my.words[2])
    if(nrow(my.res)!=0){
        predicted.word <- my.res$word2[which.max(my.res$n)] 
    }
    return(predicted.word) 
}

#Global function that will test the length of the input text and choose the appropriate function of word prediction
Fgobal.prediction <- function(my.words){
    if(length(my.words) >=3){
        my.words <- tail(my.words,3)
        predicted.word <- fword.prediction.4(my.words)
    }else{
        if(length(my.words)==2){
            predicted.word <- fword.prediction.3(my.words)
        }else{
            if(length(my.words)==1){
                predicted.word <- fword.prediction.2(my.words)
            }else{
                predicted.word <- "the"
            }
        }
    }
    print(predicted.word)
}