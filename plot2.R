path <- "~/Desktop/household_power_consumption.txt" 
data <- read.csv(path, header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")
df <- subset(data, (data$Date=="2007-02-01") | (data$Date=="2007-02-02"))
df <- transform(df, newTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


plot(df$newTime, 
     df$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
