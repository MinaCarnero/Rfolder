getwd()
load("fish_data.Rdata")
fish

f <- fish
f
#Class 09/30/19 





load("fish_data.Rdata")

f <- fish

head(f)



#Subsetting

fdeep <- f[f$depth_fac == "Deep",]

fdeep2 <- subset(x=f, f$depth_fac == "Deep")

library(dplyr)

fdeep3 <- filter(.data = f, depth_fac == "Deep")

fd4 <- subset(x=f, f$depth_fac == "Deep", select = c("transect.id","area_fac"))

head(fd4)

fd5 <- f[which(f$depth_fac == "Deep" & f$area_fac =="East" & f$yr_fac !="2014"),]

head(fd5)



fshallow <- f[f$depth_fac == "Shallow",]

f2shallow <- subset(x=f, depth_fac == "Shallow")

feast <- subset(x=f, depth_fac == "East")

f2east <- f[f$depth_fac == "East",]

fpatches <- f[f$depth_fac == "Patches",]

f2patches <- subset(x=f, depth_fac == "Patches")





#subset & then combine using rowbind (rbind function)

d1 <- f[which(f$depth_fac == "Deep" & f$area_fac =="East"),]

d2 <- f[which(f$depth_fac == "Shallow" & f$area_fac =="West"),]

#combine d1 and d2 into a single data frame 

nrow(d1)

nrow(d2)



d3 <- rbind(d1,d2)



#combine data frames with separate columns into a single data frame. 

c1 <- subset(x=f, f$depth_fac == "Deep", select = c("transect.id","area_fac"))

c2 <- subset(x=f, f$depth_fac == "Deep", select = c("depth_fac","parcel.length.m","group"))



c3 <- cbind(c1, c2)

head(c3)





#only use column combine funtion if you know the #rows match up exactly, or else things will be missaligned, chaotic, and confused. 

#They got to line up!





#merging two data frames, ensuring that observationsfrom one data frame are aligned correctly with observations in second data frame. 



m1 <- subset(x=f, f$depth_fac == "Deep", select = c("transect.id","area_fac"))

m2 <- subset(x=f, f$depth_fac == "Deep", select = c("transect.id", "depth_fac","parcel.length.m","group"))

#We are adding a sequence so that later R will know how many rows each column has. 

#seq(dstart value, what is this sequence assigned to, by what value are subsequent values separated (intervals of 1, 0.5 etc.))

m1$seq <- seq(1, nrow(m1),1)

m2$seq <- seq(1,nrow(m2),1)



## merge so that values of longer data frame that don't correspond to those in shorter frame are converted to NA. 

#Meaning new data frame is as short as shortest data frame

mt <- merge(x=m1, y =m2, by=c("transect.id","seq"), all.x=T, no.dups=T)

nrow(mt)



mj <- right_join(x=m1,y=m2, by=c("transect.id","seq"))

nrow(mj)



#right join aligns x to y, and left join does vice versa. 



#what does cut function do? Check out below

v <-seq(5,20,0.5)

vc <- cut(x=v, breaks =seq(5,20,1), include.lowest = T)

v

vc
#done for 09/30/19

























