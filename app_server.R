server <- function(input, output) {

  output$title <- renderUI({
    HTML("<h1>My Favorite Albums</h1><br>")
  })

# Home tab - Welcome
  output$texthome1 <- renderUI({
    HTML("<br><h2>Welcome!</h2><p>My Favorite Albums allows you to analayze lists of your favorite albums from multiple years.</p>")
  })

  output$total_albums <- renderText({
      return(total_album_count())
    })

  output$total_bands <- renderText({
    return(total_band_count())
  })

  output$popular_artist <- renderText({
    return(most_pop_artist())
  })

# First tab - Number One Albums
  output$text3 <- renderUI({
    HTML("<h2>Number One Albums</h2><br>")
  })

  output$number_one_table <- renderTable({
    return(number_one_album(input$rng[1], input$rng[2]))
  })

# Second tab - Band and Artist Summary
  output$text <- renderUI({
    HTML("<h2>About an Artist's Albums</h2><br>")
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

  # Third tab - Top Albums By Year
  output$text4 <- renderUI({
    HTML("<h2>Top Albums by Year</h2><br>")
  })

  output$text5 <- renderUI({
    HTML("<br><br>")
  })

  observeEvent(input$action_button2,{

    output$year_table <- renderTable({
      return(year_albums(input$year))
    })

  })

  # Fourth tab - Vinyl
  output$text6 <- renderUI({
    HTML("<h2>Top-Rated Albums Not Owned on Vinyl</h2><br>")
  })

  observeEvent(input$action_button3,{
  output$missing_vinyl_table <- renderTable({
    return(missing_vinyl(input$vinyl_rating))
  })
  })

  # Fifth tab - Comparison Graph
  output$text8 <- renderUI({
    HTML("<h2>Compare Two Artists on the Graph</h2><br>")
  })

  output$text9 <- renderUI({
    HTML("<br><br>")
  })

  output$compare_bands <- renderPlot({
    return(band_album_comparison_chart(input$band_name_1, input$band_name_2))
  })



  # Sixth tab - Favorite Artists
  output$text10 <- renderUI({
    HTML("<h2>Artists with Highly Rated Albums</h2><br>")
  })
  observeEvent(input$action_button4,{
  output$fav_artists_table <- renderTable({
    return(favorite_bands(input$min_albums, input$live_ep_checkbox))
  })
  })
}
