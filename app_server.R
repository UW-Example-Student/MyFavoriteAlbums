library(shiny)
library(dplyr)

server <- function(input, output) {

  output$title <- renderUI({
    HTML("<h1>My Favorite Albums</h1><br>")
  })

# First tab
  output$text3 <- renderUI({
    HTML("<br><br>")
  })

  output$number_one_table <- renderTable({
    return(number_one_album(input$rng[1], input$rng[2]))
  })

# Second tab
  output$text <- renderUI({
    HTML("<br><br>")
  })

  output$text2 <- renderUI({
    HTML("<br><br>")
  })

  observeEvent(input$action_button,{

    output$album_table <- renderTable({
      return(albums_by_bands(input$band_name))
    })

    output$album_count <- renderText({
      return(band_album_count(input$band_name))
    })
    output$avg_rating <- renderText({
      return(band_mean_rating(input$band_name))
    })

  })

  # Third tab
  output$text4 <- renderUI({
    HTML("<br><br>")
  })

  output$text5 <- renderUI({
    HTML("<br><br>")
  })

  observeEvent(input$action_button2,{

    output$year_table <- renderTable({
      return(year_albums(input$year))
    })

  })

  # Fourth tab
  output$text6 <- renderUI({
    HTML("<h2>Top-rated vinyl that I don't own</h2><br>")
  })

  observeEvent(input$action_button3,{
  output$missing_vinyl_table <- renderTable({
    return(missing_vinyl(input$vinyl_rating))
  })
  })

  # Fifth tab
  output$text8 <- renderUI({
    HTML("<br><br>")
  })

  output$text8 <- renderUI({
    HTML("<br><br>")
  })

  output$compare_bands <- renderPlot({
    return(band_album_comparison_chart(input$band_name_1, input$band_name_2))
  })

}
