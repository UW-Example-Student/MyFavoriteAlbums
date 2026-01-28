# Shiny Web App for Music Data

# Load libraries so they are available
library(shiny)
library(dplyr)

# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
# List additional source files for functions
source("app_ui.R")
source("app_server.R")
source("home.R")
source("albums_by_band.R")
source("number_one_albums.R")
source("albums_by_year.R")
source("vinyl.R")
source("compare_bands.R")
source("fav_bands.R")

# You will need to fill in the `app_ui.R` file to create the layout.
# Run the app through this file.

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)
