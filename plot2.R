#read data from household_power_consumption.txt for the dates 2007-02-01 and 2007-02-02
household_power_consumption<-read.table("household_power_consumption.txt",header = TRUE,sep =";", dec =".")
Two_day_household_power_consumption<-subset(household_power_consumption,Date=="1/2/2007" | Date=="2/2/2007")


#Open png device 
png("polt2.png",width=480,height = 480)


#creating a dateTime vector
dateTime<-paste(Two_day_household_power_consumption$Date,Two_day_household_power_consumption$Time)
dateTime<-strptime(dateTime,format="%d/%m/%Y %H:%M:%S")

#The graph
plot(dateTime,as.numeric(as.character(Two_day_household_power_consumption$Global_active_power)),type = "l",ylab="Global Active Power (kilowatts)",xlab="")

#close png device
dev.off()