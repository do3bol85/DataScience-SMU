# Merging Data sets by short country code
GDPandEDUC <- merge(Educ, GDP, by.x = "CountryCode", by.y = "Country")

# Sorting data in Ascending order by dollars
GDPandEDUC <- GDPandEDUC[order("MillionsOfUSDollars")]