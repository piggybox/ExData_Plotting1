library(data.table)

myData <- fread("household_power_consumption.txt", header=TRUE, sep=";",  na="?")

png(filename = "plot1.png" , width = 480, height = 480, units = "px", bg = "white")

hist(myData_TwoDaysPeriod$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.off()