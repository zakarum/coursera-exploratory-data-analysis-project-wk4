#Download and unzip the data
link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(link, "./FNEI_data.zip")
unzip("./FNEI_data.zip")

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate 2 cites vehicle source PM2.5 change ratio, and create plot6
test6 <- SCC[grep("[Vv]ehicle", SCC$EI.Sector),][1]
NEIsub6_24510 <- subset(NEI, fips == "24510" & SCC %in% as.character(test6[,1]))
NEIsub6_06037 <- subset(NEI, fips == "06037" & SCC %in% as.character(test6[,1]))
data6_24510 <- aggregate(Emissions ~  year, data=NEIsub6_24510, sum)
data6_06037 <- aggregate(Emissions ~  year, data=NEIsub6_06037, sum)
data6_24510$ChangeRatio <- data6_24510$Emissions/data6_24510[data6_24510$year == sort(data6_24510$year)[1],"Emissions"]
data6_06037$ChangeRatio <- data6_06037$Emissions/data6_06037[data6_06037$year == sort(data6_06037$year)[1],"Emissions"]
rng <- range(data6_24510$ChangeRatio, data6_06037$ChangeRatio)
png(filename = "plot6.png")
plot(as.character(data6_24510$year), data6_24510$ChangeRatio, xlab="year", ylab="Vehicle PM2.5 Change Ratio", ylim = rng, type = "l", lwd=2, col="red")
points(as.character(data6_06037$year), data6_06037$ChangeRatio, ylim=rng, type="l", lwd=2, co="blue")
legend("bottom", legend = c("Baltimore", "LA County"), ncol=2, col=c("red","blue"), cex=0.8, lwd=2)
dev.off()