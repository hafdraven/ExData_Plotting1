d<-read.csv2("household_power_consumption.txt",dec=".",sep=";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

d$Date<-strptime(paste(d$Date,d$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

d<-d[,-2]

d<-d[as.Date(d$Date) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

Sys.setlocale("LC_ALL","English")
png("plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))

plot(d$Date,d$Global_active_power,pch="",ylab="Global Active Power",xlab="", type = "l")

plot(d$Date,d$Voltage,pch="",ylab="Voltage",xlab="datetime", type = "l")

plot(d$Date,d$Sub_metering_1,pch="",ylab="Energy sub metering",xlab="", type = "l")

lines(d$Date,d$Sub_metering_2,col="red")
lines(d$Date,d$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd="3", bty="n")

plot(d$Date,d$Global_reactive_power,pch="",ylab="Global_reactive_power",xlab="datetime", type = "l")
dev.off()
