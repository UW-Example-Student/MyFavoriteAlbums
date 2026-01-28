# Show the top 20 bands with at least x ranked albums
# Order by highest average rating
# Allow end user to choose to include EPs and Live albums or not

favorite_bands <- function(){
  #Find the average rating for each artist
  avg_per_band <- aggregate(Rating ~ Artist, album_data, mean)

  #Find the total number of albums rated for each artist
  count_per_artist <- album_data %>% group_by(Artist) %>% summarize(NumAlbums = n())

  #Join the dataframes together
  top_band_data <- merge(x = avg_per_band, y = count_per_artist, by = "Artist", all = TRUE) %>% arrange(desc(Rating))
  print(top_band_data)

  #Return only artists with at least 5 rated albums
  fav_artists <- top_band_data %>% filter(NumAlbums >= 4)

}
