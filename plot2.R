setwd("/Users/jorgelimas/Documents/MOOCs/COURSERA/Data Science (Specialized) -The John Hopkins University/4. Exploratory Data Analysis")

house_electric<-read.table("household_power_consumption.txt",header = T,sep = ";")
house_electric$Date<-as.Date(house_electric$Date,"%d/%m/%Y")
strptime(house_electric$Time,"%H:%M:%S")

electric<-subset(house_electric,Date>="2007-02-01"&Date<"2007-02-03")
electric$Global_active_power<-as.numeric(electric$Global_active_power)
electric$Global_reactive_power<-as.numeric(electric$Global_reactive_power)
electric$Voltage<-as.numeric(electric$Voltage)
electric$Global_intensity<-as.numeric(electric$Global_intensity)
electric$Sub_metering_1<-as.numeric(electric$Sub_metering_1)
electric$Sub_metering_2<-as.numeric(electric$Sub_metering_2)
electric$Sub_metering_3<-as.numeric(electric$Sub_metering_3)
date_time<-as.POSIXct(paste(electric$Date,electric$Time,sep = " "))


plot(electric$Global_active_power~date_time,type = "l",ylab = "Global Active Power (Kilowatts)",xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()