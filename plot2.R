

powerdatafile<-"./data/household_power_consumption.txt"
powerdata<-read.table(powerdatafile,header = TRUE,na.strings = "?",sep=";",stringsAsFactors = FALSE,dec=".")
# subset to extract data from the dates 2007-02-01 and 2007-02-02
subsetPowerData<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(subsetPowerData$Date,subsetPowerData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subsetPowerData$Global_active_power)
png("plot2.png",width=480,height=480)
plot(datetime,globalActivePower,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()