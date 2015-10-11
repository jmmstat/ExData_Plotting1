#Plot 4
## Load the data
hpc <- read.csv("~/Coursera/DataScientist/Course 4/Week 1/Project1/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

##  Create complete date and time of day variable

hpc$datetime <- paste(hpc$Date,hpc$Time)

## Change the date variable

hpc$Date <- as.Date(strptime(hpc$Date,"%d/%m/%Y"))

##  Restrict to two days: 2007-02-01 and 2007-02-02.

hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

## Construct the graph(s)

par(mfrow = c(2,2))
     
     # plot 1,1
     with(hpc, plot(strptime(datetime,"%d/%m/%Y %H:%M:%S"), as.numeric(Global_active_power),type = "l", xlab = "", ylab = "Global Active Power"))


     #plot 1,2
     plot(strptime(hpc$datetime,"%d/%m/%Y %H:%M:%S"), as.numeric(hpc$Voltage), type = "l", ylab = "Voltage", xlab = "datetime")
     
     #plot 2,1
      hpc$datetime1 <- timeDate(hpc$datetime,"%d/%m/%Y %H:%M:%S")
      with(hpc,{
      plot(datetime1, as.numeric(Sub_metering_1),type = "l",xlab = "",ylab = "Energy sub metering")
      lines(datetime1,as.numeric(Sub_metering_2),col = "red") 
      lines(datetime1,as.numeric(Sub_metering_3),col = "blue")
      legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex = 0.5)
})

     
     #plot 2,2    
     plot(strptime(hpc$datetime,"%d/%m/%Y %H:%M:%S"),as.numeric(hpc$Global_reactive_power),type = "l",xlab = "datetime",ylab = "Global Reactive Power")


dev.copy(png, file = "plot4.png")
dev.off()

par(mfrow = c(1,1))
