## The purpose of this project is to demonstrate ability to plot exploratory analysis
##  This is plot1.R for the second plot

setwd("Coursera/Exploratory Data Analysis/WEEK1")
filename <- "exdata-data-household_power_consumption.zip"

## check if file exists or downloaded before
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename)
}  

## uncompress the file into current folder
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}

## - 'household_power_consumption.txt': 
##
## Date: Date in format dd/mm/yyyy
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
## Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
## Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
##

DATA <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
DATA$Date <- as.Date(DATA$Date, format="%d/%m/%Y")

## SELECT data for specific dates
DATA <- subset(DATA, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## coerce date time to POSIXct standard
datetime <- paste(as.Date(DATA$Date), DATA$Time)
DATA$Datetime <- as.POSIXct(datetime)

## start plotting - Plot 2
plot(DATA$Global_active_power~DATA$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

