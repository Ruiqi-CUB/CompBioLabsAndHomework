#Part 1
#lab step #3: Make two variables, one that stores the number of bags of chips, and one that stores the number of guests
Nchips <- 5
Nguests <- 8

#Lab step #5: make a variable storing average consumption of each guest
AverageEat <- 0.4

#Lab step #7: Calculate leftovers:
Nchips - (Nguests + 1) * 0.4

#Part II
#Lab step #8: make five vestors to store rankings
Self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3 ,1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1) 
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)

#Lab step #9: Make two variables to store Penny’s ranking for Episode IV and Lenny’s rank of Episode IV.
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#Lab step #10: Concatenate all 5 sets of rankings into a single data object.
Rankdata <- cbind(Self, Penny, Jenny, Lenny, Stewie)
str(PennyIV)
str(Penny)
str(Rankdata)
#PennyIV has one number, Penny has seven numbers, Rankdata has seven rows and five columns.

#Lab step #12: Make a “data frame” using the 5 vectors of rankings. 
Rankdataframe <- as.data.frame(Rankdata)
Rankdataframe2 <- data.frame(Self, Penny, Jenny, Lenny, Stewie)

##Lab step #13:
dim(Rankdataframe)
dim(Rankdata)
# Both of them have 5 columns and 7 rows.
str(Rankdataframe)
#  The dataframe includes 5 variables, each of which has 7 obervations and all of them are numbers. 
str(Rankdata) 
#The matrix is a two-way generalization of a vector. 
typeof(Rankdataframe)
#Data frame is collection (list) of items. 
typeof(Rankdata) 
# The matrix is basically some numbers. 
Rankdata == Rankdataframe # The numbers from matrix and dataframe are equal to each other.

##Lab step #14: Make a vector of the Episode names as Roman numerals
Names <- c("I", "II", "III", "IV", "V", "VI", "VII")

#Lab step #15: Add column names
row.names(Rankdata) <- Names
row.names(Rankdataframe) <- Names

#Lab step #16: Access the third row of the matrix produced from step #10
Rankdata[3,]

#Lab step #17: Access the fourth column from a data frame produced from step #12
Rankdataframe[,4]

#Lab step #18: Access your ranking for Episode V.
Rankdataframe["V",]

#Lab step #19: Access Penny’s ranking for Episode II.
Rankdataframe["II","Penny"]

#Lab step #20: Access everyone’s rankings for episodes IV – VI.
Rankdataframe[c("IV","V","VI"),]
Rankdataframe[4:6,]
#Lab step #21: Access everyone’s rankings for episodes II, V, and VII.
Rankdataframe[c("II","V","VII"),]
  
#Lab step #22: Access rankings for just Penny, Jenny, and Stewie for just episodes IV and VI.
Rankdataframe[4:6,c("Penny","Jenny","Stewie")]

#Lab step #23: Switch Lenny’s rankings for Episodes II and V. 
a <- Rankdataframe [2, 4]
Rankdataframe [2, 4] <- Rankdataframe [5, 4]
Rankdataframe [5, 4] <- a

#Lab step #24: Show myself it works
Rankdata["III", "Penny"]
Rankdata[3,2]
Rankdataframe["III", "Penny"]
Rankdataframe[3,2]

#Lab step #25:
a <- Rankdataframe ["V", "Lenny"]
Rankdataframe ["V", "Lenny"] <- Rankdataframe ["II", "Lenny"]
Rankdataframe ["II", "Lenny"] <- a

#Lab step #26:
a <- Rankdataframe$Lenny[2]
Rankdataframe$Lenny[2] <- Rankdataframe$Lenny[5]
Rankdataframe$Lenny[5] <- a
