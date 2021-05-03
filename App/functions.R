

get_boogie_metrics <- function(HeaderValue){
  col_names <- c("danceability", "energy", "tempo")
  
  track_URI = paste0('https://api.spotify.com/v1/audio-features/6ztstiyZL6FXzh4aG46ZPD')
  track_response = httr::GET(url = track_URI, 
                       add_headers(Authorization = HeaderValue))
  boogie_features = content(track_response)
  
  temp <- as_tibble(boogie_features) %>% select(col_names)
  
  return(temp)
}


calculate_difference <- function(HeaderValue, input_link, boogie_metrics){
  #Extracting the spotify id
  temp <- gsub( ".*track/","", input_link)  
  spotify_id <- sub("\\?.*", "", temp)
  
  URI = paste0('https://api.spotify.com/v1/audio-features/', spotify_id)
  
  ### To do: check if valid link
  
  response = httr::GET(url = URI, 
    add_headers(Authorization = HeaderValue))
    random_features = content(response)
  
  col_names <- c("danceability", "energy", "tempo")
  random_tibble <- as_tibble(random_features) %>% select(col_names)
  
  ## Comparing track metrics
  
  values <- c()
  sum_values <- 0
  for (i in seq_along(boogie_metrics)){
   ##Relative difference
    diff <- abs((boogie_metrics[[i]] - random_tibble[[i]]) / boogie_metrics[[i]])
    values <- c(values, diff) 
    sum_values <- sum_values + diff
  }
  
  dance_weight <- 2.5/sum_values
  energy_weight <- 2.5/sum_values
  tempo_weight <- 5/sum_values
  weightz <- c(dance_weight, energy_weight, tempo_weight)
  
  weighted_mean <- weighted.mean(values, weightz)
  
  if (weighted_mean <= 0.25){
    return("Gus can dance too that, see?")
  } else{
    return("Gus can't dance to that!")
  }

}
