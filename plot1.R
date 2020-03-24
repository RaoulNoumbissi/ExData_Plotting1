#read data from household_power_consumption.txt for the dates 2007-02-01 and 2007-02-02
household_power_consumption<-read.table("household_power_consumption.txt",header = TRUE,sep =";", dec =".")
Two_day_household_power_consumption<-subset(household_power_consumption,Date=="1/2/2007" | Date=="2/2/2007")

#Open png device 
png("polt1.png",width=480,height = 480)

#The histogram
hist(as.numeric(as.character(Two_day_household_power_consumption$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#close png device
dev.off()