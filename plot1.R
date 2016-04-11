#Download and unzip the data
link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(link, "./FNEI_data.zip")
unzip("./FNEI_data.zip")

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate the total PM2.5 emissionin US, and constructs plot1
data1 <- with(NEI, tapply(Emissions, year, sum, na.rm=TRUE))
png(filename = "plot1.png")
plot(names(data1), data1, xlab = "year", ylab = "total PM2.5 Emission")
dev.off()