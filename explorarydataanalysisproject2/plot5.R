NEI <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")
##SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
##NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]

baltimore_cars  <- NEI[NEI$fips=="24510" & NEI$type == "ON-ROAD", ]
aggregatedTotalByYear_baltimore_cars <- aggregate(Emissions ~ year, baltimore_cars, sum)

library(ggplot2)
png("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/plot5.png")
ggplot(aggregatedTotalByYear_baltimore_cars, aes(factor(year), Emissions))+ geom_bar(stat="identity")+xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
dev.off()
