#Download and unzip the data
link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(link, "./FNEI_data.zip")
unzip("./FNEI_data.zip")

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get coal combustion-related sources code
coalcode <- SCC[grep("Fuel Comb - .* - Coal", SCC$EI.Sector),][1]

#Creates the plot file
test4 <- SCC[grep("Fuel Comb - .* - Coal", SCC$EI.Sector),][1]
NEIsub4 <- subset(NEI, SCC %in% as.character(test4[,1]))
data4 <- tapply(NEIsub4$Emissions, NEIsub4$year, sum, na.rm=TRUE)
png(filename = "plot4.png")
plot(names(data4), data4, xlab = "year", ylab = "Coal Comb PM2.5 Emission")
dev.off()