#Set Working Directory
setwd("/Users/NRC/DataScience-SMU/CaseStudy1")

# Importing Files from the web
GDPsite <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
EDUCsite <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(GDPsite,destfile = "Data/GDP.csv")
download.file(EDUCsite,destfile = "Data/EDUC.csv")

# Loading GDP Data and load only the lines that correspond with a ranked country
# We are also changing the column labels and removing unwanted columns

GDP <- read.csv ("Data/GDP.csv",sep = ",",header = FALSE, skip=5,nrows = 190,col.names = c("CountryCode","Ranking","Blank","CounterName","CountryGDP","V6","V7","V8","V9","V10"))
GDP[6:10] <- NULL
GDP[3] <- NULL

# Loading Education Data and Loading only fields required by our analysis
Educ <- read.csv("Data/EDUC.csv",sep = ",",header = TRUE)
Educ <- Educ[c(1,3)]

# Changing the format of our CountryGDP and Ranking to be able to sort them later
GDP$CountryGDP <- as.numeric(gsub("[^[:digit:]]","", GDP$CountryGDP))
GDP$Ranking <- as.numeric(gsub("[^[:digit:]]","", GDP$Ranking))