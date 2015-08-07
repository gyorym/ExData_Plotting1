## Read in data

library("dplyr")
library("plyr")
library("graphics")
library("grDevices")

edaproj2<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

##Limit data to the dates specified

edaproj2a<-filter(edaproj2, edaproj2$Date=="1/2/2007" | edaproj2$Date=="2/2/2007")

##Mutate global active power so it is a numeric

edaproj2b<-mutate(edaproj2a,gap=as.numeric(as.character(edaproj2a$Global_active_power)))

##Plot the data
##Need to adjust xaxis

png(file="plot2.png", height=480, width=480)

plot(edaproj2b$gap, type="l", main="Global Active Power", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
 
dev.off()