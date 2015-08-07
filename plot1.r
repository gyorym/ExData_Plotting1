## Read in data

library("dplyr")
library("plyr")
library("graphics")
library("grDevices")

edaproj1<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

##Limit data to the dates specified

edaproj1a<-filter(edaproj1, edaproj1$Date=="1/2/2007" | edaproj1$Date=="2/2/2007")

##Mutate global active power so it is a numeric

edaproj1b<-mutate(edaproj1a,gap=as.numeric(as.character(edaproj1a$Global_active_power)))

##Create histogram and label axes

hist(edaproj1b$gap,col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")

png(file="plot1.png",width=480, height=480)
