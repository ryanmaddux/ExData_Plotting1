## Question 1: Produce a histogram for "Global Active Power (kilowatts)" (x-axis)
## The bars in the graphy should be Red
## with black trim.  The table should have a bold title "Global Active Power".
## When done, write the file to a PNG File

## Set Working Directory

setwd("C:/Users/Ryan/Coursera/Exploratory_Data_Analysis/Week_1")

## Read in the data using fread function

mydata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")

## Convert the date factor to a date type

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

## Subset data to just look at data between 2007-02-01 and 2007-02-02

plot_partition <- subset(mydata,  Date == '2007-02-01' | Date == '2007-02-02')

## create the histogram.  The variable of interest is plot_partition$Global_active_power
## Have color = "red", apply xlab = xlab="Global Active Power (kilowatts)"

hist(plot_partition$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Output the histogram as a png file

dev.copy(png,file = "plot1.png", width = 480, height = 480)

## turn off to create the file

dev.off()