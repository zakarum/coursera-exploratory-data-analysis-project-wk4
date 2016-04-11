#loading reuqired package
require(ggplot2)

#Download and unzip the data
link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(link, "./FNEI_data.zip")
unzip("./FNEI_data.zip")

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate Baltimore City PM2.5 emission by type, and constructs plot3
NEIsub2 <- subset(NEI, fips == "24510")
data3 <- aggregate(Emissions ~ type + year, data=NEIsub2, sum)
png(filename = "plot3.png")
qplot(year, Emissions, data = data3, color = type, geom = "line")
dev.off()