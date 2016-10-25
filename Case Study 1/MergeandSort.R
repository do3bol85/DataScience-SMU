library(plyr)
library(ggplot2)
library(downloader)
#1 - Merge the data based on the country shortcode. How many of the IDs match?
# Merging Data sets by short country code
GDPandEDUC <- merge(Educ, GDP, by = "CountryCode")

#2 - Sort the data frame in ascending order by GDP (so United States is last). What is the 13th country in the resulting data frame?
# Sorting data in Ascending order by dollars
GDPandEDUCSorted <- GDPandEDUC[order(GDPandEDUC$CountryGDP, decreasing = FALSE),]

#3 - What are the average GDP rankings for the "High income: OECD" and "High income:nonOECD" groups?
ddply(GDPandEDUC[GDPandEDUC$Income.Group == "High income: nonOECD" | GDPandEDUC$Income.Group == "High income: OECD",c(3,32)],.(Income.Group),summarize, Ranking=mean(Ranking))

# How many ID matches
print(paste0("Total Number of ID Matches: ",length(intersect(GDP$CountryCode,Educ$CountryCode))))

#4 - Plot the GDP for all of the countries. Use ggplot2 to color your plot by Income Group.
p<-ggplot(GDPandEDUCSorted)+ geom_point(aes(x=CountryGDP,y=CountryCode,colour=Income.Group)) #change y axis to log scale
p