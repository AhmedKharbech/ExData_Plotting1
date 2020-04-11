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


#Plotting


plot(exdata$Global_active_power~exdata$DateTime,ylab ="Global Active Power (kilowatts)",xlab="",type="l" )

dev.copy(png,file="Plot2.png",height=480,width=480)
dev.off()
