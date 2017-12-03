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
z <- 1:2880 # 2 days  by minute
with(hpc_sub,plot(z ,Sub_metering_1,type = "l",ylab = "Energy Sub Metering",xlab = "",xaxt="n",col="black"))
with(hpc_sub,points(z ,Sub_metering_2,type = "l",ylab = "Energy Sub Metering",xlab = "",xaxt="n",col="red"))
with(hpc_sub,points(z ,Sub_metering_3,type = "l",ylab = "Energy Sub Metering",xlab = "",xaxt="n",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
par(lwd=1)
dev.copy(png,file="plot3.png")
dev.off()

