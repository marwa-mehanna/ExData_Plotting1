household_power<- read.table("../household_power_consumption.txt", header = TRUE, sep=";",na.strings ="?")
household_power$DateTime <- strptime(paste(household_power$Date, household_power$Time), 
                                     "%d/%m/%Y %H:%M:%S")
RD <- subset(household_power, 
             as.Date(DateTime) >= as.Date("2007-02-01") & 
               as.Date(DateTime) <= as.Date("2007-02-02"))
RD$Global_active_power <- as.numeric(RD$Global_active_power)

png("plot1.png", height=480, width=480)

 hist(RD$Global_active_power ,col="red",
      xlab = "Global Active Power (kilowatts)",
      main = "Global Active Power")
 dev.off()