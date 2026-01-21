# List all of the bands in alphabetical order
# Used to populate the pull-down menu
all_bands <- sort(unique(album_data$Artist))

albums_by_bands <- function(band.var){
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
}

band_mean_rating <- function(band.var){
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
  avg_rating <- mean(band_albums$Rating)
  print(paste0("Average Rating: ", format(round(avg_rating, 2), nsmall =2)))
}

band_album_count <- function(band.var){
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
  band_count <-count(band_albums)
  print(paste0("Number of Albums Ranked: ", band_count))
}




