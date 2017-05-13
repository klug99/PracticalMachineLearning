NEI <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")
##SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
##NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]
colnames(output) <- c("Year", "Location", "Emissions")

baltimore_la_cars <- subset(NEI, fips%in%c("24510","06037") & type == "ON-ROAD", select=c(fips, year, Emissions))
output <- aggregate(baltimore_la_cars$Emissions, by = list(Year = baltimore_la_cars$year, Locale = baltimore_la_cars$fips), FUN = sum)
colnames(output) <- c("Year", "Location", "Emissions")

## change from fips to something more human-readable
output$Location <- gsub("24510","Baltimore",output$Location)
output$Location <- gsub("06037","LA County",output$Location)
output$Location <- factor(output$Location)


# the mean for each Location
output$mean <- ave(output$Emissions, output$Location, FUN=mean)

## Emissions isn't a great measurement to plot because the absolute values are so different
output$Normalised <- output$Emissions/output$mean

library(ggplot2)
png("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/plot6.png")
ggplot(output, aes(factor(Year), Emissions)) + geom_bar(stat="identity", aes(colour=Location)) + facet_grid(Location ~ ., scales="free_y") + geom_smooth(method="lm")+ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
dev.off()
