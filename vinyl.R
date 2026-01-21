# Find top-rated albums that the person does not own on vinyl
missing_vinyl <- function(missing_vinyl_rating.var){
  buy_vinyl <- select(filter(album_data[order(-album_data$Rating),], Rating >= as.numeric(missing_vinyl_rating.var), Vinyl ==""), Album, Artist, Rating)
}
missing_vinyl(10)

