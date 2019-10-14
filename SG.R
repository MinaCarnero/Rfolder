install.packages("data.table")
install.packages("tidyverse")
install.packages("nutshell")

# Libraries I'm gonna need ------------------------------------------------

library(tidyverse)
library(dplyr)
library(reshape2)
library(stringr)
library(readxl)
library(data.table)
library(nutshell)

# Downloading files -------------------------------------------------------

## csv / txt

    #Para encontrar un text file

list.files(pattern=".txt")

    # Diferentes maneras de descargar un data set en txt or csv

d <- fread(input= "aurelia_15minCell_statareas.txt", sep =",", header = T, stringsAsFactors = F )

d

d <- read.csv(file = "aurelia_15minCell_statareas.txt", header = T, sep=",", stringsAsFactors = F)

d

d <- read.table(file= "aurelia_15minCell_statareas.txt", sep =",", stringsAsFactors = F)

d

d <- read_csv(file="aurelia_15minCell_statareas.txt")

d

## Excel

e <- read_xlsx(path="Aurelia_SEAMAP_2012-2018_30minCell.xlsx", sheet =1, col_names = T)

e

## R.data: Para descargar un data set that is R.data USAR load("filename"). 

d3 <- load("aurelia_15minCell_statareas.Rdata")

head(d3)


# TIME --------------------------------------------------------------------


# DATE --------------------------------------------------------------------

# THE WHOLE FILE:

o <- read.table(file='ISIIS201405291242.txt', sep = "\t", skip=10, header=TRUE, fileEncoding = "ISO-8859-1", stringsAsFactors = FALSE, quote = "\"", check.names = FALSE, encoding="UTF-8", na.strings="9999.99")

o

head(o)

# FINDING A VERY SPECIFIC ROW AND SECTION OF THAT ROW. IN THIS CASE IS THE DATE:

date <- scan(file = 'ISIIS201405291242.txt', what = "character",skip = 1, nlines = 1, quiet = TRUE)

library(stringr)

date

# Pero esto me va a dar la palabra date con la fecha, pero lo que quiero es solo la fecha, asi que
# usar [] y poner adentro la posicion de la fecha

date=date[2]

date

# Ahora que ya tengo mi string (cadena de caracteres), quiero extraer una parte. En este caso el mes.


mm <- str_sub(date, start=1, end=2)

mm

# Hago lo mismo para el dia

dd <- str_sub(date, start=4, end=5)

dd

# Hago lo mismo para anho

yy <- str_sub(date, start=7, end=8)

yy

# Ahora usare str_c, para combinar los subsets que acabo de extraer

new.date <- str_c(dd,mm,yy,sep="/")

new.date

# Para agregar un dia al date que ya tienes:

# PRIMERO: usar as.numeric porque el tipo de data que tienes es "character"

dd = as.numeric(dd)

dd

typeof(dd)

# SEGUNDO: ahora agregar el numero 1 al dia (dd) y colocar as.character otra vez

next.date <- str_c(as.character(dd+1),mm,yy, sep="/")

next.date


# HOURS/MINUTES/SECONDS ---------------------------------------------------

head(o)

# CREANDO una nueva columna solo para la hora

o$Time

o$hour <- as.numeric(str_sub(o$Time,1,2))

o

head(o)

# CREANDO una nueva columna solo para la fecha

o$date <- date

head(o)

# CREANDO una nueva columna solo para minutos

o$Time

o$min <- as.numeric(str_sub(o$Time,4,5))

head(o)

# CREANDO una nueva columna solo para los segundos

o$Time

o$sec <- as.numeric(str_sub(o$Time,-5,-1))

head(o)

unique()

# POSIXct -------------------------------------------------------------------

# Crear/Agregar una nueva columna solo con el DATE y el TIME, que se llama DateTime en la base de datos

o$DateTime <- str_c(o$date, o$Time, sep=" ")

head(o)

# Usando strptime voy a senhalar como se esta presentando la informacion en esa columna

o$DateTime <- as.POSIXct(strptime(x=o$DateTime, format = "%m/%d/%y %H:%M:%S", tz="America/New_York"))

head(o)

# Para verificar que ahora esa columna esta en data type: POSYXct, usar str

str(head(o))

str(head(o$DateTime))

# Para cambiar el time zone, solo cambio lo que va despues de tz

o$DateTime <- str_c(o$date, o$Time, sep=" ")

o$DateTime <- as.POSIXct(strptime(x=o$DateTime, format = "%m/%d/%y %H:%M:%S", tz="America/Panama"))

head(o)

# SUBSETTING --------------------------------------------------------------

# different ways to subset data frames

## 1 ## example[x,y]       Ejemplo:  ed_exp1 <- education[c(10:21),c(2,6:7)]. 

fdeep <- f[f$depth_fac == "Deep",]

head(fdeep)

## 2 ## Es parecida a la primera pero esta vez en lugar de colocar las filas y columnas que se quieren extraer,

        # colocar las que no se quiere extraery omitirlas agregando un signo negativo (-)

        # Ejemplo:  ed_exp2 <- education[-c(1:9,22:50),-c(1,3:5)]


## 3 ## Subset Function

fdeep2 <- subset(x=f, f$depth_fac == "Deep")

head(fdeep2)

## 4 ## Which function. Te da mas poder para especificar la busqueda y extraer mas datos (columnas/filas)

fd5 <- f[which(f$depth_fac == "Deep" & f$area_fac =="East" & f$yr_fac !="2014"),]

head(fd5)


#subsetting and then combine using rowbind (rbind function)


d1 <- f[which(f$depth_fac == "Deep" & f$area_fac =="East"),]

d2 <- f[which(f$depth_fac == "Shallow" & f$area_fac =="West"),]

#combine d1 and d2 into a single data frame 

nrow(d1)

nrow(d2)



d3 <- rbind(d1,d2)

#combine data frames with separate columns into a single data frame. 

c1 <- subset(x=f, f$depth_fac == "Deep", select = c("transect.id","area_fac"))

c2 <- subset(x=f, f$depth_fac == "Deep", select = c("depth_fac","parcel.length.m","group"))

nrow(c1)

nrow(c2)

c3 <- cbind(c1, c2)

head(c3)


#only use column combine funtion if you know the #rows match up exactly,
#or else things will be missaligned, chaotic, and confused. 


# OTHER EXAMPLES TO USE SUBSETTING

fshallow <- f[f$depth_fac == "Shallow",]

f2shallow <- subset(x=f, depth_fac == "Shallow")


feast <- subset(x=f, depth_fac == "East")

f2east <- f[f$depth_fac == "East",]


fpatches <- f[f$depth_fac == "Patches",]

f2patches <- subset(x=f, depth_fac == "Patches")


# tapply and summarise --------------------------------------------------

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


# MERGE / JOIN / AGGREGATE ------------------------------------------------

#Three ways to merge dataframes

# MERGE: merge(df1, df2, by= unique identifier)

## ROMI

jointdataframe <- merge(Transect, c(pdm.df, pd.sd.df), by = "row.names")

jointdataframe$Row.names = NULL  

colnames(jointdataframe) <-c("Transect", "Density.mean..m3.", "Stand.Deviation")

jointdataframe

head(jointdataframe)


## MAC

m1 <- subset(x=f, f$depth_fac == "Deep", select = c("transect.id","area_fac"))

m2 <- subset(x=f, f$depth_fac == "Deep", select = c("transect.id", "depth_fac","parcel.length.m","group"))

#We are adding a sequence so that later R will know how many rows each column has. 

# seq(dstart value, what is this sequence assigned to, by what value are subsequent values separated 
# (intervals of 1, 0.5 etc.))

m1$seq <- seq(1, nrow(m1),1) # seq(x,y,z) x= la secuencia empieza en 1, y= dice que el num de filas debe ser igual al
# de la base de datos, z= es la cantidad que ira agregando al numero que sigue

m2$seq <- seq(1,nrow(m2),1)


## merge so that values of longer data frame that don't correspond to those in shorter frame are converted to NA. 

#Meaning new data frame is as short as shortest data frame

mt <- merge(x=m1, y =m2, by=c("transect.id","seq"), all.x=T, no.dups=T)

nrow(mt)

# JOIN: depends on right join, left join, or full join.

#right join = all.y = T Va a considerar todos los valores de y

mj <- right_join(x=m1,y=m2, by=c("transect.id","seq")) # el by va a servir para poner lo que tienen en comun

nrow(mj)

#left join = all.x = T . Va a considerar todos los valores de X

mj2 <- left_join(x=m1,y=m2, by=c("transect.id","seq"))

nrow(mj2)

#If there are multiple matches between x and y, all combination of the matches are returned. This is a mutating join.

#anti-join: finds areas that do not match



# Group by and summarise --------------------------------------------------


# using the pipe function ( %>%)

# data frame first, then the pipe fun, then the group by the column you want to group by

# then the pipe function again then summarise the specific name of what you are trying to 

# obtain, then the function and then the isolated colmn, the mtcars data is already apart 

# of the base R, so you do not need to use the $ function to isolate the colmns values


head(mtcars)

mc<-mtcars

head(mc)


library(tidyverse)

#group mtcars by cylinders and return some averages (mean)

cyl.gb<-mc %>%group_by(cyl)%>% summarise(mpg= mean(mpg), hp=mean(hp), carb=mean(carb)) 

head(cyl.gb)


# RENAMING ----------------------------------------------------------------

load("fish_data (1).Rdata")

f

fs <- f[,c("transect.id", "area_fac", "depth_fac", "parcel.id", "parcel.density.m3", "parcel.length.m")]

head(fs)

# Darle un nombre nuevo:

#dataframe<-rename(.data = data frame, new name = old name)

library(tidyverse)

fs <- rename(.data=fs, tid =transect.id)

fs <- rename(.data=fs, area=area_fac)

fs <- rename(.data=fs, depth=depth_fac)

fs <- rename(.data=fs, pid = parcel.id)

fs <- rename(.data=fs, pl = parcel.length.m)

fs <- rename(.data=fs, pd=parcel.density.m3)

# names(dataframe)[location]<-c("new name") need the "quotations"

#names function=> names(datafram)[location]-> c("new name")
#How to rename a field (or column)

names(fs)[1] = c("transect")

names(fs)[1:3] = c("transect", "area","depth")

head(fs)


# AGGREGATE ---------------------------------------------------------------

# creates a datafram already, cleaner. ya no necesitas crear un data frame (as.data.frame)

# Es como tapply pero no estoy cominando nada. BY es otra cosa!!!! No es como merge or join. Es como INDEX en tapply

team.stats.sum <- aggregate(x=d[,c("AB","H","BB","2B","HR")], by=list(d$teamID), FUN=sum)

team.stats.sum

team.stats.mean <- aggregate(x=d[,c("AB","H","BB","2B","HR")], by=list(d$teamID), FUN=mean)

head(team.stats.mean)

# attach ------------------------------------------------------------------

head(mc)

# En R hay data sets que ya existen para practicar. Entonces si pones "attach" es como library pero 
# para los datasets de R

attach(mc)
mc

#attach allows to call the dataframe by there names only, already a dataframe, do not need to create a df

#why do I need to attach here?

cars<-aggregate(mc, by =list(cyl, gear), FUN=mean, na.rm=TRUE)

head(cars)

cars[c("cyl", "gear")]<-NULL

head(cars)



# Melt and cast -----------------------------------------------------------

# melt goes from wide to long / cast goes from long to wide


# Melt --------------------------------------------------------------------

# Using the function "melt" from the reshape2 package to change data frame from wide to long format

load("fish_data.Rdata")

f

fs <- f[,c("transect.id", "area_fac", "depth_fac", "parcel.id", "parcel.density.m3", "parcel.length.m")]
 
head(fs)

library(reshape2)

# melt(data= data frame, id.vars= c("isolate qualitative data"), measure.vars = c("qualitative data"), 
# value.name= name the column that you want to associate with that

fs.melt <-melt(data = fs, id.vars = c("transect.id", "parcel.id", "area_fac", "depth_fac"), 
               measure.vars = c("parcel.length.m"), value.name = c("numbers"))

head(fs.melt)


unique(fs.melt$variable)

fs.melt$variable <- as.character(fs.melt$variable)

head(fs.melt)


# dcast -------------------------------------------------------------------

#using dcast function to transform your data from long to wide. It can find the function of
#the variable that you isolate, it finds the function using fun.aggregate and then puts the 
#format back into wide rather than long


fs.dcast <- dcast(data = fs.melt, formula = transect.id~variable, value.var = c("numbers"), 
                  fun.aggregate = mean)

head(fs.dcast)

names(fs.melt)


# Duplicates and removing duplicates --------------------------------------

# rbind -------------------------------------------------------------------

# Creating a database with duplicates. We are gonna work with 3 rows that are duplicated (k1,k2,k3)

k1 <- fs[1,]

k2 <- fs[1,]

k3 <- fs[1,]

k4 <- fs[2:10,]

# bind these individual objects back together using function"rbind"

k <- rbind(k1,k2,k3,k4)

head(k)

#now the first 3 rows are duplicate observations 

no.dups <-k[!duplicated(k),]

no.dups

#and now the duplicated are gone 

dups <- k[duplicated(k),]

#now I just got all the duplicates to see them 

head(dups)

head(no.dups)


# cbind -------------------------------------------------------------------

# Para unir columnas

c1 <- subset(x=f, f$depth_fac == "Deep", select = c("transect.id","area_fac"))
head(c1)

c2 <- subset(x=f, f$depth_fac == "Deep", select = c("depth_fac","parcel.length.m","group"))
head(c2)


c3 <- cbind(c1, c2)

head(c3)


# Complete cases / NA -----------------------------------------------------

#complete cases removes lines where there are NAs 

#data with NAs 

fs[2,]$pd <- NA

fs[4,]$pl <- NA 

fs

fs.complete <- fs[complete.cases(fs),] 

head(fs.complete)



# ASCEND / DESCEND --------------------------------------------------------

# arrange function: es para ordenar un data set ascendiente o descendientemente

# Ascend no tiene una funcion asignada. R asume que si no pones nada es ascend.

# Para DESCEND, si debes poner "desc" y luego poner el "character data" que usaras

attach(mtcars)

#sort by mpg, order and range

# ASCEND: con ORDER y con ARRANGE

### ORDER: 

nd <- mtcars [order(mpg), ]

nd

### ARRANGE function

nd.arrange <-arrange(.data = mtcars, mpg)

nd.arrange

# DESCEND

nd.arrange.desc<-arrange(.data = mtcars, desc(mpg))

nd.arrange.desc

## cambiando ASCEND to DESCEND:

nd.m.c<-arrange(.data = mtcars, mpg, cyl)

nd.m.c.desc<-arrange(.data = mtcars, mpg, desc(cyl))

nd.m.c.desc


# FILTER ------------------------------------------------------------------

# Es una manera de hacer subsetting

# only returns a subset of rows or colms from the dataset

# fi = data frame name, depth_fac = es lo que quiero subset

fd6.1<-filter(.data = fi, depth_fac == "Deep", preserve == T)

# Percentiles -------------------------------------------------------------

Percentiles.per.year <- tapply(f$parcel.length.m, f$year, summary)


Percentiles.per.depth <- tapply(f$parcel.length.m, f$depth_fac, summary)




