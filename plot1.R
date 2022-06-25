#Reading the data and subgrouping
power=read.table("household_power_consumption.txt",skip=1,sep = ";")
names(power)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(power)
subgroup=subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
hist(as.numeric(as.character(subgroup$Global_active_power)),col="purple",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

