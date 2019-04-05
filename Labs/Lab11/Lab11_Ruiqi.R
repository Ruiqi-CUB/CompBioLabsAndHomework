### Import Data 
Database <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)
colnames(Database)[4] <- "Density"

# 4. Find the row of missing data and remove it
rowNum<- which(is.na(Database$Density))
DensityData <- Database[!is.na(Database$Density),]

# 5. Calculate means by binomial names
library(dplyr)
# method 1
speciesDensityData <- DensityData %>%
  group_by(Binomial, Family) %>%
  summarise( speciesDensity = mean(Density) )
# method 2
speciesDensityData2 <-  aggregate(DensityData[, 4], list(DensityData$Binomial, DensityData$Family), mean)
colnames(speciesDensityData2) <- c("Binomial", "Family", "speciesDensity")

# check the results : True
all.equal(speciesDensityData, speciesDensityData2)

# 6. Contrasting most and least dense families
# Get Family Data
familyDensityData <- speciesDensityData %>%
  group_by(Family) %>%
  summarise( MeanDensity = mean(speciesDensity) )
# by descending order: the first eight rows of the reults show the 8 families with the highest average densities
descFamilyDensityData <- familyDensityData %>% 
  arrange(desc(MeanDensity))

# by ascending order: the first eight rows of the reults show the 8 families with the lowest average densities
ascFamilyDensityData <- familyDensityData %>% 
  arrange(MeanDensity)


# 7. Plotting densities of most and least dense families with facets
library(ggplot2)

MostDenseRows <- (speciesDensityData$Family %in% descFamilyDensityData$Family[1:8] )
MostDenseData <- speciesDensityData[MostDenseRows,]


ggplot(MostDenseData, aes(y = speciesDensity)) + 
  geom_boxplot() +
  facet_wrap(facets = ~Family,  ncol=4)

LeastDenseRows <- (speciesDensityData$Family %in% ascFamilyDensityData$Family[1:8] )
LeastDenseData <- speciesDensityData[LeastDenseRows,]

ggplot(LeastDenseData, aes(y = speciesDensity)) + 
  geom_boxplot() +
  facet_wrap(facets = ~Family, ncol=4)
# Facilitating comparisons with graphics.
ggplot(MostDenseData, aes(y=speciesDensity, x=Family)) + 
  geom_boxplot() +
  coord_flip() +
  ylim(0, 1.2)

ggplot(LeastDenseData, aes(y=speciesDensity, x=Family)) + 
  geom_boxplot() +
  coord_flip() +
  ylim(0, 1.2)