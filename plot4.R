data=read.table("C:/Yohannes/Coursera/Exploratory data analysis/data/household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE)
data$Date=as.Date(data$Date, format="%d/%m/%Y")
data2=data[data$Date=='2007-02-01'|data$Date=='2007-02-02',]
data2$date_time <- with(data2, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))

data2$Global_active_power=as.numeric(data2$Global_active_power)
data2$Global_reactive_power=as.numeric(data2$Global_reactive_power)
par(mfrow=c(2,2))

#png(file="C:/Yohannes/Coursera/Exploratory data analysis/Peer Assignment 1/plot4.png",width=480,height = 480)
plot(data2$date_time, data2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data2$date_time, data2$Voltage, type="l", xlab="datetime", ylab="voltage")

with(data2, plot(data2$date_time, data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",cex.lab=0.7, cex.axis=0.8))
lines(data2$date_time, data2$Sub_metering_2, col="red")
lines(data2$date_time, data2$Sub_metering_3,col="blue")
legend("topright", legend=c("sub_metering_1","sub_metering_2","sub_metering_3",lty=c(1,1,1), col=c("black","red","blue"),cex=0.7,bty="n"))

plot(data2$date_time, data2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,'C:/Yohannes/Coursera/Exploratory data analysis/Peer Assignment 1/plot4.png', width = 480, height = 480)
dev.off()
