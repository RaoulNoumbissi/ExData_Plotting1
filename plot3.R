#read data from household_power_consumption.txt for the dates 2007-02-01 and 2007-02-02
household_power_consumption<-read.table("household_power_consumption.txt",header = TRUE,sep =";", dec =".")
Two_day_household_power_consumption<-subset(household_power_consumption,Date=="1/2/2007" | Date=="2/2/2007")

#Open png device 
png("polt3.png",width=480,height = 480)

#creating a new date vector
date<-rep(0,length(Two_day_household_power_consumption$Date))
date[Two_day_household_power_consumption$Date=="1/2/2007"]="1/2/07"
date[Two_day_household_power_consumption$Date=="2/2/2007"]="2/2/07"

#creating a dateTime vector
dateTime<-paste(date,Two_day_household_power_consumption$Time)
dateTime<-strptime(new,format="%d/%m/%y %H:%M:%S")

#The graph sub metering 1
plot(dateTime,as.numeric(as.character(Two_day_household_power_consumption$Sub_metering_1)),type = "l",ylab="Energy sub metering",xlab="")

#The graph sub metering 2
points(dateTime,as.numeric(as.character(Two_day_household_power_consumption$Sub_metering_2)),type = "l",ylab="Energy sub metering",xlab="",col="red")

#The graph sub metering 3
points(dateTime,as.numeric(as.character(Two_day_household_power_consumption$Sub_metering_3)),type = "l",ylab="Energy sub metering",xlab="",col="blue")

#add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = "solid")
#close png device
dev.off()