##
## Exploratory data analysis: Assignement 1 plotting
## plot3.R

## 
## read data
##
wd <- normalizePath(getwd(),winslash='\\',mustWork = NA)
localFile <- paste0(wd,"\\household_power_consumption.txt")
hpc <- read.table(localFile,header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
hpc_sub <- subset(hpc, (as.Date(Date,"%d/%m/%Y") == "2007-02-02") |
                       (as.Date(Date,"%d/%m/%Y") == "2007-02-01"))

##
## Plot3.R
##
##par(lwd=2)
hpc_sub$Date <- as.Date(hpc_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc_sub$Date), hpc_sub$Time)
hpc_sub$Datetime <- as.POSIXct(datetime)
with(hpc_sub,plot(Sub_metering_1 ~Datetime,type = "l",ylab = "Energy Sub Metering",xlab = "",col="black"))
with(hpc_sub,points(Sub_metering_2 ~Datetime,type = "l",ylab = "Energy Sub Metering",xlab = "",col="red"))
with(hpc_sub,points(Sub_metering_3 ~Datetime,type = "l",ylab = "Energy Sub Metering",xlab = "",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(lwd=1)
dev.copy(png,file="plot3.png")
dev.off()

