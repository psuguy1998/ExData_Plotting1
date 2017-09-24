## PLot3.R
## This R file creates the Plot 3 for the Exploratory Data Analysis Week 1 Assignment
## 

## set the location for the files
location="Exploratory Data Analysis/Assignments/Week 1/"


## open the png device
png(file=paste(location, "Plot3.png", sep=""),width=480,height=480)

## Load the household data
## Note, the data has been subsetted separately, so the file "household_power_consumption_subset.txt" only has Feb 1 and 2 2017
powerdat<-read.table(paste(location, "household_power_consumption_subset.txt", sep=""), header=TRUE, sep=";", stringsAsFactors=FALSE)

## merge the date and time
powerdat$datetime<-strptime(paste(powerdat$Date, powerdat$Time), format="%d/%m/%Y %H:%M:%S") 

## create the multiple line plot

plot(powerdat$datetime, powerdat$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
with(powerdat, lines(datetime, Sub_metering_2, col="red"))
with(powerdat, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## close the png graphics device
dev.off()