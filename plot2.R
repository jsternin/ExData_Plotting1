##
## Exploratory data analysis: Assignement 1 plotting
## plot2.R
##

## 
## read data
##
wd <- normalizePath(getwd(),winslash='\\',mustWork = NA)
localFile <- paste0(wd,"\\household_power_consumption.txt")
hpc <- read.table(localFile,header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
hpc_sub <- subset(hpc, (as.Date(Date,"%d/%m/%Y") == "2007-02-02") |
                       (as.Date(Date,"%d/%m/%Y") == "2007-02-01"))



##
## Plot2.R
##
## (day(as.Date(Date,"%d/%m/%Y"))-1) * 1440 + 
## hour(strptime(Time,format="%H:%M:%S")) * 60 + 
##  minute(strptime(Time,format="%H:%M:%S"))
##par(lwd=2)
z <- 1:2880 # 2 days  by minute
with(hpc_sub,plot(z ,Global_active_power,
    type = "l",ylab = "Global Active Power",xlab = "",xaxt="n"))
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
par(lwd=1)
dev.copy(png,file="plot2.png")
dev.off()
