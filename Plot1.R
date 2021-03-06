## reading consumption table  
powerconsumption<- read.csv("C:/Users/sachinderk/Documents/household_power_consumption.txt",sep=";", header=TRUE, as.is=TRUE) 
 
## creating subset, adding a date-time variable and correcting data times 
 
powerconsumption$Date <- as.Date(powerconsumption$Date, format="%d/%m/%Y" ) 
 
 filteredpowerconsumption<- subset(powerconsumption, Date=="2007-02-01" | Date=="2007-02-02" ) 
 filteredpowerconsumption$DateTime <- as.POSIXct(strptime(paste(as.character(filteredpowerconsumption$Date),as.character(filteredpowerconsumption$Time) ), "%Y-%m-%d %H:%M:%S")) 
 filteredpowerconsumption$Global_active_power<- as.numeric(filteredpowerconsumption$Global_active_power) 
 filteredpowerconsumption$Sub_metering_1 <- as.numeric(filteredpowerconsumption$Sub_metering_1) 
 filteredpowerconsumption$Sub_metering_2 <- as.numeric(filteredpowerconsumption$Sub_metering_2) 
 filteredpowerconsumption$Sub_metering_3 <- as.numeric(filteredpowerconsumption$Sub_metering_3) 
 filteredpowerconsumption$Voltage <- as.numeric(filteredpowerconsumption$Voltage) 
 
## Plotting histogram 
png(filename='Plot1.png',width=480,height=480,units='px') 
  
 hist(filteredpowerconsumption$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red') 
 
 
 # Close off graphic device 
 x<-dev.off() 