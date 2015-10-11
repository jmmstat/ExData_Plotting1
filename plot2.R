#Plot 2
## Load the data
hpc <- read.csv("~/Coursera/DataScientist/Course 4/Week 1/Project1/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

##  Create complete date and time of day variable

hpc$datetime <- paste(hpc$Date,hpc$Time)

## Change the date variable

hpc$Date <- as.Date(strptime(hpc$Date,"%d/%m/%Y"))

##  Restrict to two days: 2007-02-01 and 2007-02-02.

hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

## Construct the graph

with(hpc, plot(strptime(datetime,"%d/%m/%Y %H:%M:%S"), as.numeric(Global_active_power),type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()
