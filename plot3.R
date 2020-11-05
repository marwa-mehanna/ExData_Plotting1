household_power<- read.table("../household_power_consumption.txt", header = TRUE, sep=";",na.strings ="?")
household_power$DateTime <- strptime(paste(household_power$Date, household_power$Time), 
                                     "%d/%m/%Y %H:%M:%S")
RD <- subset(household_power, 
             as.Date(DateTime) >= as.Date("2007-02-01") & 
               as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot3.png", height=480, width=480)
plot(RD$DateTime, RD$Sub_metering_1,pch=NA,xlab="", ylab="Energy sub metering")
lines(RD$DateTime, RD$Sub_metering_1,col ="black")
lines(RD$DateTime, RD$Sub_metering_2,col ="red")
lines(RD$DateTime, RD$Sub_metering_3,col ="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col= c("black","red","blue")
)
dev.off() 