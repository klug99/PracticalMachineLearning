
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

library(ggplot2)

#subset Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008
subsetNEI  <- NEI[NEI$fips=="24510", ]
# aggregate() is a very handy function
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/plot3.png", width=640, height=480)
ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))+ geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
dev.off()