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
   
    
}


