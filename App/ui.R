library(shiny)
library(shinydashboard)


ui <- dashboardPage(
    skin = "green",
    dashboardHeader(
        title = ("Can Gus dance to that?"),
        titleWidth = 400
    ),
    dashboardSidebar(
        width = 400,
        textInput("spotify_link","To find out, enter a spotify link to a track below:", width=450),
        actionButton("submit_link", "Submit Link"),
        textOutput("code"),
        verbatimTextOutput("error")
    ),
    dashboardBody(
        tags$div(
            style = "height: 90vh",
            tags$video(src="video.mp4",
                       autoplay="autoplay",
                       type="video/mp4",  ##Not included in repo because I'm not sure about copyright
                       style="height:100%; width:100%"
            )
        )
        
    )
    
)


