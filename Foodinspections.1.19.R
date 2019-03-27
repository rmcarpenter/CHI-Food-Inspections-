library(dplyr)
library(lubridate)


fdinsp=read.csv("Food_Inspections (4).csv")

insp.dates=as.POSIXct(fdinsp$Inspection.Date, format = '%m/%d/%Y')

fdinsp=cbind(insp.dates,fdinsp)

#January 
jan.insp.fail = fdinsp %>% 
  filter(insp.dates >= as.Date("2019-02-01") & insp.dates <= as.Date("2019-02-22")) %>% 
  filter(Results=="Fail")

#march 
feb.insp.fail = fdinsp %>% 
  filter(insp.dates >= as.Date("2019-03-01") & insp.dates <= as.Date("2019-03-22")) %>% 
  filter(Results=="Fail")



leaflet(data = jan.insp.fail %>% addTiles() %>%
  addMarkers(Longitude, Latitude)) 

leaflet(jan.insp.fail) %>% addTiles() %>% addCircleMarkers()

leaflet(data = jan.insp.fail) %>% addTiles%>%
  addMarkers(popup  = ~htmlEscape(AKA.Name))


d.in=read.delim("Compressed Mortality, 1999-2016 (1).txt")

