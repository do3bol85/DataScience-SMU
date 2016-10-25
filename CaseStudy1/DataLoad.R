# Loading GDP Data and Excluding unwanted rows and columns
GDPsite <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
EDUCsite <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

getwd()
setwd("/Users/NRC/DataScience-SMU/CaseStudy1")
download.file(GDPsite,destfile = "./GDP.csv")
download.file(EDUCsite,destfile = "./EDUC.csv")

GDP <- read.csv ("GDP.csv",sep = ",",header = FALSE, skip=5,nrows = 190,col.names = c("CountryCode","Ranking","Blank","Economy","CountryGDP","V6","V7","V8","V9","V10"))
GDP[6:10] <- NULL
GDP[3] <- NULL

# Loading Education data
Educ <- read.csv("EDUC.csv",sep = ",",header = TRUE)
Educ <- Educ[c(1,3)]

GDP$CountryGDP <- as.numeric(gsub("[^[:digit:]]","", GDP$CountryGDP))
GDP$Ranking <- as.numeric(gsub("[^[:digit:]]","", GDP$Ranking))