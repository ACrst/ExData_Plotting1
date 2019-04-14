

powerdatafile<-"./data/household_power_consumption.txt"
powerdata<-read.table(powerdatafile,header = TRUE,na.strings = "?",sep=";",stringsAsFactors = FALSE,dec=".")
# subset to extract data from the dates 2007-02-01 and 2007-02-02
subsetPowerData<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower<-as.numeric(subsetPowerData$Global_active_power)
png("plot1.png",width=480,height=480)
hist(globalActivePower,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()