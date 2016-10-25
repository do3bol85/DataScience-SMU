#1- How many of the IDs match?

# Printing the number of Country Code that matches between the two datasets
print(paste0("ID's in both tables: ",length(intersect(GDP$CountryCode,Educ$CountryCode))))

#2- What is the 13th country in the resulting data frame?

# Extracting the 13 row from the data to check the 13 country ranking
X <- GDPandEDUCSorted[13,]
knitr::kable(X,padding = 2,align = 'l')

#3- What are the average GDP rankings for the "High income: OECD" and "High income:nonOECD" groups?

# Showing two income groups and there average ranking. Using kable from knitr to show the table in nice form
Y <- ddply(GDPandEDUCSorted[GDPandEDUCSorted$Income.Group == "High income: nonOECD" | GDPandEDUCSorted$Income.Group == "High income: OECD",],.(Income.Group),summarize, "Average Ranking"=mean(Ranking))
knitr::kable(Y,padding = 2, align = 'l')

# Analysis #4
# Plot the GDP for all of the countries. Use ggplot2 to color your plot by Income Group
# Creating a scatter plot with all countries, grouped by Income Group
# Plotting a scatter plot to showcase countries by Income Group and their GDP
ggplot(GDPandEDUCSorted)+ geom_point(aes(x=CountryGDP,y=Income.Group,colour=Income.Group))+scale_x_log10()+labs(x = GDPandEDUCSorted$CountryGDP)

# Analysis #5
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

# Changing the Ranking column to numeric
GDPandEDUCSorted$Ranking <- as.numeric(as.character(GDPandEDUCSorted$Ranking))
# Cutting the GDP Ranking into 5 separate quantile groups
GDPandEDUCSorted$Quants <- cut(GDPandEDUCSorted$Ranking,breaks = 5)
# Creating a table 
GDPQuants <- table(GDPandEDUCSorted$Income.Group,GDPandEDUCSorted$Quants)
knitr::kable(GDPQuants,padding = 2, align  = 'l')
# Create a table that shows the countries with Lower middle income but among the 38 nations with highest GDP
Z <- GDPandEDUCSorted[which(GDPandEDUCSorted$Ranking <= 38 & GDPandEDUCSorted$Income.Group == "Lower middle income"),]
knitr::kable(Z, padding = 2, align = 'l')