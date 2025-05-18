library(dplyr)
library(DT)

# Grab the music data.
# See documentation for how to format the data
album_data <- read.csv("data/album-rankings.csv")

# Find top-rated albums that the person does not own on vinyl
missing_vinyl <- function(){
  buy_vinyl <- select(filter(album_data[order(-album_data$Rating),], Rating >= 9, Vinyl ==""), Album, Artist, Rating)
}

year_most_vinyl <-function(){
  most_vinyl <- select(filter(album_data, Vinyl == "v"), Year)
  most_vinyl_count <- filter(most_vinyl) %>% count(Year)
  most_vinyl_sort <- most_vinyl_count[order(-most_vinyl_count$n),] 
}