###########################################
############   Basics in R ################
###########################################


# R objects - Vectors------------------------------------------------------
c(2,5,3,6,4)  ### creates a vector

seq(1,100,1)  ### creates a vector 1 to 100 stepping by 1
# or
seq(1, 100, length = 6)  ### creates a vector 1 to 100 using 6 steps

rep(5, 4)     ### creates a vector of 5s repeated 4 times

rep(c(1, 2), times = 4)     ### repeats a vector
rep(c(1, 2), each = 4)     ### repeats the items in a vector



## operators  +,/,* etc....

8 + 8
8 * 8
8 / 8
8 ^ 8
8 %% 8 #remainder (after dividing the second term into the first)
8 %% 3

log(8)
exp(8)



########################################################################
## assignment, creating objects
## critical to using R
x <- c(2,5,3,6,4)
x
########################################################################


ls()           #### lists all objects
rm(x)           #### removes x object
ls()
rm(list=ls())  #### removes all objects in your environment
ls()           #### lists all objects

### combining vectors, matrices, lists, data frames

x <- c(2, 5, 3, 6, 4)  ### creates a vector object with 5 elements named x 
y <- c(1, 5, 3, 8, 11)  ### creates a vector object with 5 elements named y
x
y
xy <- cbind(x,y)  ### cbind combines 2 or more vectors
xy
xy1 <- matrix(seq(1,100,1), 10,10)  ### matrix creates a matrix 10 by 10
xy1

t(xy1)  # transposes the matrix

#### lists

ab <- list(x, y)
ab ### instead of being combined they are seperate vectors in the same object

### dataframes - the most common form, integers, characters, factors, etc... ~ spreadsheet

xy <- data.frame(Arctia = x, Grammia = y)  ### creates a data frame object named xy from the x and y vectros assigning column names "Arctia" and "Grammia"
xy

# alternatively, we can take the list ab from above and make it a data frame (or a matrix)
new.ab <- as.data.frame(ab)
new.ab

#to make it look like the xy data frame, we have to give the columns names:
names(new.ab) <- c("Arctia", "Grammia")
new.ab

# We can also give the original list, ab, names, although this does not make it a data.frame

names(ab) <- c("Arctia", "Grammia")
ab
as.data.frame(ab)  # ab now acts like a data.frame.


########## Working with objects #########

ls()
fix(xy)  ### manually fix data set
# or
edit(xy) ### manually fix data set

# generally not recommended to "fix" data--cf. data management, fix in one place and modify using scripts

head(xy, n = 2)  #### check first few records
tail(xy, n = 2)  #### check last records

# Structure of data set
str(xy)	### describes the object and the types of information in it
str(ab)

######### summarizing, sorting, and subsetting ##########
## summarizing
mean(x)
sd(x)
var(x)
max(x)
min(x)
colMeans(xy)
rowSums(xy)
summary(xy)

sort(x, decreasing = FALSE)  ### sorts a vector in ascending order
order(-x) ## gives the POSITION of the element in order (descending, since "-x")
x[order(-x)]

# subsetting using indexes

####
# [row, column]
###

x[3]  #### takes 3 element in vector x
xy
xy[3,2] ###  takes element in 3 row in column 2
xy[3,]  ###  takes the 3rd row
xy[,2]  ### takes the second column

# subsetting by names
xy$Grammia  ### selects the Grammia Column
xy[,'Grammia'] ### selects the Grammia Column


# subsetting by evaluation criteria
# an evaluator returns TRUE or FALSE
# e.g. > < >= =< ==
x
x > 3
x==6

x[x > 3]  ### selects values > 3 from the x vector
xy[x > 3]  ### selects values > 3 from the xy data frame - DOESN'T WORK for data frames
xy[x > 3,]  ### selects values > 3 from the xy data frame - THIS WORKS - need to specify (all) columns

# 'which' returns the INDEX of the rows that match the evaluation
# important: not the value, but its row number (or other index)
x[x > 3]
which(x>3)
which(xy$Grammia>3)

########## Replacing values ############

# sometimes checking will reveal data that is incorrect
# you can change it in the original source (text) file
# OR, for better documentation, you can include it in the script:

# let's say xy$Grammia should never be bigger than 10
xy[xy$Grammia>10,]	# oops, there is a row with a value that is too big

# you can assign a value just like creating an object, with '<-'
sel <- which(xy$Grammia>10)
sel	# gives index of selected row
xy[sel,]	# shows row that must be changed
xy[sel,'Grammia'] # shows value that must be changed
xy[sel,'Grammia'] <- 10

# OR
xy[5,2] <- 10	# change 2nd column of row 5 to value of 10

# OR, even better:
xy[xy$Grammia>10,'Grammia'] <- 10	# make Grammia==10 wherever it is greater than 10 (i.e. where rows evaluate first half of the brackets as TRUE, select the second column and change it to ==10.)


#######  Deleting values   #########
z <- x[-2]  ### removes second element in vector
z

z1 <- xy[-4,]  ### removes the 4th row from xy
xy
z1


#####  More on data frames  ####

is.data.frame(xy)   #### checks to see if xy is a data frame
xy[order(xy$Grammia),]  #### orders the xy data frame by Grammia

zz <- subset(xy, xy$Grammia == 3)  ### a single '=' is used for ASSIGNMENT, a double '==' is used for EVALUATION
zz
zz = subset(xy, xy$Grammia == 3) 	### the first '=' is the same as '<-'
zz

Pyrrharctia <- c(1,3,5,2,6)  ### create a vector named Pyrrharctia with 5 elements

zz1 <- cbind(xy, Pyrrharctia)  #### cbind combines columns from Pyrrharctia to xy data frame
zz1

zz2 <- data.frame(Arctia = x, Pyrrharctia = Pyrrharctia, Grammia = y)  ### create a 3 column dataframe with Arctia, Pyrrharctia, and Grammia *in that order*
zz2

dd <- data.frame(Arctia = x,Grammia = y)  #### creates a new 2 column datafrmae whose rows we are going to append to xy
dd
cc <- rbind(xy, dd)  ### rbind appends rows
cc

cc <- cbind(cc, sum=apply(cc, 1, sum))  #### adds a colum to the cc data frame that sums the other column values
cc

###########################################
#### Importing and Saving Data  	#######
###########################################

data(iris)
getwd()	# remind yourself where you are working in your file structure
write.csv(iris, file = "iris_test.csv")  #### saves the iris data set as iris_test in your working directory
iris2 <- read.csv("iris_test.csv", header=TRUE, row.names=1)  #### reads the iris_test.csv file form the temp directory
