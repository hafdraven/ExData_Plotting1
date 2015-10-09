d<-read.csv2("household_power_consumption.txt",dec=".",sep=";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

d$Date<-strptime(paste(d$Date,d$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

d<-d[,-2]

d<-d[as.Date(d$Date) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

hist(d$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red3")