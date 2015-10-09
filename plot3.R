#Plot 3
data=read.table("C:/Yohannes/Coursera/Exploratory data analysis/data/household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE)
data$Date=as.Date(data$Date, format="%d/%m/%Y")
data2=data[data$Date=='2007-02-01'|data$Date=='2007-02-02',]
data2$date_time <- with(data2, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))
with(data2, plot(data2$date_time, data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(data2$date_time, data2$Sub_metering_2, col="red")
lines(data2$date_time, data2$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"),cex=0.8,legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

dev.copy(png,'C:/Yohannes/Coursera/Exploratory data analysis/Peer Assignment 1/plot3.png', width = 480, height = 480)

dev.off()
