#install.packages("lattice")
library(lattice)
library(ggplot2)

#loading a chosen dataset
data("airquality")

#creating my own variable so I don't accidentally mess with the real dataset
airQuality <- airquality
str(airQuality)

#investigating the background information of this dataset which I've seen in other classwork
?airquality

#creating a proper date column with year included to allow for the creation of time-series plots
airQuality$Date <- as.Date(paste(1973, airQuality$Month, airQuality$Day, sep = "-"))

#after plotting there was large gaps in the data so I then added the following to fix
airClean <- na.omit(airQuality)
                    
#base graph with basic design additions
plot(
  airClean$Date,
  airClean$Ozone,
  type = "l",
  col = "limegreen",
  main = "Ozone Levels Over Time (Base R)",
  xlab = "Date (1973)",
  ylab = "Ozone levels"
)

#time series graph (lattice graph) exploring similar themes as the previous graph
xyplot(
  Ozone ~ Date,
  data = airClean,
  type = "l",
  col = "limegreen",
  main = "Ozone Levels Over Time (Lattice)",
  xlab = "Date (1973)",
  ylab = "Ozone Levels"
)

#ggplot 2 of these graphs
ggplot(airClean, aes(x = Date, y = Ozone)) +
  geom_line(color = "limegreen", linewidth = 1.5) +
  labs(
    title = "Ozone Levels Over Time (ggplot2)",
    x = "Date (1973)",
    y = "Ozone Levels"
  ) + theme_minimal()