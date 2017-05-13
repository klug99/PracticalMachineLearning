NEI <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")
SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]

library(ggplot2)
png("C:/MinseoPark/DataScientistSpecilization/ExploratoryDataAnalysis/Project2/plot4.png", width=640, height=480)
ggplot(NEI.sub, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
dev.off()
