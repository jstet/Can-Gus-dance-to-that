library(httr)

#You have to provide your own client credentials that can be found at the spotify developer page
source("secrets.R")

authorize <- function(){
  
  response = POST(
    'https://accounts.spotify.com/api/token',
    accept_json(),
    authenticate(clientID, secret),
    body = list(grant_type = 'client_credentials'),
    encode = 'form',
    verbose()
  )
  
  mytoken = content(response)$access_token
  
  HeaderValue = paste0('Bearer ', mytoken)
  
  return(HeaderValue)

}
