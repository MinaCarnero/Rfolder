# Libraries

library(tidyverse)
library(plyr)
library(dplyr)
library(reshape2)
library(nutshell)
library(grid)
library(gridExtra)
library(ggplot2)
library(stringr)
library(scales)
library(oce)
library(RColorBrewer)

# for loop

# allow you perform a function many times over and over and over
# margins (es la tercera posicion en la funcion seq): 1 means by row , 2 means by column
# dentro de {} siempre va todo lo que se relaciona con la funcion

# Temperature conversion ---- 

# Creando una pequenha tabla para poder probar la funcion

# Primero se crea la secuencia. En este caso: el 0 significa que empieza en 0, el 100 quiere decir que ira
# del 0 al 100. Esta secuencia se llama f_deg, porque se refiere a temperatura en Farenheit

t <- data.frame(f_deg=seq(0,100,1))
head(t) 

# Luego creamos dos columnas mas con el simbolo de dolar. Y ponemos NA en cada una porque no necesitamos que tengan
# datos porque nosotros vamos a crear una funcion para que hayan datos en estas dos columnas

# Crendo la columna para la temperatura en Celsius

t$c_deg <- NA

# Creando la columna para la temperatura en Kelvin

t$K_deg <- NA

# Checking que ahora tenemos tres columnas. Farenheit, Celsius y Kelvin

head(t)

# Funcion "for in" para aplicar la conversion de Farenheit a Celsius. Dentro del {} voy a creasr la funcion, en donde
# especifico que para pasar de F a C necesito restar 32 y luego multiplicar por 9/5. Y luego para la segunda columna,
# que es convertir de C a K,solo necesito sumarle 273.15 a los Celsius.

for(i in 1:nrow(t)){
  
  t[i,]$c_deg <- (t[i,]$f_deg - 32) *(9/5)
  t[i,]$K_deg <- (t[i,]$c_deg + 273.15)
}

# ahora probamos las conversiones con cualquier temperatura en Farenheit. i = 1 . Entonces colocamos: 
# nombre del data set[1,]

i = 1
t[1,]

# I got:

# f_deg c_deg  K_deg
# 1     0 -57.6 215.55

head(t)

# Cuando solo quiero convertir las temperaturas de las primeras 5 filas de F a Celsius y Kelvin usar 1:5

t[1:5,]



# Le agregamos una columna llamada rel_temp en donde dira con palabras si es cold or not de acuerdo al resultado de la
# temperatura

t$c_deg <- NA
t$K_deg <- NA
t$rel_temp <- NA

head(t)

for(i in 1:nrow(t)){
  
  t[i,]$c_deg <- (t[i,]$f_deg - 32) *(9/5)
  t[i,]$K_deg <- (t[i,]$c_deg + 273.15)
  
  t[i,]$rel_temp <- ifelse(test=t[i,]$c_deg < 0,
                           yes = "cold",
                           no = "not cold")
}

t[1,]                           

# I got
# f_deg c_deg  K_deg rel_temp
# 1     0 -57.6 215.55     cold

# Combining with "if else" ----

# using a conditional statement (if < 0, but > 1)

# intead of having just 2 conditions we are gonna work with 4 

# Example 1: temperature

t$c_deg <- NA
t$K_deg <- NA
t$rel_temp <- NA

goldilocks <- function(x){
  
  if (x<=0)
    t[i,]$rel_temp<-"frozen"
  
  else if(x > 0 & x <= 50)
    t[i,]$rel_temp <- "cold"
  
  else if(x>50 & x <= 70)
    t[i,]$rel_temp <- "warm"
}


for(i in 1:nrow(t)){
  
  t[i,]$c_deg <- (t[i,]$f_deg - 32) *(9/5)
  t[i,]$K_deg <- (t[i,]$c_deg + 273.15)
  
  t[i,]$rel_temp <- goldilocks(x = t[i,]$c_deg)
}

head(t)

View(t)

# Example 2: converting from miligrams to grams

w <- data.frame(g=seq(0,100,1))
head(w)                
w$mg <- NA
head(w)

for(i in 1:nrow(w)){
  
  w[i,]$mg <- (w[i,]$g/1000)
}

i = 1
w[1:10,]


# Example 3: length

y <- seq(1,10,0.5)
x <- seq(1,20,1)

head(y)
head(x)

d <- data.frame(interaction = seq(1,10,0.5))
head(d)
view(d)

length(y)
length(x)

for(i in 1:length(y)){
  
  for(k in 1:19){
    
    d$output <- y[i] + x[k]
  }
}

view(d)


patch.list <- list()

max.brks.index <- nrow(brks)
max <- max(brks$no)-1

for(k in brks$no[1]:max){
  p.mid <- in.patch[in.patch$r.index >= brks$r.index[k] &
                      in.patch$r.index < brks$r.index[k+1], ]
  if(nrow(p.mid)>0){
    p.mid$patch.id <- k+1
    patch.list[[k]] <- p.mid
  }
}

patch.df <- do.call("rbind", patch.list)


# ddply ----

library(tidyverse)
load("fish_data.Rdata")

ddply(.data = fish, .variables = "transect.id", function(x){
  
}, .progress = "text")

# list all the physical data files in a given directory

batch_data <- list.files(paste0("batch_data"), full=TRUE, pattern = "ISIIS")

phy <- adply(batch_data, 1, function(file) {
  
  # read the data
  d <- read.table(batch_data[1], sep="\t", skip=10, header=TRUE, fileEncoding="ISO-8859-1",
                  stringsAsFactors=FALSE, quote="\"", check.names=FALSE, encoding="UTF-8",
                  na.strings="9999.99")
  
  # clean names
  head <- names(d)
  head <- str_replace(head, "\\(.*\\)", "")
  head <- str_trim(head)
  head <- make.names(head)
  head <- tolower(head)
  head <- str_replace(head, fixed(".."), ".")
  # assign names
  names(d) <- head
  
  # create a proper date + time format
  date <- scan(batch_data[1], what="character", skip=1, nlines=1, quiet=TRUE)
  
  d$date <- date[2]
  
  d$dateTime <- str_c(d$date, d$time, sep=" ")
  
  d$dateTime <- as.POSIXct(strptime(d$dateTime, format="%m/%d/%y %H:%M:%OS", tz="America/New_York"))
  
  return(d)
  
}, .progress="text")

# ggplot ----

library(ggplot2)

load("fish_data.Rdata")

#Non 'ggplot2' plotting functions ------
fish.deep <- fish[fish$depth_fac == "Deep",]

plot(x = fish.deep$parcel.start.lon,
     y = fish.deep$parcel.start.lat)

hist(log10(fish$parcel.density.m3))

#ggplot2 functions -----

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point()

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(colour = "blue")

ggplot(data = mpg, aes(x = displ, y = hwy, colour=class)) +
  geom_point()

length(unique(mpg$class))

ggplot(data = mpg, aes(x = displ, y = hwy, colour=class)) +
  geom_point() +
  scale_colour_manual(values = c("firebrick2","dodgerblue","darkgreen",
                                 "goldenrod","cornsilk2","chocolate2",
                                 "deeppink1"))

ggplot(data = mpg, aes(x = displ, y = hwy, colour=class)) +
  geom_point() +
  scale_colour_manual(values = c("firebrick2","dodgerblue","darkgreen",
                                 "goldenrod","ivory","chocolate2"))

#ggplot2: line geom -----

ggplot(data = mpg, aes(x = displ, y = hwy, colour=class)) +
  geom_line()

#facets-----

# es para agrupar los graficos de los datos que tu eliges EN RECTANGULOS. Por ejemplo, aqui lo agrupa 
# por class, que es el modelo de carro y luego tambien el nrow es el num de filas en las que quieres 
# los graficos y el ncol el numero de columnas en las que quieres presentar los graficos

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_line() +
  facet_wrap(~class)

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~class)

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~class, nrow = 4)

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~class, ncol = 1)

#add a smoother ----

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = "lm")

#histogram ----

ggplot(data = mpg, aes(displ, fill=drv)) +
  geom_histogram(binwidth = 0.5)

ggplot(data = mpg, aes(displ, colour = drv)) +
  geom_freqpoly(binwidth = 0.5)


# OTRA CLASE DE GGPLOT --------

library(ggplot2)

#one geom:
data(economics)
e <- economics

unemploy <- ggplot(data = e, aes(x = date, y = unemploy)) +
  geom_line()

unemploy

#multiple geoms ----

data("presidential")
pres <- presidential

caption <- paste(strwrap("Unemployment rates in the U.S. have varied a lot over the years",40),
                 collapse = "\n")
caption

yrng <- range(e$unemploy)
xrng <- range(e$date)
date <- as.Date("1960-01-01")

ggplot(e) +
  geom_line(aes(x = date, y=unemploy)) +
  geom_rect(data = pres, aes(xmin = start,
                             xmax = end, fill = party),
            ymin=-Inf, ymax =Inf, alpha = 0.2) +
  scale_fill_manual(values = c("dodgerblue","firebrick3")) +
  geom_vline(data = pres,
             aes(xintercept=as.numeric(start)),
             colour="grey50", alpha=0.5) +
  # #geom_text(data=pres, aes(x = start, y = 2500,
  #                          label = name), size = 3,
  #           vjust = 0, hjust = 0, nudge_x = 50) +
  annotate("text", x=date, y=yrng[2],label=caption,
           hjust=0,vjust =1, size = 4)

#bar graph challenge ----

# stacked bar with grouped bar

load("fish_data.Rdata")
library(tidyverse)
library(plyr)

fs <- fish %>% group_by(area_fac, depth_fac, yr_fac) %>%
  summarise(parcel.count = length(parcel.id))

fs

ggplot(fs) +
  geom_bar(aes(x = area_fac, y=parcel.count, fill = depth_fac),
           position = "stack",
           stat = "identity") +
  facet_grid(yr_fac~.)

#grouped bar -----------

ggplot(fs) +
  geom_bar(aes(x = area_fac, y=parcel.count, fill = depth_fac),
           position = "dodge",
           stat = "identity")

ggplot(fs) +
  geom_bar(aes(x = yr_fac, y=parcel.count,
               fill = depth_fac),
           position = "stack",
           stat = "identity") +
  facet_wrap(~area_fac)

# clase que ensenho Ryan ----

#' """ ddply for plotting
#'     @author: Ryan James
#'     date: 10/30/19"""


library(plyr)
library(tidyverse)

load('fish_data.Rdata')

ggplot(fish, aes(parcel.length.m, parcel.density.m3))+
  geom_point()+
  ylab(expression(paste('Parcel Density (',m^3,')')))+
  facet_wrap(~depth_fac)

# using ddply to plot multiple objects -----

ddply(.data = fish, .variables = "depth_fac", function(x){
  name = unique(x$depth_fac)
  pl = ggplot(x, aes(parcel.length.m, parcel.density.m3))+
    geom_point()+ 
    xlab('Parcel length (m)')+
    ylab(expression(paste('Parcel Density (',m^3,')')))+
    ggtitle(name)
  
  
  ggsave(filename = paste0(name,'.tiff'),
         plot = pl, width = 4, height = 3, units = 'in',
         dpi = 600, compression = 'lzw')
}, .progress = "text")

## ploting 3 variables----

data("mtcars")

ggplot(mtcars, aes(vs, cyl, fill = mpg))+
  geom_tile()

ggplot(mtcars, aes(wt, mpg))+
  geom_point(aes(color = hp))+
  theme_bw()

# MORE PLOTTING DE ULTIMA SEMANA DE CLASES ----

#Call functions:

# Compute the straight line distance (km) from the starting point of a lat,lon trajectory

dist.from.start <- function(lat, lon) {
  library("oce")
  geodDist(lat1=lat, lon1=lon, lat2=na.omit(lat)[1], lon2=na.omit(lon)[1])/1.852 # use if you want 
  # to convert from km to nautical miles
}

# Spectral colour map from ColorBrewer

spectral <- function(n=6) {
  library("RColorBrewer")
  rev(brewer.pal(name="Spectral", n=n))
}

scale_fill_spectral <- function(...) {
  scale_fill_gradientn(colours=spectral(...))
}

scale_colour_spectral <- function(...){
  scale_colour_gradientn(colours=spectral(...))}
  
  
# HEAT MAP ----

  library(ggplot2)
  library(nutshell)
  library(tidyverse)
  library(dplyr)
  
  # generate a basic heatmap -----
  data("batting.2008")
  bat <- batting.2008; rm(batting.2008)
  
  # CREATE DATA FRAME
 
  #summarize metrics by team: find mean using players
  bat.metrics <- bat %>% group_by(teamID) %>% summarise(home.run = mean(HR, na.rm = T),
                                                        runs = mean(R, na.rm = T),
                                                        runs.batted.in = mean(RBI, na.rm=T),
                                                        hits = mean(H, na.rm = T))
  
  # get names of metrics
  metric.names <- names(bat.metrics[,c(2:5)])
  
  #melt data
  
  library(reshape2)
  bat.metrics.melt <- melt(data = bat.metrics, id.vars = c("teamID"),
                           measure.vars = metric.names,
                           variable.name = "metrics")
  
  
  #pick teams from "bat.metrics.melt" data frame to plot
  teams <- c("HOU", "SEA", "WAS", "COL","OAK","ATL")
  
  # PLOT: heatmap
  # - here, we use geom_tile()
  
  ggplot(data = bat.metrics.melt[bat.metrics.melt$teamID %in% teams,],
         aes(x = metrics, y = teamID)) +
    geom_tile(aes(fill = value))
  
# USANDO DDPLY PARA PLOTEAR VARIOS A LA VEZ ----
  
  #Plot physical data for each transect
  
  library("plyr")
  library("stringr")
  library("ggplot2")
  library("reshape2")
  library("grid")
  library("gridExtra")
  library("scales")
  library("dplyr")
  
  #create director to store plots ---
  suppressWarnings(dir.create("plots"))
  
  #load data
  load("data_sets/ost2014_phy_t.Robj")
  
  #Call functions:
  
  # Compute the straight line distance (km) from the starting point of a lat,lon trajectory
  dist.from.start <- function(lat, lon) {
    library("oce")
    geodDist(lat1=lat, lon1=lon, lat2=na.omit(lat)[1], lon2=na.omit(lon)[1])/1.852 # use if you want to convert from km to nautical miles
  }
  
  # Spectral colour map from ColorBrewer
  spectral <- function(n=6) {
    library("RColorBrewer")
    rev(brewer.pal(name="Spectral", n=n))
  }
  
  scale_fill_spectral <- function(...) {
    scale_fill_gradientn(colours=spectral(...))
  }
  scale_colour_spectral <- function(...) {
    scale_colour_gradientn(colours=spectral(...))
  }
  
  #make plots ---------
  # identify variables of interest to plot
  vars <- c("temp", "salinity", "sw.density", "chl.ug.l")
  
  ddply(.data = phy_t, .variables = "transect.id", function(x){
    
    x <- na.omit(x)
    
    x$depth_round <- round(x$depth, digits = 1)
    
    dm <- melt(x, id.vars=c("dateTime", "depth_round"), measure.vars=vars)
    
    t <- ggplot(data = dm[dm$variable == "temp",], aes(x=(dateTime), y=-depth_round)) +
      geom_line(aes(colour=value, size = value), na.rm=T, show.legend = F) +
      scale_colour_gradient(high=spectral(), na.value=NA)+
      # scale_x_datetime(name = "Time", labels = date_format("%H:%M"),
      #                  breaks = date_breaks("15 min"), minor_breaks = "5 min") +
      scale_x_datetime(name = "") +
      scale_y_continuous("depth", expand=c(0.01,0.01)) +
      facet_grid(variable~.) +
      theme(panel.background = element_rect(fill = "white"),
            panel.grid.major = element_line(colour = "black"),
            strip.text.y = element_text(face = "bold", size = 12)) +
      theme(axis.text.x = element_blank(),
            axis.title.y = element_text(face = "bold", size = 12)) +
      ggtitle(label = unique(x$transect.id))
    
    s <- ggplot(dm[dm$variable == "salinity",], aes(x=dateTime, y=-depth_round)) +
      geom_line(aes(colour=value, size = value), na.rm=T, show.legend = FALSE) +
      scale_colour_gradient(high=spectral(), na.value=NA) +
      # scale_x_datetime("Time", labels = date_format("%H:%M"), breaks = date_breaks("15 min"), minor_breaks = "5 min") +
      scale_x_datetime(name = "") +
      scale_y_continuous("depth", expand=c(0.01,0.01)) + facet_grid(variable~.) +
      theme(strip.text.y = element_text(size = 10)) +
      theme(axis.text.x = element_blank()) +
      theme(axis.title = element_text(size = 12))
    
    d <- ggplot(dm[dm$variable == "sw.density",], aes(x=dateTime, y=-depth_round)) +
      geom_line(aes(colour=value, size = value), na.rm=T, show.legend = FALSE) +
      scale_colour_gradient(high=spectral(), na.value=NA) +
      scale_x_datetime(name = "") +
      #scale_x_datetime("Time", labels = date_format("%H:%M"), breaks = date_breaks("15 min"), minor_breaks = "5 min") +
      scale_y_continuous("depth", expand=c(0.01,0.01)) + facet_grid(variable~.) +
      theme(strip.text.y = element_text(size = 10)) +
      theme(axis.text.x = element_blank()) +
      theme(axis.title = element_text(size = 12))
    
    c <- ggplot(dm[dm$variable == "chl.ug.l",], aes(x=dateTime, y=-depth_round)) +
      geom_line(aes(colour=value, size = value), na.rm=T, show.legend = FALSE) +
      scale_colour_gradient(high=spectral(), na.value=NA) +
      scale_x_datetime("Time", labels = date_format("%H:%M"), breaks = date_breaks("15 min"), minor_breaks = "5 min") +
      scale_y_continuous("depth", expand=c(0.01,0.01)) + facet_grid(variable~.) +
      theme(strip.text.y = element_text(size = 10)) +
      theme(axis.text = element_text(size = 10)) + theme(axis.title = element_text(size = 12))
    
    g <- grid.arrange(t, s, d, c, ncol=1)
    
    #print image files to a directory
    png(file = paste0("plots/",unique(x$transect.id), ".png"), width = 8.5,
        height = 14, units = "in", res = 300)
    plot(g)
    dev.off()
    
  }, .progress = "text")
  
# GGMAP - SEGUNDA CLASE QUE ENSENHO RYAN -  ----  
  
  #' """ ggmap to plot raster maps in r 
  #'     @author: Ryan James
  #'     date: 11/13/19"""
  
  library(tidyverse)
  install.packages('ggmap')
  install.packages('osmdata')
  library(ggmap)
  library(osmdata)
  setwd("C:/Users/wrjam/Dropbox/2019_Fa_Intro2R")
  
  # downloading maps -----
  # terrain, toner, watercolor
  LA = getbb('Louisiana')
  LA
  # Louisiana terrain map
  map = get_stamenmap(bbox = LA, zoom = 8, 
                      maptype = 'terrain')
  ggmap(map)
  
  # LA toner
  map.toner = get_stamenmap(bbox = LA, zoom = 8, 
                            maptype = 'toner-background')
  
  ggmap(map.toner)
  
  # Ohio watercolor map
  map.OH = get_stamenmap(bbox = getbb('Ohio'), zoom = 6,
                         map = 'toner-lite')
  ggmap(map.OH)
  
  # venice italy map
  getbb('Venice Italy')
  map.venice = get_stamenmap(bbox = getbb('Venice Italy'), 
                             zoom = 12, map = 'terrain')
  ggmap(map.venice)
  
  # using manual values for bbox
 
  bbox = c(left = 20, bottom = 0, right = 30, top = 20)
  map = get_stamenmap(bbox = bbox, zoom = 6, map = 'terrain')
  ggmap(map)
  
  # points on the map
  df = read_csv('LDWF2008seine.csv')
  bb = c(left = min(df$lon), bottom = min(df$lat),
         right = max(df$lon), top = max(df$lat))
  la.map = get_stamenmap(bbox = bb, zoom = 8, 
                         map = 'terrain-background')
  ggmap(la.map) +
    geom_point(data = df, aes(x = lon, y = lat))
  
  # add buffer to map
  
  bb = c(left = min(df$lon)-0.2, bottom = min(df$lat)-0.2,
         right = max(df$lon)+0.2, top = max(df$lat)+0.2)
  la.map = get_stamenmap(bbox = bb, zoom = 8, 
                         map = 'terrain-background')
  ggmap(la.map) +
    geom_point(data = df, aes(x = lon, y = lat))
  
  # add color
 
   ggmap(la.map) +
    geom_point(data = df, aes(x = lon, y = lat), color = 'red')
  
  # color by basin
  
   ggmap(la.map) +
    geom_point(data = df, aes(x = lon, y = lat, 
                              color = basin))+
    scale_color_manual(values = c('purple', 'blue', 'orange',
                                  'green', 'yellow', '#d9381e'))
  
  # large mount bass catch vs not 
 
    ggmap(la.map)+
    geom_point(data = df, aes(x = lon, y = lat))+
    geom_point(data = df[df$species == "Largemouth Bass",],
               aes(x = lon, y = lat), color = 'red')
  
  # plot menhaden by abundance
  n = df %>% group_by(species) %>% summarise(n = n())
  d = n[order(n$n),]
  
  ggmap(la.map)+
    geom_point(data = df[df$species == 'Gulf Menhaden',],
               aes(x = lon, y = lat, size = num))
  
  # black drum 
  ggmap(la.map)+
    geom_point(data = df[df$species == 'Black Drum',],
               aes(x = lon, y = lat, color = num))+
    scale_color_gradientn(colors = terrain.colors(5))

