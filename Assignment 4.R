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

# Question 6

jointdataframe <- merge(pdm.df, pd.sd.df, by = "")

jointdataframe  
    
# Question 7
  
  
# Question 8
  

# Summarize and join ------------------------------------------------------

# Question 9
  
  

# Question 10
  
  
# Question 11


# Question 12


# Question 13



# Question 14


# Question 15


# Question 16



# Free style --------------------------------------------------------------

# Question 17






