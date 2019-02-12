### Part I
# Write a “for loop” that prints the word “hi” to the console 10 times
for ( i in 1:10 ) {
  print ("hi")
}

# Tim's total amount of money each week for next 8 weeks
for ( i in 1:8 ) {
  Money <- 10 + 5*i - 1.34*2*i
  print (Money)
}

# Expected population size each year for the next seven years
for ( i in 1:7 ) {
  Popusize <- 2000 * 0.95^i
  
  print ( round(Popusize) )
}

# Abundance of the population
Abun <- 2500
K <- 10000
r <- 0.8
for (t in 2:12) {
  Abun <- Abun + (r * Abun * (K - Abun)/K)
  print (Abun)
}
print ( paste("The predict value of n[12] is", Abun) )

### Part 2
# 5a
a <- rep (0,18)
print (a)

# 5b 
for ( i in seq(1,18) ) {
  a[i] <- 3*i
}
print (a)

# 5c
b <- rep (0,18)
b[1] <- 1
print (b)

# 5d 
for ( i in seq(2,18) ) {
  b[i] <- 2*b[i-1] + 1
}
print (b)

# the first 20 Fibonacci numbers
c <- rep (0,20)
c[2] <- 1
for ( i in seq(3,20) ) {
  c[i] <- c[i-1] + c[i-2]
}
print (c)

# 
# Abundance of the population
Abundance <- rep(0,12)
Abundance[1] <- 2500
time <- rep (0,12)
time[1] <- 1
K <- 10000
r <- 0.8
for (i in 2:12) {
  Abundance[i] <- Abundance[i-1] + (r * Abundance[i-1] * (K - Abundance[i-1])/K)
  time[i] <- time[i-1] + 1
}
print (Abundance)
print (time)
plot(time, Abundance)

### Part III
# 8a
CO2data <- read.csv("CO2_data_cut_paste.csv")

# 8b
 # use option in 'read.csv()'
CO2data <- read.csv("CO2_data_cut_paste.csv", colClasses=c("integer",rep ("numeric",7)))

 # Use 'for' loop
for (i in 2:8) {
  CO2data[,i] <- as.numeric( CO2data[,i] )
  }

# 8c
 # Element-by-element operations on data
CO2_0 <- CO2data[-1,]
CO2_cal <- CO2data[-263,]
CO2_1 <- (CO2_0 - CO2_cal)/CO2_cal
CO2_1$Year <- CO2_0$Year

 # Nested for loops
CO2_2 <- CO2data
for (t in 2:8) {
  for (i in 2:263) {
    CO2_2[i,t] <- (CO2data[i,t] - CO2data[i-1,t]) / CO2data[i-1,t]
  }
}
CO2_2 <- CO2_2[-1,]
 # Compare
CO2_1check <- CO2_1
CO2_2check <- CO2_2
CO2_1check[is.na(CO2_1check)] <- 0
CO2_2check[is.na(CO2_2check)] <- 0
check <- CO2_1check == CO2_2check # store the results in check. ALL TRUE.

#8d
write.csv(CO2_1, file = "YearlyPercentChangesInCO2.csv")

#8e calculate the percent change from the first year for which there is non-zero data. 
CO2_3 <- CO2data
CO2data[is.na(CO2data)] <- 0
  for (t in 2:8) {
    for (i in 1:262) {
      if (CO2data[i,t] != 0) {
      CO2_3[i+1,t] <- (CO2data[i+1,t] - CO2data[i,t]) / CO2data[i,t]
  } else {
  CO2_3[i+1,t] <- NA
  }
    }
      }

CO2_3 <- CO2_3[-1,]
write.csv(CO2_3, file = "8e_YearlyPercentChangesInCO2.csv")