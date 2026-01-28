#Find the total number of albums in the data set.
# Minus 1 for the row with the headings

total_album_count <- function(){
  total_albums <- nrow(album_data)
    print(paste0("Albums in the database: ", total_albums - 1))
  }

#Find the total number of bands in the data set.
# Use unique to avoid counting the same band twice.

total_band_count <- function(){
  total_bands<- length(unique(album_data$Artist))
    print(paste0("Artists in the database: ", total_bands))
}


most_pop_artist <- function(){
    popular_artist <- tail(names(sort(table(album_data$Artist))), 1)
      print(paste0("Artist with most albums in the database: ", popular_artist))
}

