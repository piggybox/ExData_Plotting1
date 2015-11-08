library(data.table)

myData <- fread("household_power_consumption.txt", header=TRUE, sep=";",  na="?")

StartDate         <- "2007-02-01"
EndDate           <- "2007-02-02"
FormatDate        <- "%d/%m/%Y"
FormatDateTime    <- "%Y-%m-%d %H:%M:%S"

myData$Date <- as.Date(myData$Date, format=FormatDate)
myData_TwoDaysPeriod <-  myData[myData$Date >= StartDate & myData$Date <= EndDate]
myData_TwoDaysPeriod <-  data.frame(myData_TwoDaysPeriod)

myData_TwoDaysPeriod$DateTime <- paste(myData_TwoDaysPeriod$Date, myData_TwoDaysPeriod$Time)
myData_TwoDaysPeriod$DateTime <- strptime(myData_TwoDaysPeriod$DateTime, format = FormatDateTime)

png(filename = "plot4.png" , width = 480, height = 480, units = "px", bg = "white")

par(mfrow=c(2,2)) # 2x2

# 1
plot(myData_TwoDaysPeriod$DateTime, myData_TwoDaysPeriod$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# 2
plot(myData_TwoDaysPeriod$DateTime, myData_TwoDaysPeriod$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# 3
plot(myData_TwoDaysPeriod$DateTime, myData_TwoDaysPeriod$Sub_metering_1, col = "black",
     type="l",
     xlab="",
     ylab="Energy sub meterning")

lines(myData_TwoDaysPeriod$DateTime, myData_TwoDaysPeriod$Sub_metering_2, col="red")
lines(myData_TwoDaysPeriod$DateTime, myData_TwoDaysPeriod$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), c("Sub_metering_1", 
                                                   "Sub_metering_2", "Sub_metering_3"), lty=1)

# 4
plot(myData_TwoDaysPeriod$DateTime, myData_TwoDaysPeriod$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(myData_TwoDaysPeriod$DateTime, myData_TwoDaysPeriod$Global_reactive_power)

dev.off()

