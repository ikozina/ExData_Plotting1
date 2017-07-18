# Load "Individual household electric power consumption Data Set"
epc_orig <- read.csv("data/household_power_consumption.txt", sep=";", dec = ".", na.strings = "?")

# select 2-day period in February, 2007
epc <- subset(epc_orig, Date == "1/2/2007" | Date == "2/2/2007")

# transform to POSIXlt type
epc$datetime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

# open PNG graphical device
png(filename="plot3.png", width = 480, height = 480, units = "px")

# First energy sub-metering for plotting
epc_sub1 <- epc[, c("datetime", "Sub_metering_1")]
names(epc_sub1) <- c("datetime", "Sub_metering")
epc_sub1$no <- 1
# First energy sub-metering for plotting
epc_sub2 <- epc[, c("datetime", "Sub_metering_2")]
names(epc_sub2) <- c("datetime", "Sub_metering")
epc_sub2$no <- 2
# First energy sub-metering for plotting
epc_sub3 <- epc[, c("datetime", "Sub_metering_3")]
names(epc_sub3) <- c("datetime", "Sub_metering")
epc_sub3$no <- 3

# bind all sub_metering
epc_submet <- rbind(epc_sub1, epc_sub2, epc_sub3)

# Initialise plot
with(epc_submet, plot(datetime, Sub_metering, xlab = "", ylab = "Energy sub metering", type = "n"))
# first plot
with(subset(epc_submet, no == 1), lines(datetime, Sub_metering, type = "l", col = "black"))
# second plot
with(subset(epc_submet, no == 2), lines(datetime, Sub_metering, type = "l", col = "red"))
# third plot
with(subset(epc_submet, no == 3), lines(datetime, Sub_metering, type = "l", col = "blue"))

# adding legend to plot
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close graphical device
dev.off()