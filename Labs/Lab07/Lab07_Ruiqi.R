### Problem 1

# Function definition:
# Wirte a function that calculates the area of a triangle
# given base and height
triArea <- function(base, height) {
  #calculate triangle area
  Area <- 0.5 * base * height
  # return area value
  return (Area)
}

# Demonstration of usage:
# Suppose a triangle with base of 10 and height of 9
# We expect the area to be 45
triArea(base = 10, height = 9)


###Problem 2
# Function definition:
# Wirte a function that the absolute value of a number
myAbs <- function(x) {
    for (i in 1:length(x)) {
      if(x[i] >= 0) {
        next
      } else {
      x[i] <- -x[i]
      }
    }
    return (x)
}

# Demonstration of usage: 
myAbs (5)
myAbs (-2.3)
myAbs (c(1.1, 2, 0, -4.3, 9, -12))
#works well

### Problem #3
# Wirte a function that returns a vector of the first `n` Fibonacci numbers
# Given starting number '0' or '1' and desired number 'n'
myFibo <- function(a,n) {
  num <- rep (0,n) # create a vector storing data
  if (a==0) { # start with 0
    num[1]<-0
    num[2]<-1
    for(i in 3:n) {
      num[i] <- num[i-1] + num[i-2]
    }
  } else { # start with 1
    num[1]<-1
    num[2]<-1
    for(i in 3:n) {
      num[i] <- num[i-1] + num[i-2]
    }
  }
  return(num)
}
# Demonstration of usage: 
# start with 1
myFibo(1,10)
# start with 0
myFibo(0,10)

##works well

##3a
myFibo3a <- function (a,n) {
  # when n=1
  if (n==1) {
    return(a)
    } else {
      # when n=2
      if (n==2) {
        b <- a+1
        num <- c(a,b)
        return(num)
      } else {
        num <- rep (0,n) # create a vector storing data
        if (a==0) { # start with 0
          num[1]<-0
          num[2]<-1
          for(i in 3:n) {
            num[i] <- num[i-1] + num[i-2]
          }
        } else { # start with 1
          num[1]<-1
          num[2]<-1
          for(i in 3:n) {
            num[i] <- num[i-1] + num[i-2]
          }
        }
        return(num)
      }
    }
}
# Demonstration of usage: input n=1, should return a number
myFibo3a(0,1)
#input n=2, expect it to return 2 numbers
myFibo3a(0,2)
#input more than 2, should return Fibonacci sequenc with n numbers
myFibo3a(0,10)

#works well


##3b
myFibo3b <- function (a,n) {
  # check the input
  if ((a==1|a==0) && (n%%1==0 && n > 0) ){
    num <- rep (0,n) # create a vector storing data
    if (n==1) {
      return(a)
    } else {
      # when n=2
      if (n==2) {
        b <- a+1
        num <- c(a,b)
        return(num)
      } else {
        num <- rep (0,n) # create a vector storing data
        if (a==0) { # start with 0
          num[1]<-0
          num[2]<-1
          for(i in 3:n) {
            num[i] <- num[i-1] + num[i-2]
          }
        } else { # start with 1
          num[1]<-1
          num[2]<-1
          for(i in 3:n) {
            num[i] <- num[i-1] + num[i-2]
          }
        }
        return(num)
      }
    }
  } else {
    return ("Please check your inputs")
  }
}

# Demonstration of usage: input n=1, should return a number
#enter a not equal to 1 or 2, expect an error
myFibo3b(3,3)
#enter n not a positive integer, exect an error
myFibo3b(1,12.2)
#input proper arguments, should return Fibonacci sequenc with n numbers
myFibo3b(1,10)
#works well

### Problem 4
# Wirte a function that returns the square of the difference between 2 numbers
squareDiff <- function (x,y) {
  cal <- (x - y) ^ 2
  return (cal)
}

# Demonstration of usage: input 3,5, expect 4
squareDiff(3,5)
# input a vector
squareDiff( c(2, 4, 6), 4 )
##works well

##Part 4b
#Write a unction that returns the mean of a vector
Aver <- function (x) {
  aver <- sum(x) / length(x) #sum/number of elements
  return(aver)
}

#Test: calling with the vector `c(5, 15, 10)
Aver( c(5, 15, 10) )

#test 2: with DataForLab07.csv
Data07 <- read.csv("DataForLab07.csv")
Aver(Data07$x)

##Part 4c
sumSquare <- function(x) {
  y <- (x- Aver(x))^2 #calculate squared deviations from the mean 
  Sum <- sum (y) #Sum them
  return (Sum)
}

#test with DataForLab07.csv
sumSquare(Data07$x)