growthModel <- function(r,K,a,n) { #Turn the logistic growth model code into a function
  Abundance <<- rep(0,n) #Creat a vector to store abundance data
  Abundance[1] <<- a # Set the initial population size
  Generation <<- seq (1,n) # Creat a vector to store time spots
  for (i in 2:n) { #Use loop to calculate population sizes 
    Abundance[i] <<- Abundance[i-1] + (r * Abundance[i-1] * (K - Abundance[i-1])/K)
  }
  Data <<- data.frame(Generation, Abundance)
  colnames(Data) <<- c("generations","abundance")
  png(filename="growthModelPlot.png") # Save the plot
  plot(Generation, Abundance) # Plot data
  dev.off()
  return(Data)
}

growthModel(0.5,10000,2500,12) # test function
write.csv(Data,file="growthModelData.csv") # Wirite data to a file