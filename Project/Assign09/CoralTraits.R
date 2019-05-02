#setwd("~/Desktop/compBioProject/Coral Trait DataBase/ctdb_1.1.1 3")
library(dplyr)
library(plyr)
library(ggplot2)
library(tidyverse)
# Take a look at the database 
CoralTraitDataBase <- read.csv("ctdb_1.1.1_data.csv")
str(CoralTraitDataBase)
head(CoralTraitDataBase)

#Have a look at trait name and select trait of interested
TraitName <- unique(CoralTraitDataBase$trait_name)
TraitName

#Have a look at how those traits look like
# levels of categorical data
GeoName <- unique(subset(CoralTraitDataBase, trait_name == "Geographical region")$value)
GeoName
symbioClade <- unique(subset(CoralTraitDataBase, trait_name == "Symbiodinium subclade")$value)
symbioClade
oceanBasin <- unique(subset(CoralTraitDataBase, trait_name == "Ocean basin")$value)
oceanBasin
# number of data points of traits of interested: seems like "photosynthetic rate" does not have sufficient data
nrow(subset(CoralTraitDataBase, trait_name == "Growth rate"))
nrow(subset(CoralTraitDataBase, trait_name == "Symbiodinium subclade"))
nrow(subset(CoralTraitDataBase, trait_name == "Chlorophyll a"))
nrow(subset(CoralTraitDataBase, trait_name == "Symbiodinium density"))
nrow(subset(CoralTraitDataBase, trait_name == "Gross photosynthesis"))
nrow(subset(CoralTraitDataBase, trait_name == "Calcification rate"))


# Now I have targeted photosymbiotic related trait: Symbiodinium subclade,Symbiodinium density,as well as physiological trait: Growth rate, Chlorophyll a, Calcification rate
# Let's see how many data are available for two of those traits from one species
# I also need to keep the geographical region info for future analysis.

#First, I get subsets for each trait of dataframe and them=n calculate values for each species
#numneric data
growthData <- filter(CoralTraitDataBase, trait_name == "Growth rate")
growthData$value <- as.numeric(as.character(growthData$value)) 
str(growthData)
coralGrowthData <- growthData %>%
  group_by(specie_name) %>%
  summarise( growthrate = mean(value) )

choroData <- filter(CoralTraitDataBase, trait_name == "Chlorophyll a")
choroData$value <- as.numeric(as.character(choroData$value)) 
coralChoroData <- choroData %>%
  group_by(specie_name) %>%
  summarise( Chorophyll = mean(value) )

symbioDenseData <- filter(CoralTraitDataBase, trait_name == "Symbiodinium density")
symbioDenseData$value <- as.numeric(as.character(symbioDenseData$value)) 
coralSymbioDensityData <- symbioDenseData %>%
  group_by(specie_name) %>%
  summarise( symbioDensity = mean(value) )

calRateData <- filter(CoralTraitDataBase, trait_name == "Calcification rate")
calRateData$value <- as.numeric(as.character(calRateData$value)) 
coralCalRateData <- calRateData %>%
  group_by(specie_name) %>%
  summarise( calRate = mean(value) )

geoData <- filter(CoralTraitDataBase, trait_name == "Geographical region")
geoData$value <- as.character(geoData$value)
geoData <- geoData%>%
  select(specie_name, value)
coralGeoData <- geoData %>%
  group_by(specie_name) %>%
  summarise( subclade = value )
#categorical data

#symbio subclade
symbioCladeData <- filter(CoralTraitDataBase, trait_name == "Symbiodinium subclade")
symbioCladeData$value <- as.character(symbioCladeData$value) 
symbioCladeData <- symbioCladeData%>%
  select(specie_name, value)
symbioCladeData <- symbioCladeData %>% distinct() #delete duplicates
CoralsymbioCladeData <- count(symbioCladeData, "specie_name")



# Next, I will merge the data files of traits of interested
#Figure 1
SymbioDensityVSgrowth <- merge(coralgrowthData, coralSymbioDensityData, by = "specie_name")
ggplot(SymbioDensityVSgrowth, aes(x=symbioDensity, y=growthrate)) + 
  geom_point() +
  xlab("Symbiotic Density") +
  ylab("Growth Rate") +
  labs(caption = "Figure 1 Relationship between symbiotic density and growth rate")

# Figure 2
SymbioDensityVScal <- merge(coralCalRateData, coralSymbioDensityData, by= "specie_name")
ggplot(SymbioDensityVScal, aes(x=symbioDensity, y=calRate)) + 
  geom_point() +
  xlab("Symbiotic Density") +
  ylab("Calcification Rate") +
  labs(caption = "Figure 2 Relationship between symbiotic density and calcification rate")


SymbioDensityVSchoro <- merge(coralChoroData, coralSymbioDensityData, by= "specie_name")
ggplot(SymbioDensityVSchoro, aes(x=symbioDensity, y=Chorophyll)) + geom_point()

# symbiotic diversity and growth rate/calcification rate
#figure 3
growthVSSymbioDiversity <- merge(coralgrowthData, CoralsymbioCladeData, by = "specie_name")
growthVSSymbioDiversity$freq <- as.factor(growthVSSymbioDiversity$freq)
ggplot(growthVSSymbioDiversity, aes(x = freq, y=growthrate)) + 
  geom_boxplot() +
  xlab("Symbiotic Subclade Diversity") +
  ylab("Growth Rate") +
  labs(caption = "Figure 3 Relationship between symbiotic subclade diversity and growth rate")

#figure 4
calVSSymbioDiversity <- merge(coralCalRateData, CoralsymbioCladeData, by = "specie_name")
calVSSymbioDiversity$freq <- as.factor(calVSSymbioDiversity$freq)
ggplot(calVSSymbioDiversity, aes(x = freq, y=calRate)) + 
  geom_boxplot() +
  xlab("Symbiotic Subclade Diversity") +
  ylab("Calcification Rate") +
  labs(caption = "Figure 4. Relationship between symbiotic subclade diversity and calcification rate")


#zooxanthellate & growth rate
#Figure 5
zooxanData <- filter(CoralTraitDataBase, trait_name == "Zooxanthellate")
zooxanData$value <- as.character(zooxanData$value)
coralZooxanData <- zooxanData %>%
  select(specie_name, value)
zooxanVSgrowth <- merge(coralgrowthData, coralZooxanData, by = "specie_name")
ggplot(zooxanVSgrowth, aes(x=value, y=growthrate)) + 
  geom_boxplot() +
  xlab("Zooxanthellate Status") +
  ylab("Growth Rate") +
  labs(caption = "Figure 5. Gowth Rate Comparison between Zooxanthellate and Non-zooxanthellate corals")



