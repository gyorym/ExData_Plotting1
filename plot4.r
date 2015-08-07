## Read in data

library("dplyr")
library("plyr")
library("graphics")
library("grDevices")
library("lattice")
library("ggplot2")

edaproj4<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

##Limit data to the dates specified

edaproj4a<-filter(edaproj4, edaproj4$Date=="1/2/2007" | edaproj4$Date=="2/2/2007")

##Mutate so all the sub-metering columns are numbers

edaproj4b<-mutate(edaproj4a,sub1=as.numeric(as.character(edaproj4a$Sub_metering_1)),sub2=as.numeric(as.character(edaproj4a$Sub_metering_2)), gap=as.numeric(as.character(edaproj4a$Global_active_power)), volt=as.numeric(as.character(edaproj4a$Voltage)),rap=as.numeric(as.character(edaproj4a$Global_reactive_power)))

png(file="plot4.png", height=480, width=480)

par(mfrow=c(2,2))
plot(edaproj4b$gap, type="l", ylab="Global Active Power", xlab="", xaxt="n")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
plot(edaproj4b$volt,type="l",ylab="Voltage",xlab="datetime",xaxt="n")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
plot(edaproj4b$sub1,type="l",col="black", xlab="", xaxt="n", ylab="Energy sub metering")
points(edaproj4b$sub2,type="l",col="red")
points(edaproj4b$Sub_metering_3,type="l",col="blue")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="_", cex=.5, bty="n")
plot(edaproj4b$rap,type="l",ylab="Global_reactive_power",xlab="datetime",xaxt="n")
axis(1, at=c(0,1440,2880), labels = c("Thu","Fri","Sat"))

dev.off()