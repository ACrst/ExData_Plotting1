



powerdatafile<-"./data/household_power_consumption.txt"
powerdata<-read.table(powerdatafile,header = TRUE,na.strings = "?",sep=";",stringsAsFactors = FALSE,dec=".")
# subset to extract data from the dates 2007-02-01 and 2007-02-02
subsetPowerData<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(subsetPowerData$Date,subsetPowerData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subsetPowerData$Global_active_power)
submetering1<-as.numeric(subsetPowerData$Sub_metering_1)
submetering2<-as.numeric(subsetPowerData$Sub_metering_2)
  submetering3<-as.numeric(subsetPowerData$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(datetime,submetering1,ylab="Energy sub metering",xlab="",type="l")
lines(datetime,submetering2,col="red",type="l")
lines(datetime,submetering3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
dev.off()