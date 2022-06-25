#Reading the data and subgrouping
power=read.table("household_power_consumption.txt",skip=1,sep = ";")
names(power)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(power)
subgroup=subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subgroup$Date=as.Date(subgroup$Date, format="%d/%m/%Y")
subgroup$Time=strptime(subgroup$Time, format="%H:%M:%S")
subgroup[1:1440,"Time"]=format(subgroup[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subgroup[1441:2880,"Time"]=format(subgroup[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# plotting the graph
plot(subgroup$Time,as.numeric(as.character(subgroup$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")
# calling the basic plot function
plot(subgroup$Time,as.numeric(as.character(subgroup$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")
