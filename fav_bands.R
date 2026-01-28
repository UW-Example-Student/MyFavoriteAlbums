# Show the top 20 bands with at least x ranked albums
# Order by highest average rating
# Allow end user to choose to include EPs and Live albums or not

favorite_bands <- function(min_albums.var, live_ep.var){

  if (live_ep.var == TRUE) {
    # Get rid of EPs and Live albums if condition is TRUE
    album_data_checked <- select(filter(album_data, EP != "EP" & Live != "Live"), Year, Ranking, Album, Artist, Rating, Vinyl, EP, Live)
  } else {
    album_data_checked <- album_data
  }

  #Find the average rating for each artist
  avg_per_band <- aggregate(Rating ~ Artist, album_data_checked, mean)

  #Find the total number of albums rated for each artist
  count_per_artist <- album_data_checked %>% group_by(Artist) %>% summarize(NumAlbums = n())

  #Join the dataframes together
  top_band_data <- merge(x = avg_per_band, y = count_per_artist, by = "Artist", all = TRUE) %>% arrange(desc(Rating))

  #Return only artists with at least X rated albums
  fav_artists <- top_band_data %>% filter(NumAlbums >= as.numeric(min_albums.var)) %>% slice(1:15)
}
