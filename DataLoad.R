# Loading GDP Data and Excluding unwanted rows and columns
GDP <- read.csv ("CaseStudy1/GDP.csv",sep = ",",header = FALSE, skip=5,nrows = 190,col.names = c("Country","Ranking","Blank","Economy","MillionsOfUSDollars","V6","V7","V8","V9","V10"))
GDP[6:10] <- NULL
GDP[3] <- NULL

# Loading Education data
Educ <- read.csv("CaseStudy1/Educ.csv",sep = ",",header = TRUE)