#Assignment #4

#Romina Carnero Huaman


# tapply & merge  ---------------------------------------------------------

load("fish_data.Rdata")
f <- fish 
f

# Question 1

pdm <- tapply(X = f$parcel.density.m3, INDEX = f$transect.id, FUN = mean)

pdm


# Question 2

pdm.df <- as.data.frame(pdm)

pdm.df

head(pdm.df)

# Question 3

colnames(pdm.df) <- "Density mean (m3)"

pdm.df

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

jointdataframe  

colnames(jointdataframe) <-c("Row.names","Transect", "Density.mean..m3.", "Stand.Deviation")

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
jointdataframe2
head(jointdataframe2)

colnames(jointdataframe2) <-c("Row.names","Transect", "Density.mean..m3.", "Stand.Deviation","Count.of.observation")
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



# Question 14


# Question 15


# Question 16



# Free style --------------------------------------------------------------

# Question 17






