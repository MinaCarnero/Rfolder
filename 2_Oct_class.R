
#Summariziong data
# 2 Oct 2019

library(tidyverse)
install.packages("nutshell")
library(nutshell)

#data will be using today

data("batting.2008")
d <- batting.2008 


#tapply ---  (tidyverse function)

## Find sum of all home runs
hr <- tapply(X=d$HR, INDEX=list(d$teamID), FUN=sum)
hr

##Find quantile values for home runs by team
hr.q <- tapply(X=d$HR, INDEX=list(d$teamID), FUN=fivenum)
hr.q


## Fivesnum gives you: min., lower-hinge, median, upper-hinge, and max value

# one category summarize
lg.q <- tapply(X=d$H/d$AB, INDEX=list(d$lgID), FUN=fivenum)
lg.q

# two category summarize
bats <- tapply(X=d$HR, INDEX = list(d$lgID, d$bats), FUN=mean)
bats
unique(d$bats)
names(d)

# three category summarize
bats.team <- tapply(X=d$HR, INDEX = list(d$lgID, d$teamID, d$bats), FUN=mean)
bats.team

#aggregate
team.stats.sum <- aggregate(x=d[,c("AB","H","BB","2B","HR")], by=list(d$teamID), FUN=sum)
team.stats.sum

team.stats.mean <- aggregate(x=d[,c("AB","H","BB","2B","HR")], by=list(d$teamID), FUN=mean)
team.stats.mean

#tidyverse summarise()----

team.sum = d %>% group_by(teamID) %>% summarise(ABsum=sum(AB), ABmean=mean(AB), ABsd=sd(AB), ABcount=n())
team.sum


lg.team.sum = d %>% group_by(lgID, teamID) %>% summarise(ABsum=sum(AB), ABmean=mean(AB), ABsd=sd(AB), ABcount=n())
lg.team.sum

# rowsum ----
#when you just want to add up the values in each row

rs <- rowsum(d[,c("AB","H","HR","2B","3B")], group = d$teamID)
rs

#counting variables ---
#use the function "tabulate"

HR.cnts <- tabulate(d$HR)
HR.cnts
names(HR.cnts) <- 0:(length(HR.cnts)-1)
HR.cnts

#aside the 'names' function
m <- matrix(nrow = 4, ncol=3)
m

colnames(m) <- c("one","two","three")

rownames(m) <- c("apple","pear","orange","berry")

#table---
table(d$bats)
table(d[,c("bats","throws")])

#reshaping your data

n <- matrix(1:10, nrow=5)
n

t(n)


#si lo haces en un vector, nada cambia en verdad, solo se vuelve una lista
v <- 1:10
v
t(v)

#unstack and stack

s <- d[,c("lgID","teamID","HR","AB","HR","throws")]
s
head(s)

s.un <- unstack(x=s, form=teamID ~ HR)
s.un <- unstack(x=s, HR ~ AB)

#melt &cast

library(reshape2)

#right now our data is in a long format and we want to put it in a wide format
#for that we want to use "cast"


s.wide <- dcast(data=s, value.var="HR", formula="lgID"~"teamID", fun.aggregate = mean)
s.wide

















