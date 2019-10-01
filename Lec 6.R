getwd()
setwd(C:\MINA\UL\Fall 2019\R Lab\Romina")
list.files(pattern=".txt")
list.files()
list.files(pattern=".txt", recursive=T)
#read data from a text file

file<-read.table(file="ISIIS201405291242.txt", sep="\t", skip=10, header=TRUE,
                 fileEncoding="ISO-8859-1", stringsAsFactors=FALSE, quote="\"",
                 check.names=FALSE, na.strings="9999.99")
d<-file<-read.table(file="ISIIS201405291242.txt", sep="\t", skip=10, header=TRUE,
                    fileEncoding="ISO-8859-1", stringsAsFactors=FALSE, quote="\"",
                    check.names=FALSE, na.strings="9999.99")

d
getwd()

#create a proper date + time format

date <- scan(file="ISIIS201405291242.txt", what="character", skip=1, nlines=1, quiet=TRUE)
date
date<-date[2]
date

library(stringr)

mm <- str_sub(string=date, start=1, end=2)

mm

dd<-str_sub(string=date, start=4, end=5)

dd

dd<-as.numeric(dd)

dd

yy<-str_sub(string=date, start=7, end=8)

yy

dateNextDay<-str_c(mm,as.character(dd+1), yy, sep="/")
dateNextDay<-str_c(mm,as.character(dd+1), yy, sep="-")
dateNextDay

d$hour <- as.numeric(str_sub(d$Time,start=1,end=2))
d$hour

# to take out the MINUTES
d$min <- as.numeric(str_sub(d$Time,start=4,end=5))
d$min


# to take out the SECONDS

d$sec <- as.numeric(str_sub(d$Time,start=7,end=8))
d$sec

d$date<-date
d$date
d$dateTime<-str_c(d$date, d$time, sep="")
d$dateTime<-as.POSIXct(strptime(d$dateTime, format="%m/%d/%y"))

#Excel file

library(readxl)
e <- read_xlsx(path="")












