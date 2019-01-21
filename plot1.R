## created by Rodrigo Careaga
## january 20th, 2019
## plot1.R


## creation and cleaning of the table with data from February 1st, 2007 and February 2nd, 2007
table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
table$Date <- as.Date(table$Date, "%d/%m/%Y")
table <- subset(table,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
table <- table[complete.cases(table),]
dateTime <- paste(table$Date, table$Time)
dateTime <- setNames(dateTime, "DateTime")
table <- table[ ,!(names(table) %in% c("Date","Time"))]
table <- cbind(dateTime, table)
table$dateTime <- as.POSIXct(dateTime)

##Plot of the Frecuency of the Global active Power (kilowatts)
hist(table$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")


## saving the image as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
