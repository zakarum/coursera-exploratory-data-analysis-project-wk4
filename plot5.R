#Download and unzip the data
link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(link, "./FNEI_data.zip")
unzip("./FNEI_data.zip")

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate Baltimore City vehicle source PM2.5 emission, and constructs plot5
test5 <- SCC[grep("[Vv]ehicle", SCC$EI.Sector),][1]
NEIsub5 <- filter(NEI, fips == "24510" & SCC %in% as.character(test5[,1]))
data5 <- tapply(NEIsub5$Emissions, NEIsub5$year, sum, na.rm=TRUE)
png(filename = "plot5.png")
plot(names(data5), data5, xlab = "year", ylab = "Baltimore Vehicle PM2.5")
dev.off()