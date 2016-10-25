# Loading GDP Data and Excluding unwanted rows and columns
GDP <- read.csv ("Data/GDP.csv",sep = ",",header = FALSE, skip=5,nrows = 190,col.names = c("CountryCode","Ranking","Blank","Economy","CountryGDP","V6","V7","V8","V9","V10"))
GDP[6:10] <- NULL
GDP[3] <- NULL

# Loading Education data
Educ <- read.csv("Data/Educ.csv",sep = ",",header = TRUE)
Educ <- Educ[c(1,3)]

GDP$CountryGDP <- as.numeric(gsub("[^[:digit:]]","", GDP$CountryGDP))
GDP$Ranking <- as.numeric(gsub("[^[:digit:]]","", GDP$Ranking))