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

with (table1, {
        plot(table1$Sub_metering_1~table1$dateTime, type="l", ylab="Energy sub metering", xlab="")
        lines(table1$Sub_metering_2~table1$dateTime, col = "Red")
        lines(table1$Sub_metering_3~table1$dateTime, col = "Blue")
}
)

legend("topright",legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty = 1, col = c("Black", "Red", "Blue"))