library(httr)
library(shiny)
library(tidyverse)

source("spotify_auth.R", local = TRUE)

source("functions.R", local = TRUE)

server <- function(input, output, session){
    
    HeaderValue <- authorize()
    
    get_boogie_metrics(HeaderValue = HeaderValue)
    
    observeEvent(input$submit_link,
        output$error <- renderText(as.character(calculate_difference(HeaderValue, input$spotify_link, get_boogie_metrics(HeaderValue = HeaderValue))))
    )
    
    ##To do: hide video at first, instead display something else
    #show different videos when answer changes
    #change playback speed of video -> calculate speed change through bpm
    #cut video so it fits to bpm
    #make spotify play the song
    #when user pauses, video should pause too
    #maybe optimize for mobile devices
    
}


