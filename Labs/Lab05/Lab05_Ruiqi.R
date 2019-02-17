### Part I
#1: Compare the value of x with 5
x <- 2
if (x > 5) {
  print ("x is larger than 5.")
} else {
  print ("x is equal to or smaller than 5.")
}
##2: 
#2a. Replace negative values with NA in Vector.csv
Vector1 <- read.csv("Vector1.csv")
for (i in 1:nrow(Vector1) ) {
  if ( Vector1[i,1] < 0 ) {
    Vector1[i,1] <- NA
  }
}
#2b. replace NA with NaN using vectorized code
Vector1[is.na(Vector1)] <- NaN

#2c. replace NaN with which
Vector1$x [which (is.nan(Vector1$x) )] <- 0

#2d. Number of values from data fall in the range between 50 and 100
N <- 0
for (i in 1:nrow(Vector1) ) {
  if ( Vector1[i,1] >= 50 & Vector1[i,1] <= 100) {
    N <- N + 1
  }
 }
print (N)

#2e.Create a new vector of data that has all the values from the imported data that fall in the range between 50 and 100
FiftyToOneHundred <- rep(0, N)
a <- 0
for (i in 1:nrow(Vector1) ) {
  if ( Vector1[i,1] >= 50 & Vector1[i,1] <= 100) {
    a <- a + 1
    FiftyToOneHundred[a] <- Vector1[i,1]
  }
}

#2f. Save the new vector to a file named "FiftyToOneHundred.csv"
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

### Part II
# 1. Set up parameter values
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators
# 2. reate a "time" vector, and make two additional vectors to store results, one for 'n', the other for 'p'
t <- seq (1:1000)
n <- rep(0, 1000)
n[1] <- initPrey
p <- rep(0, 1000)
p[1] <- initPred
# 3. Calculate n[t] and p[t]
for (i in 2:1000) {
  n[i] <- n[i-1] + (r * n[i-1]-(a * n[i-1] * p[i-1]) )
  p[i] <- p[i-1] + (k * a * n[i-1] * p[i-1] -(m * p[i-1]) )
} 
# 4.Check for negative numbers each generation. 
n[1] <- initPrey
p[1] <- initPred
for (i in 2:1000) {
  if( n[i-1] > 0) { # If the number of prey is more than or equal to zero, do the calculation
    n[i] <- n[i-1] + (r * n[i-1]-(a * n[i-1] * p[i-1]) )
    p[i] <- p[i-1] + (k * a * n[i-1] * p[i-1] -(m * p[i-1]) )
    } else { # If the prey abundance is negative, assign 0 to n[i], n[i-1]
    n[i] <- 0
    n[i-1] <- 0
    }
} 
# 5. Make a plot of the abundances of prey and predators over time
plot (t, n)
lines (t, p)
#6. Create a matrix of your results
myResults <- data.frame(t,n,p)
colnames(myResults) <- c("TimeStep", "PreyAbundance","PredatorAbundance")
write.csv(x = myResults, file = "PredPreyResults.csv")

#7.Part III 
initPreyVec <- seq(from = 10, to = 100, by = 10)
initPreyFrame <- rep(initPreyVec, each = 1000) # make a vector storing initial prey abundance for all the data
t <- seq (1:1000)
tFrame <- rep(t, times=10) # make a vector storing all the time points
n <- rep(0, 10000) # make a vector storing prey abundance 
n[1] <- initPreyVec [1]
p <- rep(0, 10000)  #make a vector storing predator abundance 
p[1] <- initPred

b <- 1
for (i in 2:10000) {
  if(i %% 1000 ==1 ) { #start over from intial prey abundance when n%%==1
    b <- b + 1 
    n[i] <- initPreyVec [b] # assign initial prey abundance to n[i]
    p[i] <- initPred
  } else {  # calculate prey and predator numbers if n%%1000 is not equal to 1
    if ( n[i-1] > 0) { # do the calculation when prey abundance is larger than 0
      n[i] <- n[i-1] + (r * n[i-1]-(a * n[i-1] * p[i-1]) )
      p[i] <- p[i-1] + (k * a * n[i-1] * p[i-1] -(m * p[i-1]) )
    } else { # If the prey abundance is negative, assign 0 to n[i], n[i-1]
      n[i] <- 0
      n[i-1] <- 0 
    }
  }
}  

myResults2 <- data.frame(initPreyFrame, tFrame, n, p)
colnames(myResults2) <- c("InitialPrey ","TimeStep", "PreyAbundance","PredatorAbundance") # Change column names
write.csv(x = myResults2, file = "InitialPrey_PredPreyResults.csv")  # Save the data to a csv file
  
