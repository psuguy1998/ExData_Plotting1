## PLot1.R
## This R file creates the Plot 1 for the Exploratory Data Analysis Week 1 Assignment
## 

## set the location for the files
location="Exploratory Data Analysis/Assignments/Week 1/"

## open the png device
png(file=paste(location, "Plot1.png", sep=""),width=480,height=480)

## Load the household data
## Note, the data has been subsetted separately, so the file "household_power_consumption_subset.txt" only has Feb 1 and 2 2017
powerdat<-read.table(paste(location, "household_power_consumption_subset.txt", sep=""), header=TRUE, sep=";", stringsAsFactors=FALSE)

## create the histogram
hist(powerdat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

## close the png graphics device
dev.off()