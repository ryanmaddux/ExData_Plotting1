## Question 4: 4 Graphs.  I am not typing this up because I'm too lazy to do that.
## When done, write the file to a PNG File titled "plot4.png"

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

plot_partition$datetime <- as.POSIXct(paste(plot_partition$Date, plot_partition$Time), format="%Y-%m-%d %H:%M:%S")

plot(plot_partition$Time2, plot_partition$globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## PLOT!!!!

## set the number of rows to 2 and the number of columns to 2.  Use mfcol rather than mfrow
## so that we plot by column first.  The reason I'm doing this is laziness: The plots in the first
## column are plot2 and plot3 from this assignment.  Since I'm simply going to copy and paste
## my work from these plots in this assignment, 

par(mfcol=c(2,2))

## Upper Left hand graph (plot 2)

## Create the x,y system without lines using type = "n".  It turns out that the default for this
## Plot will get the labels as specified in the assignment.

with(plot_partition, plot(Time2, Global_active_power, type="n", xlab="",ylab="Global Active Power", cex.lab = .75))

## The lines function with type = "l" will add the lines to the plot.

with(plot_partition, lines(Time2, Global_active_power, type="l"))

## Lower Left hand graph (plot 3)

## Create the x,y system without lines using type = "n".  It turns out that the default for this
## Plot will get the labels as specified in the assignment.

with(plot_partition, plot(Time2, Sub_metering_1, type="n", xlab="",ylab="Energy Sub Metering"), cex.lab = .75)

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

## Upper Right hand graph

with(plot_partition, plot(Time2, Voltage, type="n", xlab="datetime",ylab="Voltage"),cex.lab = .75)

## The lines function with type = "l" will add the lines to the plot.

with(plot_partition, lines(Time2, Voltage, type="l"))

## Upper Right had graph

with(plot_partition, plot(Time2, Global_reactive_power, type="n", xlab="datetime",ylab="Global_reactive_power"), cex.lab=.75)

## The lines function with type = "l" will add the lines to the plot.

with(plot_partition, lines(Time2, Global_reactive_power, type="l"))

## Output the histogram as a png file

dev.copy(png,file = "plot4.png", width = 480, height = 480)

## turn off to create the file

dev.off()
