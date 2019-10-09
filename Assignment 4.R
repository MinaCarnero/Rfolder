#Assignment #4

#Romina Carnero Huaman


# tapply & merge  ---------------------------------------------------------

load("fish_data.Rdata")
f <- fish 
f

# Question 1

pdm <- tapply(X = f$parcel.density.m3, INDEX = f$transect.id, FUN = mean)

pdm

head(pdm)

# Question 2

pdm.df <- as.data.frame(pdm)

pdm.df

head(pdm.df)

# Question 3

colnames(pdm.df) <- "Density mean (m3)"

pdm.df

head(pdm.df)

# Question 4

Transect <- rownames(pdm.df)

Transect

# Question 5

pd.sd <- tapply(X = f$parcel.density.m3, INDEX = f$transect.id, FUN = sd)
pd.sd

pd.sd.df <- as.data.frame(pd.sd)
pd.sd.df


colnames(pd.sd.df) <- "Standard Deviation"
pd.sd.df
head(pd.sd.df)

# Question 6

jointdataframe <- merge(Transect, c(pdm.df, pd.sd.df), by = "row.names")

jointdataframe$Row.names = NULL  
    
colnames(jointdataframe) <-c("Transect", "Density.mean..m3.", "Stand.Deviation")

jointdataframe

head(jointdataframe)

# Question 7
  
pdco <- tapply(X = f$parcel.density.m3, INDEX = f$transect.id, FUN = length)
(pdco)

pdco = as.data.frame(pdco)
str(pdco)

colnames(pdco) <- "Count of observation"
pdco
head(pdco)
  
# Question 8
  
jointdataframe2 <- merge(Transect, c(pdm.df, pd.sd.df,pdco), by = "row.names")

jointdataframe2$Row.names = NULL

colnames(jointdataframe2) <-c("Transect", "Density.mean..m3.", "Stand.Deviation","Count.of.observation")

jointdataframe2

head(jointdataframe2)

# Summarize and join ------------------------------------------------------

# Question 9

library(tidyverse)

means = f %>% group_by(transect.id) %>% summarise(mean_transect = mean(parcel.density.m3))
View(means)

# Question 10
  
means.df <- as.data.frame(means)
means.df
head(means.df)

# Question 11

colnames(means.df) <- c("Transect","Parcel density means")

means.df

head(means.df)

# Question 12

Transect <- rownames(means.df)

Transect

# Question 13

std.dev=f %>% group_by(transect.id) %>% summarise(sd_transect = sd(parcel.density.m3))
View(std.dev)

std.dev.df <- as.data.frame(std.dev)
std.dev.df
head(std.dev.df)


std.dev.df
head(std.dev.df)

Transect <- rownames(std.dev.df)
Transect

colnames(std.dev.df) <- c("Transect","Standard Deviation")
std.dev.df
head(std.dev.df)


# Question 14

library(tidyverse)

jointdataframe3<- merge(Transect, c(means.df, std.dev.df), by = "row.names")

jointdataframe3$Transect.1 = NULL

jointdataframe3$Row.names = NULL

jointdataframe3  

head(jointdataframe3)

colnames(jointdataframe3) <- c("Transect", "Parcel.density.mean", "Standard.Deviation")

head(jointdataframe3)


# Question 15

count.obs = f %>% group_by(transect.id) %>% summarise(length_transect = length(parcel.length.m))
View(count.obs)

count.obs.df = as.data.frame(count.obs)
str(count.obs.df)

colnames(count.obs.df) <- c("Transect", "Count of observations")
count.obs.df
head(count.obs.df)

# Question 16

jointdataframe4<- merge(Transect, c(means.df, std.dev.df, count.obs.df), by = "row.names")

jointdataframe4$Transect.1 = NULL
jointdataframe4$Transect.2 = NULL
jointdataframe4$Row.names = NULL
jointdataframe4$x = NULL

jointdataframe4  

head(jointdataframe4)

colnames(jointdataframe4) <- c("Transect", "Parcel.density.mean", "Standard.Deviation","Count.of.observations")

head(jointdataframe4)

# Free style --------------------------------------------------------------

# Question 17

tapply(f$parcel.length.m, f$year, summary)

tapply(f$parcel.length.m, f$depth_fac, summary)






