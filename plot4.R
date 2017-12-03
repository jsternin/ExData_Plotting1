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
z <- 1:2880 # 2 days  by minute
with(hpc_sub,{
  ## 1,1- Global Active power
  plot(z ,Global_active_power,type = "l",ylab = "Global Active Power",xlab = "",xaxt="n")
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
  ## 1,2 Voltge
  plot(z ,Voltage, type = "l",ylab = "Voltage",xlab = "datetime",xaxt="n")
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
  ## 2,1 - Sub_metering
  plot(z ,Sub_metering_1,type = "l",ylab = "Energy Sub Metering",xlab = "",xaxt="n",col="black")
  points(z ,Sub_metering_2,type = "l",ylab = "Energy Sub Metering",xlab = "",xaxt="n",col="red")
  points(z ,Sub_metering_3,type = "l",ylab = "Energy Sub Metering",xlab = "",xaxt="n",col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),border="",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
  ## 2,2 Global reactive power
  plot(z ,Global_reactive_power,type = "l",ylab = "Global Reactive Power",xlab = "datetime",xaxt="n")
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
})
par(mfrow=c(1,1))
dev.copy(png,file="plot4.png")
dev.off()