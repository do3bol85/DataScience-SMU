#1 - Merge the data based on the country shortcode. How many of the IDs match?
# Merging Data sets by short country code
GDPandEDUC <- merge(Educ, GDP, by = "CountryCode")

#2 - Sort the data frame in ascending order by GDP (so United States is last). What is the 13th country in the resulting data frame?
# Sorting data in Ascending order by dollars
GDPandEDUCSorted <- GDPandEDUC[order(GDPandEDUC$CountryGDP, decreasing = FALSE),]

