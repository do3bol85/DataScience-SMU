#3 - What are the average GDP rankings for the "High income: OECD" and "High income:nonOECD" groups?
ddply(GDPandEDUCSorted[GDPandEDUCSorted$Income.Group == "High income: nonOECD" | GDPandEDUCSorted$Income.Group == "High income: OECD",],.(Income.Group),summarize, Ranking=mean(Ranking))

# How many ID matches
print(paste0("ID's in both tables: ",length(intersect(GDP$CountryCode,Educ$CountryCode))))

#4 - Plot the GDP for all of the countries. Use ggplot2 to color your plot by Income Group.
p<-ggplot(GDPandEDUCSorted)+ geom_point(aes(x=CountryGDP,y=Income.Group,colour=Income.Group))+scale_x_log10()+labs(x = GDPandEDUCSorted$CountryGDP) #change y axis to log scale
p

GDPandEDUCSorted$Ranking <- as.numeric(as.character(GDPandEDUCSorted$Ranking))
GDPandEDUCSorted$Quants <- cut(GDPandEDUCSorted$Ranking,breaks = 5)
GDPQuants <- table(GDPandEDUCSorted$Income.Group,GDPandEDUCSorted$Quants)
GDPQuants