setwd("C:/Users/SANDHEEP/Documents/Cousera/EDAproj")

#cleaning the data to plot the histogram
table1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
table1$Date <- as.Date(table1$Date, "%d/%m/%Y")
table1 <- subset(table1,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
table1 <- table1[complete.cases(table1),]
dateTime <- paste(table1$Date, table1$Time)
dateTime <- setNames(dateTime, "DateTime")
table1 <- table1[ ,!(names(table1) %in% c("Date","Time"))]
table1 <- cbind(dateTime, table1)
table1$dateTime <- as.POSIXct(dateTime)

hist(table1$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")