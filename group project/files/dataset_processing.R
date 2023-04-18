library("dplyr")


##picking specific stations to look at, over 2018-2022 period. also inserting a 'bike usage' variable

##2018 Q3

data1 <- read.csv("dublinbikes_20180701_20181001.csv")

#vector of the station names of interest
stations <- c("CUSTOM HOUSE QUAY", "GRAND CANAL DOCK", "THE POINT")

# Subset the data based on the stations vector
data1_subset <- subset(data1, NAME %in% stations)


#group the data by station and arrange by time
data1_subset <- data1_subset %>%
  group_by(`STATION.ID`) %>%
  arrange(`TIME`)

#calculate the difference in available bikes between each time point
data1_subset$BIKE.USAGE <- c(0, diff(data1_subset$`AVAILABLE.BIKES`))

data1_subset <- ungroup(data1_subset)

library(dplyr)

# Convert TIME column to POSIXct format
data1_subset$TIME <- as.POSIXct(data1_subset$TIME)

# Aggregate data by hour (this is across all days)
#data1_hourly <- data1_subset %>%
  #group_by(NAME, hour = lubridate::hour(TIME)) %>%
  #summarise(avg_bike_usage = mean(BIKE.USAGE),
            #avg_available_bikes = mean(AVAILABLE.BIKES),
            #avg_available_bike_stands = mean(AVAILABLE.BIKE.STANDS))



library(lubridate)
data1_hourly <- data1_subset %>%
  mutate(hour = format(TIME, "%Y-%m-%d %H:00:00"))





#2018 Q4

data2 <- read.csv("dublinbikes_20181001_20190101.csv")
data2_subset <- subset(data2, NAME %in% stations)

data2_subset <- data2_subset %>%
  group_by(`STATION.ID`) %>%
  arrange(`TIME`)

data2_subset$BIKE.USAGE <- c(0, diff(data2_subset$`AVAILABLE.BIKES`))

data2_subset <- ungroup(data2_subset)

#2019 Q1
data3 <- read.csv("dublinbikes_20181001_20190101.csv")
data3_subset <- subset(data3, NAME %in% stations)

data3_subset <- data3_subset %>%
  group_by(`STATION.ID`) %>%
  arrange(`TIME`)

data3_subset$BIKE.USAGE <- c(0, diff(data3_subset$`AVAILABLE.BIKES`))

data3_subset <- ungroup(data3_subset)
