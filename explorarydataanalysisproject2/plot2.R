NEI <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")
# aggregate() is a very handy function
##aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)
#subset Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
##Screen Display
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
##Dispaly plot2. png
png('C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()