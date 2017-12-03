##
## Exploratory data analysis: Assignement 1 plotting
## plot4.R

## 
## read data
##
wd <- normalizePath(getwd(),winslash='\\',mustWork = NA)
localFile <- paste0(wd,"\\household_power_consumption.txt")
hpc <- read.table(localFile,header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
hpc_sub <- subset(hpc, (as.Date(Date,"%d/%m/%Y") == "2007-02-02") |
                       (as.Date(Date,"%d/%m/%Y") == "2007-02-01"))



##
## Plot4.R
##
par(mfrow=c(2,2))
hpc_sub$Date <- as.Date(hpc_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc_sub$Date), hpc_sub$Time)
hpc_sub$Datetime <- as.POSIXct(datetime)
with(hpc_sub,{
  ## 1,1- Global Active power
  plot(Global_active_power~Datetime,type = "l",ylab = "Global Active Power",xlab = "")
  ## 1,2 Voltge
  plot(Voltage~Datetime, type = "l",ylab = "Voltage",xlab = "datetime")
  ## 2,1 - Sub_metering
  plot(Sub_metering_1~Datetime,type = "l",ylab = "Energy Sub Metering",xlab = "",col="black")
  points(Sub_metering_2~Datetime,type = "l",ylab = "Energy Sub Metering",xlab = "",col="red")
  points(Sub_metering_3~Datetime,type = "l",ylab = "Energy Sub Metering",xlab = "",col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),border="",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  ## 2,2 Global reactive power
  plot(Global_reactive_power~Datetime,type = "l",ylab = "Global Reactive Power",xlab = "datetime")
  })
par(mfrow=c(1,1))
dev.copy(png,file="plot4.png")
dev.off()
