# List all of the years
# Used to populate the pull-down menu
all_years <- sort(unique(album_data$Year))

# List the top albums for a year, in ranking order
year_albums <- function(year.var){
  year_list <- select(filter(album_data[order(album_data$Ranking),], Year == year.var), Ranking, Album, Artist)
}
year_albums(2024)
