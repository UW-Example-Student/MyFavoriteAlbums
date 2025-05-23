# Grab the music data.
# See documentation for how to format the data
album_data <- read.csv("data/album-rankings.csv")

# List the Number 1 album for each year in the indicated range
number_one_album <- function(var.startyear, var.endyear){
  top_albums <- select(filter(album_data, Ranking ==1, Year >= var.startyear, Year <= var.endyear), Year, Album, Artist)
}
