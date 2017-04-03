shinyServer(function(input, output) {

  NewYorkAttract <- data.frame(
    lat = c(40.6892494,40.7829045,40.758895,40.7794376,40.7614342),
    lng = c(-74.0466891,-73.9589513,-73.9873197,-73.9633131,-73.9776524)
  )
  AttractionIcon<- makeIcon(
    iconUrl = 'http://www.clker.com/cliparts/9/A/I/s/M/X/heart-fund-logo.svg',
    iconWidth = 60, iconHeight = 60,
    iconAnchorX = 30, iconAnchorY = 30

  )
  name<-c('Statue of Liberty', 'Guggenheim','Time Square', 'The Metropolitan Museum of Art', 'The Museum of Modern Art')
  rownames(NewYorkAttract)<-name





  NewYorkAttractSites <- c(
    "<a href='https://www.nps.gov/stli/index.htm'>Statue of Liberty</a>",
    "<a href='https://www.guggenheim.org/'>Guggenheim</a>",
    "<a href='http://www.timessquarenyc.org/index.aspx'>Time Square</a>",
    "<a href='http://www.metmuseum.org/'>The Metropolitan Museum of Art</a>",
    "<a href='https://www.moma.org/'>The Museum of Modern Art</a>"
  )
  library(jsonlite)
  citibike <- fromJSON("http://citibikenyc.com/stations/json")
  NewYorkBikes<-data.frame(
    lat<-citibike$stationBeanList$latitude,
    lng<-citibike$stationBeanList$longitude
  )
  colnames(NewYorkBikes)[which(names(NewYorkBikes)=="lat....citibike.stationBeanList.latitude")]<-"lat"
  colnames(NewYorkBikes)[which(names(NewYorkBikes)=="lng....citibike.stationBeanList.longitude")]<-"lng"

  output$add <- renderText({paste("Attraction name:", input$User_selection)})


  output$mymap <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(data=NewYorkAttract, clusterOptions = markerClusterOptions(),popup = NewYorkAttractSites, group="Attractions", icon=AttractionIcon) %>%
      addCircles(data=NewYorkAttract[rownames(NewYorkAttract)==input$User_selection,], weight=1,radius=input$slider1 )%>%
      addMarkers(data=NewYorkBikes, clusterOptions=markerClusterOptions(), group="Bikes")



  })
})
