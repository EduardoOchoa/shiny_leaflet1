
library(shiny)
library(leaflet)

#Coordenadas de México, Brasil, Argenita, Chile, Uruguay, Cuba, EUA, Canada

#lng<-c(-102,-55,-64,-71,-80,-95,-97,-56)
#lat<-c(23,-10,-34,-30,21.3,60,38,-33)

ui <- fluidPage(
  leafletOutput("map")
)

server <- function(input, output) {
  
  #points <- cbind(lng,lat)
  c <- read.csv("cities.csv")
  cities <-data.frame(c)
 
  output$map <- renderLeaflet({
    leaflet() %>%
    addTiles() %>% 
    addMarkers(data=cities,lng = ~ cities$Longitude,lat=~ cities$Latitude,popup=~cities$City)
    })
}

shinyApp(ui = ui, server = server)
