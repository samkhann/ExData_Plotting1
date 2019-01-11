library(dplyr)

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


png("plot1.png", width = 480, height = 480)

hist(as.numeric(new_df$Global_active_power),
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (killowatts)",
     ylim=c(0,1200))


dev.off()