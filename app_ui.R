# This file builds the Shiny UI. It has seven tabs, including the Home tab.
# The file partners with app_server.R for inputs and outputs.
# The app.R file is the main file.
library(shiny)

# Grab the music data.
# See documentation for how to format the data
album_data <- read.csv("data/album-rankings.csv")

# List all of the bands in alphabetical order
# Used to populate the pull-down menu
all_bands <- sort(unique(album_data$Artist))

# List all of the years
# Used to populate the pull-down menu
all_years <- sort(unique(album_data$Year))

ui <- fluidPage(
    mainPanel(htmlOutput("title"),
      tabsetPanel(
        id = "tabset",
        tabPanel("Home",
                 htmlOutput("texthome1"),
                 textOutput("total_albums"),
                 textOutput("total_bands"),
                 textOutput("popular_artist")),
        tabPanel("Number One Albums",
                 htmlOutput("text3"),
                 sliderInput("rng", "Choose the Years", value = c(1993, 1998), min = 1993, max = 2024, sep = ""),
                 tableOutput("number_one_table")),
        tabPanel("Top Albums by Year",
                 htmlOutput("text4"),
                 selectInput("year", "Choose a year:", all_years),
                 actionButton("action_button2", label = "Submit"),
                 htmlOutput("text5"),
                 tableOutput("year_table")),
        tabPanel("Artists' Albums",
                 htmlOutput("text"),
                 selectInput("band_name", "Choose a band or artist:", all_bands),
                 actionButton("action_button", label = "Submit"),
                 htmlOutput("text2"),
                 tableOutput("album_table"),
                 textOutput("album_count"),
                 textOutput("avg_rating")),
        tabPanel("Favorite Artists",
                 htmlOutput("text10"),
                 selectInput("min_albums", "Minimum number of albums:",
                             c("10 "= 10, "9" = 9, "8" = 8, "7" = 7, "6" = 6, "5" = 5, "4" = 4, "3" = 3, "2" = 2, "1" = 1)),
                 checkboxInput("live_ep_checkbox", "Exlude EPs and Live Albums", TRUE),
                 actionButton("action_button4", label = "Submit"),
                 tableOutput("fav_artists_table")),
        tabPanel("Artist Comparison",
                 htmlOutput("text8"),
                 selectInput("band_name_1", "First band or artist:", all_bands),
                 selectInput("band_name_2", "Second band or artist:", all_bands),
                 htmlOutput("text9"),
                 plotOutput("compare_bands")),
        tabPanel("Vinyl",
                 htmlOutput("text6"),
                 selectInput("vinyl_rating", "Select which albums to display:",
                             c("Only 10 ratings" = 10, "9 and higher" = 9, "8 and higher" = 8, "7 and higher" = 7)),
                 actionButton("action_button3", label = "Submit"),
                 tableOutput("missing_vinyl_table"))
    )
    )
)

