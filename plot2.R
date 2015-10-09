d<-read.csv2("household_power_consumption.txt",dec=".",sep=";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

d$Date<-strptime(paste(d$Date,d$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

d<-d[,-2]

d<-d[as.Date(d$Date) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

Sys.setlocale("LC_ALL","English")

plot(d$Date,d$Global_active_power,pch="",ylab="Global Active Power (kilowatts)",xlab="", type = "l")

