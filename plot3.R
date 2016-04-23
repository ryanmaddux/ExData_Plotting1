## Question 3: Produce a graph that plots "Energy Sub Metering" (y-axis)
## by time (y-axis) of the observation.  The graph has no
## title.  The y-axis is labeld "Energy sub metering" and the x-axis has 
## no label.  The ticks on the y axis are at c(0,10,20,30).  The ticks on the x axis
## are labeled c("Thu","Fri","Sat").  Three lines are plotted: Submetering 1 in black
## Submetering 2 in red and Subetering 3 in green.  In the upper right hand corner of
## the plot, there is boxed legend that has 
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

## Create the x,y system without lines using type = "n".  It turns out that the default for this
## Plot will get the labels as specified in the assignment.

with(plot_partition, plot(Time2, Sub_metering_1, type="n", xlab="",ylab="Energy Sub Metering"))

## The lines function with type = "l" will add the lines to the plot.
## plot Time 2 v. Sub_metering_1

with(plot_partition, lines(Time2, Sub_metering_1, type="l"))

## The lines function with type = "l" will add the lines to the plot.
## Plot Time 2 v. Sub_metering_2.  Specify a new color (red, in this case) 
## or R will use Black agan.

with(plot_partition, lines(Time2, Sub_metering_2, type="l", col="red"))

## The lines function with type = "l" will add the lines to the plot.
## Plot Time 2 v. Sub_metering_3.  Specify a new color (green) or R will use Black agan.

with(plot_partition, lines(Time2, Sub_metering_3, type="l", col="blue"))

## Legend creates the legend for this graph
## lty=c(1,1) will plot lines (thanks, iternet!)
## must specify the legend labels and the legend colors
## Change the spacing to match the example (cex = .75)

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col = c("black", "red", "blue"), cex=.75)

## Output the histogram as a png file

dev.copy(png,file = "plot3.png")

## turn off to create the file

dev.off()
