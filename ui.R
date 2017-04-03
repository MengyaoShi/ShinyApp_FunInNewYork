library(leaflet)
shinyUI(
  pageWithSidebar(
  headerPanel("Fun in New York. This simple app can show you several famous attractions in New York, and a real time citi-bike map, to get started, chose an attraction you are interested in. And you can then use the slider to draw a circle around your choice on map, radius is the user input. Then you can zoom in the map, until you see hear at the attraction which locates at circle center. Click the heart, there will be a link that can direct you to their official website! Notice all the blue pins near you are available citi-bikes. Enjoy!"),
  sidebarPanel(
    h3("Choose an attraction you are interested in!"),
    selectInput(inputId = "User_selection",
                label = "Attraction in New York:",
                choices = c('Statue of Liberty', 'Guggenheim','Time Square', 'The Metropolitan Museum of Art', 'The Museum of Modern Art'),
                selected = 'Time Square'),
    h2("Radius around attraction you choose!:"),
    sliderInput("slider1", "slide Me!", 0, 1000, 600)
    ),
  mainPanel(
    tabsetPanel(
      tabPanel("map", h3(textOutput("add")),
               tags$style(".leaflet {height: 400px;}"),
               leafletOutput("mymap"))
  ))
  )
)
