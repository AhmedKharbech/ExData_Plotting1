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
    
    with(exdata,{plot(exdata$Sub_metering_1~exdata$DateTime,col="red",type="l",xlab="",ylab="Energie sub metering")
                    
                 lines(exdata$Sub_metering_2~exdata$DateTime,col="green",type="l")
                 lines(exdata$Sub_metering_3~exdata$DateTime,col="blue",type="l")
         
         })
    legend("topright",legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("red","green","blue"),lty =1,cex=0.8,xjust = 1)
    dev.copy(png,file="Plot3.png", height=480,width=480)
    dev.off()
    
    