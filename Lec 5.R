load("C:/MINA/UL/Fall 2019/R Lab/Romina/fish_data.Rdata")
fish

# MISSINF COMANDOS.. ASK !



fish_lg_patch <- fish[fish$parcel.lenght.m>=20]
summary(fish$parcel.length.m)
summary(fish_lg_patch$parcel.length.m)
v<-c(1,1,2,0,3,2,0,1)
v
2 %in% v
1 < 2
2 > 5
1 > c(0,1,2)
c(1,2,3)==c(0,1,2)
c(1,2,3)==c(3,2,1)
c(1,2,3) %in% c(3,2,1)
v
v[4]<-5
v
v[c(1,3,5)]<-c(1,1,1)
v
v[c(1,3,5)]
v
v[c(1,3,5)]<-c(7,9,13)
v
# garbage collection is gc(). Use it empty, nothing in the braquets. Is like the remove function
# it's about cleaning my data

# MISSING DATA

# Two things that you can do to remove your missing data, it means ignore the NAs

n<-(c(NA, 1:50))
n

mean(n)
mean(n, na.rm=T)
n.a <- n[which(is.na(n),)]
n.a <- n[is.na(n),]


names(fish)
unique(fish$year)
fish.na<-fish[fish$year[6],]<-NA
fish.na
fish$year[6]<-NA
head(fish$year)

# ! EXCLAMATION POINT IS THE WAY TO SAY NO IN R. That means what follows the ! is not included

fish.no.na<-fish[!is.na(fish$year),]
unique(fish.no.na$year)  


# FUNCTIONS ---------------------------------------------------------------


# install package (data.table)
install.packages("data.table")


# 1)

install.packages(c("tidyverse","stringr","plyr","reshape2","grid","gridExtra","pastecs","lubridate"))
  
# 2) write a function to install packages

packs <- c("tidyverse","stringr","plyr","reshape2","grid","gridExtra","pastecs","lubridate")
n=length(packs)
n

# loop through installations

for(i in 1:n){install.packages(pack[n])}

packs[1]
packs[2]
n=length(packs)
n
packs

for(i in 5:5){install.packages(packs[n])}

# install the package 'devtools' to acquire functions that allow you to install 

install.packages("devtools")
library(devtools)
install_github
load("Physical_data")











