# Romina Carnero - Test 2

install.packages("nutshell")
install.packages("stringr")

library(nutshell)
library(stringr)
library(tidyverse)
library(dplyr)
library(reshape2)
library(readxl)
library(data.table)


# SECTION 1 ---------------------------------------------------------------

# Question 1

load("fish_data.Rdata")
f
head(f)


# Question 2

list.files(pattern=".txt")
date <- scan(file = 'ISIIS201405291242.txt', what = "character",skip = 1, nlines = 1, quiet = TRUE)
date

date=date[2]

date

## month (mm)

mm <- str_sub(date, start=1, end=2)

mm

## day (dd)

dd <- str_sub(date, start=4, end=5)

dd

## year (yy)

yy <- str_sub(date, start=7, end=8)

yy

unique(mm)
unique(dd)
unique(yy)

# Question 3

new.date <- str_c(yy,mm,dd,sep="/")

new.date

# Question 4 and 5

o <- read.table(file='ISIIS201405291242.txt', sep = "\t", skip=10, header=TRUE, fileEncoding = "ISO-8859-1",
                stringsAsFactors = FALSE, quote = "\"", check.names = FALSE, encoding="UTF-8", na.strings="9999.99")

head(o)

# Date

o$date <- date

head(o)

# Hour / Minutes / Seconds

o$Time

o$hour <- as.numeric(str_sub(o$Time,1,2))

head(o)

o$Time

o$min <- as.numeric(str_sub(o$Time,4,5))

head(o)

o$Time

o$sec <- as.numeric(str_sub(o$Time,-5,-1))

head(o)

# Creating a new column for DateTime and setting to the tz in the EST

o$DateTime <- str_c(o$date, o$Time, sep=" ")

head(o)

# converting to POSIXct

o$DateTime <- as.POSIXct(strptime(x=o$DateTime, format = "%m/%d/%y %H:%M:%S", tz="East Coast"))

head(o)

# Verifying it is now a POSYXct data type

str(head(o))

str(head(o$DateTime))


# SECTION 2 ---------------------------------------------------------------

# Question 6

# R.data file

R <- load("aurelia_15minCell_statareas.Rdata")

head(R)

# Question 7

# Excel file

e <- read_xlsx(path="Aurelia_SEAMAP_2012-2018_30minCell.xlsx", sheet =1, col_names = T)

e

# Question 8

## 8.a. fread

list.files(pattern=".txt")

d1 <- fread(input= "aurelia_15minCell_statareas.txt", sep =",", header = T, stringsAsFactors = F )

head(d1)

## 8.b. read.csv

d2 <- read.csv(file = "aurelia_15minCell_statareas.txt", header = T, sep=",", stringsAsFactors = F)

head(d2)

## 8.c. read.table

d3 <- read.table(file= "aurelia_15minCell_statareas.txt", sep =",", stringsAsFactors = F)

head(d3)

## 8.d. read.csv

d4 <- read_csv(file="aurelia_15minCell_statareas.txt")

head(d4)

# Question 9

head(d1)
Aurelia.2012 <- d1[d1$year == "2012",]

head(Aurelia.2012)


# SECTION 3 ---------------------------------------------------------------


depth.s <- subset(x=f, f$depth_fac == "Shallow")

head(depth.s)


depth.m <- subset(x=f, f$depth_fac == "Mid")

head(depth.m)

depth.d <- subset(x=f, f$depth_fac == "Deep")

head(depth.d)

depth <- cbind(depth.s,depth.m,depth.d)

# Question 11

Transect <- rownames(pdm.df)

Transect

mj <- right_join(x=depth.s,y=depth.m, by=c("transect.id"))

mj$Row.names = NULL  

#Question 12

jointdataframe <- merge(Transect, c(depth.s,depth.m), by = "row.names")

jointdataframe$Row.names = NULL



# SECTION 4 ---------------------------------------------------------------

load(batting.2008)

hr <- tapply(X = d$HR, INDEX = list(d$teamID), FUN=sum)

hr

team.stats.sum <- aggregate(x=d[,c("AB","H","BB","2B","HR")], by=list(d$teamID), FUN=sum)

team.stats.sum

team.sum <- d %>% group_by(teamID, lgID) %>% summarise(ABsum = sum(AB), ABmean = mean(AB), ABsd = sd(AB), ABcount = n())

head(team.sum)


# BONUS -------------------------------------------------------------------
#Using fish data. In order to use dcast I used melt first

fs.melt <-melt(data = fs, id.vars = c("transect.id", "parcel.id", "area_fac", "depth_fac"), 
               measure.vars = c("parcel.length.m"), value.name = c("numbers"))

head(fs.melt)


unique(fs.melt$variable)

fs.melt$variable <- as.character(fs.melt$variable)

head(fs.melt)

fs.dcast <- dcast(data = fs.melt, formula = transect.id~variable, value.var = c("numbers"), 
                  fun.aggregate = mean)

head(fs.dcast)














