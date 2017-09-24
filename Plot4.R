## PLot4.R
## This R file creates the Plot 4 for the Exploratory Data Analysis Week 1 Assignment
## 

## set the location for the files
location="Exploratory Data Analysis/Assignments/Week 1/"


## open the png device
png(file=paste(location, "Plot4.png", sep=""),width=480,height=480)

## Load the household data
## Note, the data has been subsetted separately, so the file "household_power_consumption_subset.txt" only has Feb 1 and 2 2017
powerdat<-read.table(paste(location, "household_power_consumption_subset.txt", sep=""), header=TRUE, sep=";", stringsAsFactors=FALSE)

## merge the date and time
powerdat$datetime<-strptime(paste(powerdat$Date, powerdat$Time), format="%d/%m/%Y %H:%M:%S") 

## setup for 4 plots in a grid - left margins the same
par(mfrow=c(2,2))

## create the 4 plots
## upper left plot shows Global Active Power vs. Time
plot(powerdat$datetime, powerdat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## upper right plot shows Voltage vs. Time
plot(powerdat$datetime, powerdat$Voltage, type="l", ylab="Voltage", xlab="datetime")

## lower left plot shows sub metering vs. Time
with (powerdat,{
  plot(datetime, Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  })

## lower right plot shows Global Reactive Power vs. datetime
plot(powerdat$datetime, powerdat$Global_reactive_power, type="l", ylab="global_reactive_power", xlab="datetime")


## close the png graphics device
dev.off()