library(ggplot2)
### Problem 1
CusackData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv")
# Make the plot
ggplot(data=CusackData, aes(x=Species)) +
  geom_bar()

### Problem 2
ggplot(data=CusackData, aes(x=Species)) +
  geom_bar() + 
  # Rotate the axis tick labels
  theme(axis.text.x = element_text(angle=90, hjust=1))

### Problem 3
CountData <- count(CusackData, "Species")
# sort the species from least to most abundant in the plot
ggplot(data=CountData, aes(x=reorder(Species,-freq), y=freq)) +
  geom_bar(stat="identity") + 
  # flip the axes
  coord_flip() +
  # transform the count axis to be logarithmic
  scale_y_log10()
  