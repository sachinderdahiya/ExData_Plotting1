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
## dividing graph in four parts
par(mfrow = c(2,2),bg = 'white')

## top left quadrent
plot( filteredpowerconsumption$DateTime, filteredpowerconsumption$Global_active_power, type ='l', xlab="", ylab="Global Active Power (kilowatts)") 
## top right quadrent
plot( filteredpowerconsumption$DateTime, filteredpowerconsumption$Voltage, type ='l', xlab="datetime", ylab="Voltage")
## bottom left quadrent
 lncol<-c('black','red','blue') 
 lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3') 
 plot(filteredpowerconsumption$DateTime,filteredpowerconsumption$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering') 
 lines(filteredpowerconsumption$DateTime,filteredpowerconsumption$Sub_metering_2,col=lncol[2]) 
 lines(filteredpowerconsumption$DateTime,filteredpowerconsumption$Sub_metering_3,col=lncol[3]) 
 legend("topright", lty=1, lwd=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5, bty="n" )
 
## bottom right quadrent
plot( filteredpowerconsumption$DateTime, filteredpowerconsumption$Global_reactive_power, type ='l', xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "Plot4.png", width = 480, height = 480)
## Close off graphic device 
x<-dev.off()