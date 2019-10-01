# Romina Elizabeth del Milagro Carnero Huaman 
# Assignment 3 - Lab 4

library(tidyverse)


# CSV ---------------------------------------------------------------------

ds1 <- read_csv("BGSREC.csv")
ds1

ds2 <- read_csv("CRUISES.csv")
ds2

ds3 <- read_csv("CTDCASTREC.csv")
ds3

ds4 <- read_csv("CTDREC.csv")
ds4

ds5 <- read_csv("ENVREC.csv")
ds5

ds6 <- read_csv("GLFREC.csv")
ds6

ds7 <- read_csv("INGEST_DATA.csv")
ds7

ds8 <- read_csv("INVREC.csv")
ds8

ds9 <- read_csv("ISTREC.csv")
ds9

ds10 <- read_csv("lg_camera_class_groupings_20170113_phylo_orderd.csv")
ds10

ds11 <- read_csv("NEWBIOCODESBIG.csv")
ds11

ds12 <- read_csv("OST14_1E_d5_frames.csv")
ds12

ds13 <- read_csv("SHRREC.csv")
ds13

ds14 <- read_csv("STAREC.csv")
ds14

ds15 <- read_csv("STAREC_rev20190402.csv")
ds15

ds16 <- read_csv("VESSELS.csv")
ds16



# txt ---------------------------------------------------------------------

ds17 <- read_csv("aurelia_15minCell_statareas.txt")
ds17

ds18 <- read_csv("ISIIS201405281105.txt")
ds18

ds19 <- read_csv("ISIIS201405281124.txt")
ds19

ds20 <- read_csv("ISIIS201405281215.txt")
ds20

ds21 <- read_csv("ISIIS201405281609.txt")
ds21

ds22 <- read_csv("ISIIS201405291242.txt")
ds22

# xlsx --------------------------------------------------------------------

library(readxl)

ds23 <- read_xlsx("Aurelia_SEAMAP_2012-2018_30minCell.xlsx")
ds23

ds24 <- read_xlsx("NameTranslator_table20140330.xlsx")
ds24

ds25 <- read_xlsx("transect_towtime.xlsx")
ds25

# Rdata -------------------------------------------------------------------

ds26 <- load("aurelia_15minCell_statareas.Rdata")

#Done
