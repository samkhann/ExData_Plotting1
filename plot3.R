library(dplyr)
#Getting Data
fileName <- "exdata_data_household_power_consumption.zip"
source <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path <- "exdata_data_household_power_consumption"

if (!file.exists(fileName)) {
  download.file(source, fileName, mode = "wb")
}

if (!file.exists(path)) {
  unzip(fileName)
}

table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df <- as.data.frame.matrix(table) 
new_df <- df %>% filter(Date == "1/2/2007" | Date == "2/2/2007")


datetime <- strptime(paste(new_df$Date, new_df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# 1. Open jpeg file
png("plot3.png", width = 480, height = 480)

# 2. Create the plot
plot(datetime, as.numeric(new_df$Sub_metering_1),
     ylab="Energy sub metering",
     type="l",
     xlab=""
)
lines(datetime, as.numeric(new_df$Sub_metering_2), type = "l", col="red")
lines(datetime, as.numeric(new_df$Sub_metering_3), type = "l", col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

# 3. Close the file
dev.off()