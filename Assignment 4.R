load("fish_data.Rdata")
f <- fish; rm(fish)

fs <- f[,c("transect.id","area_fac","depth_fac","parcel.id","parcel.density.m3","parcel.length.m")]

#how to rename a field (or column)

library(tidyverse)
fs <- rename(.data = fs, tid = transect.id)
fs <- rename(.data = fs, area = area_fac)
fs <- rename(.data = fs, depth = depth_fac)
fs <- rename(.data = fs, pid = parcel.id)
fs <- rename(.data = fs, pl = parcel.length.m)
fs <- rename(.data = fs, pd = parecel.density.m3)

# another way to rename columns

names(fs)[1] = c("transect")
names(fs)[1:3] = c("transect","a","z")


#Reshaping your data

library(reshape2)

#using the function 'melt' (reshape2) to change your data frame from wide to a long format

fs.melt <- melt(data=fs
                
                
                
                
fs.gather = fs %>% group_by(tid, area, depth, pid) %>% gather(key='variable','value',pd,pl)              
                
                
                
                
                
                








