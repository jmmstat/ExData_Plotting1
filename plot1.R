#Plot 1
## Load the data
hpc <- read.csv("~/Coursera/DataScientist/Course 4/Week 1/Project1/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

## Change the date variable

hpc$Date <- as.Date(strptime(hpc$Date,"%d/%m/%Y"))

##  Restrict to two days: 2007-02-01 and 2007-02-02.

hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

## Construct the graph

hist(as.numeric(hpc$Global_active_power),col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)",yaxp = c(0,1200,6))

dev.copy(png, file = "plot1.png")
dev.off()
