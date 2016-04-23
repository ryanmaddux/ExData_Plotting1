## Question 2: Produce a graph that plots "Global Active Power (kilowatts)" (y-axis)
## by time (y-axis) of the observation.  The line color is black.  The graph has no
## title.  The y-axis is labeled "Global Active Power (kilowatts)" and the x-axis has 
## no label.  The ticks on the y axis are at c(0,2,4,6).  The ticks on the x axis
## are labeled c("Thu","Fri","Sat")
## When done, write the file to a PNG File titled "plot2.png"

## Set Working Directory

setwd("C:/Users/Ryan/Coursera/Exploratory_Data_Analysis/Week_1")

## Read in the data using fread function

mydata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")

## Convert the date factor to a date type

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

## Subset data to just look at data between 2007-02-01 and 2007-02-02

plot_partition <- subset(mydata,  Date == '2007-02-01' | Date == '2007-02-02')

## Convert the time from a factor to a time variable

plot_partition$Time <- strptime(plot_partition$Time, format = "%H:%M:%S")

## note: the above created a time, but the time is based on today's date.  This is not good.
## Use paste within as.POSITCct to combine into one date.

plot_partition$Time2 <- as.POSIXct(paste(plot_partition$Date, plot_partition$Time), format="%Y-%m-%d %H:%M:%S")

## PLOT!!!!

## Create the x,y system without lines using type = "n".  It turns out that the default for this
## Plot will get the labels as specified in the assignment.

with(plot_partition, plot(Time2, Global_active_power, type="n", xlab="",ylab="Global Active Power (kilowatts)"))

## The lines function with type = "l" will add the lines to the plot.

with(plot_partition, lines(Time2, Global_active_power, type="l"))

## Output the histogram as a png file

dev.copy(png,file = "plot2.png")

## turn off to create the file

dev.off()