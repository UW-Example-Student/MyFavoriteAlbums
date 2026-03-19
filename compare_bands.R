library(ggplot2)

# Compare rating of two bands' albums over time on a line chart
band_album_comparison_chart <- function(var.artist1, var.artist2){
  band1_albums <- select(filter(album_data[order(album_data$Year),], Artist==var.artist1), Artist, Album, Year, Rating)
  band2_albums <- select(filter(album_data[order(album_data$Year),], Artist==var.artist2), Artist, Album, Year, Rating)

  ggplot() +
    geom_line(data = band1_albums, aes(x = Year, y = Rating), color = "red") +
    geom_line(data = band2_albums, aes(x = Year, y = Rating), color = "blue") +
    geom_point(data = band1_albums, aes(x = Year, y = Rating)) +
    geom_point(data = band2_albums, aes(x = Year, y = Rating)) +
    xlab("Year")+
    ylab("Rating")+
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
    ggtitle(paste0("Album Ratings for " , band1_albums$Artist, "(Red) and ", band2_albums$Artist, "(Blue)"))+
    scale_x_continuous(breaks=seq(earliest_year,most_recent_year,1))+
    scale_y_continuous(breaks=seq(0,10,1))+
    expand_limits(x=c(earliest_year,most_recent_year), y=c(0,10))
}
