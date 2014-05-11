setwd("C:\\Users\\George\\R\\ExploratoryDataAnalysis\\ExData_Plotting1")

############################## READ AND PROCESS DATA ################################
power <- read.table("./household_power_consumption.txt", header =TRUE, sep = ";",
                    stringsAsFactors = FALSE)

### Create 'datetime' column
power$datetime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

### Convert 'Date' column to Date class
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

### Select subset to be graphed
a <- as.Date("2007-02-01")
b <- as.Date("2007-02-02")
powData <- power[power$Date == a | power$Date == b,]


############################### PLOT 3 ##############################################
plot(powData$datetime, powData$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "")

par(new=T)   ### retains graph so next graph is printed over it
plot(powData$datetime, powData$Sub_metering_2, type = "l", col = "red", axes = F,
     ylim = c(0,40), ylab = "", xlab = "")

par(new=T)   ### retains graph so next graph is printed over it
plot(powData$datetime, powData$Sub_metering_3, type = "l", col = "blue", axes = F,
     ylim = c(0,40),ylab = "", xlab = "")

legend("topright", legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),
       lty = 1, col = c("black", "red", "blue"), cex = 0.8)

### Save as PNG
dev.copy(png, file = "./plot3.png", width = 480, height = 480)
dev.off()
