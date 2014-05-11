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


############################### PLOT 2 ##############################################
plot(powData$datetime, powData$Global_active_power,type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

### Save as PNG
dev.copy(png, file = "./plot2.png", width = 480, height = 480)
dev.off()
