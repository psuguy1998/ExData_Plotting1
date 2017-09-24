## PLot2.R
## This R file creates the Plot 2 for the Exploratory Data Analysis Week 1 Assignment
## 

## set the location for the files
location="Exploratory Data Analysis/Assignments/Week 1/"


## open the png device
png(file=paste(location, "Plot2.png", sep=""),width=480,height=480)

## Load the household data
## Note, the data has been subsetted separately, so the file "household_power_consumption_subset.txt" only has Feb 1 and 2 2017
powerdat<-read.table(paste(location, "household_power_consumption_subset.txt", sep=""), header=TRUE, sep=";", stringsAsFactors=FALSE)

## merge the date and time
powerdat$datetime<-strptime(paste(powerdat$Date, powerdat$Time), format="%d/%m/%Y %H:%M:%S") 

## create the line plot

plot(powerdat$datetime, powerdat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")


## close the png graphics device
dev.off()