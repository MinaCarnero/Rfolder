
# TASK 4 ------------------------------------------------------------------
a <- (5:14)
a


# TASK 5 ------------------------------------------------------------------

a[1]
a[7]

a[1]
a[7]
b <- c(a[1],a[7])
b


# TASK 6 ------------------------------------------------------------------
a<b

b>a

a>=b

# TASK 7 ------------------------------------------------------------------

x <- a[1]
x
y <- a[6]
y
z <- a[9]
z

((z+x)*(z+y))/2

10*(x-y)

# TASK 8 ------------------------------------------------------------------

# The R operator for 'not' is '!'

# TASK 9

a%%b
# %% is an operator called Mod or Modulus and it calculates the following 
# equation x%%y = x - ( floor(x/y)* y), considering that the function floor 
# will round to the nearest integer that’s smaller than x. In this case x is "a"
# ans y is "b".

a^b
# ^ is an operator where the first number (in this case "a") is raised to the power of the
# second number (in this case "b")

a%/%b
# %/% is an operator where the first value ("a") is divided by the second one ("b") but 
# rounded down.


# TASK 10 -----------------------------------------------------------------

"%ULL%"=function(a,b){2*(a+b)^2}

2 %ULL% 3

# TASK 11 -----------------------------------------------------------------

(3*2)+5->K
K


# TASK 12 -----------------------------------------------------------------

x=4;y=8;z=2
print(x)
print(y)
print(z)


# TASK 13 -----------------------------------------------------------------

10/0
# This is an example of Inf. Inf means positive infinity, and is showed when 
# a positive value can't be handled by R because is extremely long 

-10/0
# This is an example of -Inf. -Inf means negative infinity, and is showed when 
# a negative value can't be handled by R because is extremely long


0/0
# 0/0 will result in NaN. It means "Not a Number" and is a vector of class numeric.
# It is showed when the result is an imaginary or complex number 

k=NULL
# k will result in NULL because the object is empty


# TASK 14 -----------------------------------------------------------------
switchero.if.then=function(O){
  if(O=="hw") 
    "humpback whale"  
  else if (O == "sw") 
    "sperm whale"
  else if (O == "be")
    'beluga'
  else 
    'hummingbird'
}
switchero.if.then("hw")
switchero.if.then("sw")
switchero.if.then("be")
switchero.if.then("u")

# TASK 15 -----------------------------------------------------------------

#character
w <- "dog"
w
class(w)

#integer
r <- c(5L,4L,6L)
r
class(r)

#numeric
t <- 5.3
t
class(t)

#factor
f <- factor(c("heterozygote","homozygote"))
class(f)
# TASK 16 -----------------------------------------------------------------


# TASK 17 -----------------------------------------------------------------


# TASK 18 -----------------------------------------------------------------


# TASK 19 -----------------------------------------------------------------


# TASK 20 -----------------------------------------------------------------


# TASK 21 -----------------------------------------------------------------

load("test1_data.Rdata")
test1_data
nrow(test1)


ncol(test1)

typeof(test1$transect)


print(test1)

str(test1)
as.character(test1$tow)

class("tow")

test1$sw.density=NULL

sw.density





#Ok que rarissimo 

#prueba porfavor

head("tow")





