##
## Exploratory data analysis: Assignement 1 plotting
## plot1.R

## 
## read data
##
wd <- normalizePath(getwd(),winslash='\\',mustWork = NA)
localFile <- paste0(wd,"\\household_power_consumption.txt")
hpc <- read.table(localFile,header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
hpc_sub <- subset(hpc, (as.Date(Date,"%d/%m/%Y") == "2007-02-02") |
                       (as.Date(Date,"%d/%m/%Y") == "2007-02-01"))

##
## Plot 1
##
par(mfrow=c(1,1))
with(hpc_sub,
     hist(Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power"))
dev.copy(png,file="plot1.png")
dev.off()

