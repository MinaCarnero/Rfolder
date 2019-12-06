# Test 4 - Introduction to R
# Romina Carnero Huaman

library(ggplot2)
library(ggmap)
library(osmdata)
library(plyr)


# Question 1 --------------------------------------------------------------

load("sec_stad.Rdata")

head(sec_stad)

unique(sec_stad$Capacity)
class(sec_stad$Capacity)

ggplot(sec_stad, aes(x=Name, y=Capacity)) + 
  geom_bar(stat="identity", fill="red",position = 'dodge') + coord_flip() + 
  theme(axis.text.x = element_text(angle=90, size = 10), axis.text.y=element_text(size=5)) + 
  labs(title="Capacity of each Football stadium", x="Capacity", y = "Stadium Name")


# Question 2 --------------------------------------------------------------

load("team_statistics.Rdata")

head(ts)
unique(ts$Conference)

Teams = subset(ts, Conference=="Sun Belt Conference") 

unique(Teams$Team)

ggplot(Teams, aes(x=Pass.Yard, y=Rush.Yard, color=Team)) +
  geom_point(size=4) + 
  geom_smooth(method=lm, aes(fill=Team), se=FALSE, fullrange=TRUE) +
  labs(title="Correlation between passing yards and the number of rushing yards ", 
       x="Pass Yard", y = "Rush Yard")


# Question 3 --------------------------------------------------------------

Teams2 = subset(ts, Conference=="Big Ten Conference") 

levels(ts$Conference)

ggplot(Teams2, aes(x=Team, y=Rush.Yard)) + 
  geom_boxplot(color="black", fill="yellow", lwd=2) +
  theme(axis.text.x=element_text(angle=90, size=10),legend.position="none", 
        panel.background = element_rect(fill = "deepskyblue4", colour = "deepskyblue4")) + 
  labs(title="Box-and-whisker plot for rushing yards per football team", x="Teams", y = "Rush Yard") 

#Minnesota has the most rushing yards, on average

# Question 4 --------------------------------------------------------------

load("football_stats.Rdata")

Teams3 = subset(football.stats, Conference=="Southeastern Conference") 

ggplot(data = Teams3, aes(x = variable, y=Team, fill=stat)) + 
  geom_raster() +
  scale_fill_gradient2(low="red", mid="yellow", high="green") +
  labs(title="Heat Map of the teams in the Southeastern Conference", x="Stats", y = "Teams") +
  theme_bw() +
  theme(axis.text.x = element_text(size = 10, hjust = 0, vjust = 0.4, angle=90))


# Question 4c

ggplot(data = Teams3, aes(x = variable, y=Team, fill=stat)) + 
  geom_raster() +
  scale_fill_gradient2(low="red", mid="yellow", high="green", trans = 'log' ) +
  labs(title="Heat Map of the teams in the Southeastern Conference (log10)", x="Stats", y = "Teams") +
  theme_bw() +
  theme(axis.text.x = element_text(size = 8, hjust = 0, vjust = 0.4, angle=90))


# Question 5 --------------------------------------------------------------

map.toner = get_stamenmap(bbox = c(left = -110, bottom = 20, right = -70, top = 40), zoom = 5,
                          maptype = 'toner')
a <- ggmap(map.toner) +
  labs(title="Map of the Central and Southeastern areas of the United States", x="Longitude", 
       y = "Latitude")

a

# Question 6 --------------------------------------------------------------

b <- ggmap(map.toner)+
  geom_point(data = sec_stad, mapping = aes(x = lng, y = lat), size=4, color="red") +
  labs(title="Map of all the SEC stadium in the central and southeastern areas of the U.S.",
       x="Longitude", y = "Latitude")

b

# Question 7 --------------------------------------------------------------

c <- ggmap(map.toner)+
  geom_point(data = sec_stad, mapping = aes(x = lng, y = lat, size=Capacity, col=Capacity))  +
  scale_color_gradient(low = "green", high = "red")+
  labs(title="Stadiums in the central and southeastern areas of the U.S.",
       x="Longitude", y = "Latitude")

c

# Question 8 --------------------------------------------------------------

plot_list = list(a, b, c)
for (i in 1:3) {
  file_name = paste("Maps", i, ".png", sep="")
  png(file_name, res = 300, height = 1000, width = 1920)
  print(plot_list[[i]])
  dev.off()
}


# Question 9 --------------------------------------------------------------

i <- max(sec_stad$Capacity) 

sec_stad$Name[which(sec_stad$Capacity == i)]

# Answer: Neyland Stadium

# Question 10 -------------------------------------------------------------

SumStadiums=ddply(sec_stad,~State,summarise,Mean=mean(Capacity),SD=sd(Capacity))

SumStadiums

