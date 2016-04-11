#loading reuqired package
require(ggplot2)

#Download and unzip the data
link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(link, "./FNEI_data.zip")
unzip("./FNEI_data.zip")

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate Baltimore City PM2.5 emission, and constructs plot2
test6 <- SCC[grep("[Vv]ehicle", SCC$EI.Sector),][1]
NEIsub6 <- subset(NEI, fips %in% c("24510","06037") & SCC %in% as.character(test6[,1]))
data6 <- aggregate(Emissions ~ fips + year, data=NEIsub6, sum)
png(filename = "plot6.png")
qplot(year, Emissions, data = data6, color=fips, geom = c("line"))
dev.off()