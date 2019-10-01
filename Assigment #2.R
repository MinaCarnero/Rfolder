
# TASK 2.1 ----------------------------------------------------------------
a <- 3+4
a

# TASK 2.2 ----------------------------------------------------------------
(5*2)+5->b
b

# TASK 2.3 ----------------------------------------------------------------

#character
c <- "whale"
c
class(c)

#integer
d <- 2L
d
class(d)

#numeric
e <- 3.4
e
class(e)

#factor
f <- factor(c("heterozygote","homozygote"))
class(f)

# TASK 2.4 ----------------------------------------------------------------

d%%e
# %% is an operator called Mod or Modulus and it calculates the following 
# equation x%%y = x - ( floor(x/y)* y), considering that the function floor 
# will round to the nearest integer that’s smaller than x. In this case x is "d"
# ans y is "e".

d^e
# ^ is an operator where the first number (in this case "d") is raised to the power of the
# second number (in this case "e")

d%/%e
# %/% is an operator where the first value ("d") is divided by the second one ("e") but 
# rounded down.

# TASK 2.5 ----------------------------------------------------------------

g <- (1:10)
g

# TASK 2.6 ----------------------------------------------------------------
x=2;y=4;z=7
print(x)
print(y)
print(z)

# TASK 2.8 ----------------------------------------------------------------
x*y+z

# TASK 2.9 ----------------------------------------------------------------
x*(y+z)

# TASK 2.10 ---------------------------------------------------------------

# In Task 2.8 the result is 15 and in Task 2.9 is 22. The difference is because
# in the first one you are using the operator * and + without any parenthesis, 
# which makes the multiplication be solved first and then the addition. In task 2.9
# the operation of addition that is inside the parenthesis (y+z) is solved first,
# which gives a higher number to be multiplied by x, which is the remaining element.

# TASK 2.11 ---------------------------------------------------------------

10/0
# This is an example of Inf. Inf means positive infinity, and is showed when 
# a positive value can't be handled by R because is extremely long 

-10/0
# This is an example of -Inf. -Inf means negative infinity, and is showed when 
# a negative value can't be handled by R because is extremely long


0/0
# 0/0 will result in NaN. It means Not a Number and is a vector of class numeric.
# It is showed when the result is an imaginary or complex number 

k=NULL
# k will result in NULL because the object is empty

v <- c(1:3)
v[4]
# v[4] will result in NA. It means Not Availble and it is a vector of class logical.
# Na is showed in this case because the fourth value in this vector doen't exist.

# TASK 2.12 ---------------------------------------------------------------

"%ocean%"=function(a,b){5*a+b^2}

4 %ocean% 2

# TASK 2.13 ---------------------------------------------------------------

# Example of an integer division
5%/%2

# Example of a modulus
5%%2

# Example of an exponent
5^2


# TASK 2.14 ---------------------------------------------------------------

switchero.if.then=function(H){
  if(H=="hw") 
    "humpback whale"  
  else if (H == "sw") 
    "sperm whale"
  else if (H == "zi")
    'ziphius'
  else 
    'hummingbird'
}
switchero.if.then("hw")
switchero.if.then("sw")
switchero.if.then("zi")
switchero.if.then("p")


# TASK 3 ------------------------------------------------------------------

# The “fish_data.Rdata” file was uploaded and initialized with commit the 
#to your GitHub repository via RStudio


# TASK 4 ------------------------------------------------------------------

# Loading the data frame “fish_data.Rdata” into RStudio console: 

load("C:/MINA/UL/Fall 2019/R Lab/Romina/fish_data.Rdata")
remove(fishes)
fish

# Finding the number of rows in the data set:

nrow(fish)

# Find the number of columns in the data set: 

ncol(fish)

# Reveals the data type of only the ‘year’ column:

typeof(fish$year)

# Print the structure of the data frame. Insert a comment that describes 
# the five different data types are present:

print(fish)

str(fish)

 ## transect.id is a "character" data type
 ## group is a "factor" data type
 ## parcel.id is a "numeric" data type
 ## parcel.start.time is a "date/time" data type with a POSIXct format
 ## parcel.end.time is a "date/time" data type with a POSIXct format
 ## parcel.start.lat is a "numeric" data type
 ## parcel.start.lon is a "numeric" data type
 ## parcel.end.lat is a "numeric" data type
 ## parcel.end.lon is a "numeric" data type
 ## avg.DNE.m is a "numeric" data type
 ## parcel.density.m3 is a "numeric" data type
 ## parcel.length.m is a "numeric" data type
 ## parcel.type is a "character" data type 
 ## year is a "character" data type 
 ## region is a "character" data type
 ## tow.depth is a "character" data type
 ## nice_label is a "character" data type
 ## zoo_type is a "character" data type
 ## rank is an "integer" data type       
 ## area_fac is a "factor" data type with 3 levels 
 ## type_fac is a "factor" data type with 4 levels
 ## yr_fac is a "factor" data type with 2 levels
 ## depth_fac is a "factor" data type with 3 levels


# Change the ‘area_fac’ from a factor to a character data type:

as.character(fish$area_fac)

class("area_fac")

# Removing the “avg.DNE.m” column from the data frame. 

fish$avg.DNE.m=NULL

# In order to confirm there is no "avg.DNE.m" object anymore, I call that object and
# also check the number of columns of the data ser, now there are 22 instead of 23 col.

avg.DNE.m
ncol(fish)
