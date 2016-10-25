# Merging Data sets by short country code
GDPandEDUC <- merge(Educ, GDP, by = "CountryCode")

# Sorting data in Ascending order by dollars
GDPandEDUCSorted <- GDPandEDUC[order(GDPandEDUC$CountryGDP, decreasing = FALSE),]