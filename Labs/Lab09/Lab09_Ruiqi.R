### Preliminary Step: import the camera trap data file
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

### Problem 1
#convert those dates and times into actual objects that represent time 
# Start working with a small vector with same sructure
library(dplyr)
library(tidyr)
# Split column Datetime into 2 columns
camData <- separate(data = camData, col = DateTime, into = c("Date", "Time"), sep = " ")
# Change format 
camData$Date<- as.Date(camData$Date,format='%d/%m/%Y')
# Combine Date and Time columns 
camData$DateTime <- paste(camData$Date, " ", camData$Time)
# Delete and Time columns 
camData$Date <- NULL
camData$Time <- NULL

###Problem 2
camData <- separate(data = camData, col = DateTime, into = c("Year", "Month", "Day"), sep = "-")
#store the row numbers in RowsNot
RowsNOT <- which(camData$Year < 2000)

###Problem 3
camData$Year<- as.numeric(camData$Year)

for (i in 1:length(camData$Year)) {
  if (camData$Year[i]< 2000) {
    camData$Year[i]<- camData$Year[i]+ 2000
  } else {
    camData$Year[i]<- camData$Year[i]
  } 
}
camData$Year<- toString(camData$Year)
camData$DateTime <- paste(camData$Year, "-", camData$Month, "-", camData$Day)
head(camData)
#Problem 4
library(tidyverse)
camData %>%
  spread(key = c(Station, Season,Species), value = DateTime)