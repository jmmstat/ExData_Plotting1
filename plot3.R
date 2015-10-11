#Plot 3
## Load the data
hpc <- read.csv("~/Coursera/DataScientist/Course 4/Week 1/Project1/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

##  Create complete date and time of day variable

hpc$datetime <- paste(hpc$Date,hpc$Time)

## Change the date variable

hpc$Date <- as.Date(strptime(hpc$Date,"%d/%m/%Y"))

##  Restrict to two days: 2007-02-01 and 2007-02-02.

hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

## Construct the graph
##  N.B., Sub_metering_2 is apparently at variance with the assignment. My red line peaks at 14 units
##  while the assignment appears to peak at 2.
##  I can only show that the dataset
##  I downloaded is faithfully reproduced in my submissions:
##  > table(as.numeric(hpc$Sub_metering_2))

##        2    3   14 
##      2305  408  167 

hpc$datetime1 <- timeDate(hpc$datetime,"%d/%m/%Y %H:%M:%S")
with(hpc,{
    plot(datetime1, as.numeric(Sub_metering_1),type = "l",xlab = "",ylab = "Energy sub metering")
    lines(datetime1,as.numeric(hpc$Sub_metering_2),col = "red") 
    lines(datetime1,as.numeric(hpc$Sub_metering_3),col = "blue")
    legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})


dev.copy(png, file = "plot3.png") 
dev.off()
     