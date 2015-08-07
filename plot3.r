## Read in data

library("dplyr")
library("plyr")
library("graphics")
library("grDevices")
library("lattice")
library("ggplot2")

edaproj3<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

##Limit data to the dates specified

edaproj3a<-filter(edaproj3, edaproj3$Date=="1/2/2007" | edaproj3$Date=="2/2/2007")

##Mutate so all the sub-metering columns are numbers

edaproj3b<-mutate(edaproj3a,sub1=as.numeric(as.character(edaproj3a$Sub_metering_1)),sub2=as.numeric(as.character(edaproj3a$Sub_metering_2)))

##Create plots

png(file="plot3.png", height=480, width=480)

plot(edaproj3b$sub1,type="l",col="black", xlab="", xaxt="n", ylab="Energy sub metering")
points(edaproj3b$sub2,type="l",col="red")
points(edaproj3b$Sub_metering_3,type="l",col="blue")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="_")

dev.off()