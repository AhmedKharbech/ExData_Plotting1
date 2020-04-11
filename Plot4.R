#download and unzip file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata.zip")
unzip ("exdata.zip")

#getting data
#exdata contains only data between the dates 2007-02-01 and 2007-02-02 as instructed

exdata_all<-read.table("household_power_consumption.txt",sep = ";",header = T,na.strings = "?")

exdata<-exdata_all[exdata_all$Date=="1/2/2007" |exdata_all$Date=="2/2/2007",]

#free some space
rm(exdata_all)

#preparing datetime
exdata$Date<-as.Date(exdata$Date,format="%d/%m/%Y")
exdata$DateTime <- as.POSIXct(paste(exdata$Date, exdata$Time))

#plotting

#preparing 2 rows ad 2 columns for the 4 plots
par(mfcol=c(2,2))

# first plot row 1 col 1
plot(exdata$Global_active_power~exdata$DateTime,ylab ="Global Active Power (kilowatts)",xlab="",type="l" )

# Second plot row 2 col 1
with(exdata,{plot(exdata$Sub_metering_1~exdata$DateTime,col="red",type="l",xlab="",ylab="Energie sub metering")
  
  lines(exdata$Sub_metering_2~exdata$DateTime,col="green",type="l")
  lines(exdata$Sub_metering_3~exdata$DateTime,col="blue",type="l")
  
})
legend("topright",legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("red","green","blue"),lty =1,cex=0.8,xjust = 1)


# third plot row1 col 2
plot(exdata$Voltage~exdata$DateTime,ylab ="Voltage",xlab="datetime",type="l" )

#fourth plot row2 col2

plot(exdata$Global_reactive_power~exdata$DateTime,ylab ="Global_reactive_power",xlab="datetime",type="l" )

dev.copy(png, file="Plot4.png",width=480,height=480)
dev.off()


