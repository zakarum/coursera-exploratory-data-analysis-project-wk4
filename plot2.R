#Download and unzip the data
link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(link, "./FNEI_data.zip")
unzip("./FNEI_data.zip")

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate Baltimore City PM2.5 emission, and constructs plot2
NEIsub2 <- subset(NEI, fips == "24510")
data2 <- with(NEIsub2, tapply(Emissions, year, sum, na.rm=TRUE))
png(filename = "plot2.png")
plot(names(data2), data2, xlab = "year", ylab = "Baltimore City PM2.5 Emission")
dev.off()