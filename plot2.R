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
hpc_sub$Date <- as.Date(hpc_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc_sub$Date), hpc_sub$Time)
hpc_sub$Datetime <- as.POSIXct(datetime)
with(hpc_sub,plot(Global_active_power ~Datetime,
    type = "l",ylab = "Global Active Power",xlab = ""))
par(lwd=1)
dev.copy(png,file="plot2.png")
dev.off()
