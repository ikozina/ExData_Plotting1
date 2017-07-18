# Load "Individual household electric power consumption Data Set"
epc_orig <- read.csv("data/household_power_consumption.txt", sep=";", dec = ".", na.strings = "?")

# select 2-day period in February, 2007
epc <- subset(epc_orig, Date == "1/2/2007" | Date == "2/2/2007")

# transform to POSIXlt type
epc$datetime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

# open PNG graphical device
png(filename="plot1.png", width = 480, height = 480, units = "px")

# show histogram
hist(epc$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# close graphical device
dev.off()