#load libraries
library(ggplot2)
library(dplyr)

#load the data
data("diamonds")

#clean the data to only include those which have a price above 0, and carat also above 0,
#removing values that cant exist effectively
diamondsClean <- diamonds %>%
  filter(price > 0, carat > 0)

#first (geom point) plot showing the price paid for a diamond, referenced against the carat weighting of said gem
ggplot(diamondsClean, aes(x = carat, y = price)) +
  geom_point(alpha = 0.25, color = "limegreen") +
  theme_minimal() +
  labs(
    title = "Carat vs Price",
    x = "Carat",
    y = "Price (USD)"
  )

#box plot showing the price of diamonds against the quality of each gems cut
ggplot(diamondsClean, aes(x = cut, y = price, fill = cut)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Diamond Price by Cut Quality",
    x = "Cut",
    y = "Price (USD)"
  )

#box plot showing the price of a gem against its coloring
ggplot(diamondsClean, aes(x = color, y = price, fill = color)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Diamond Price by Color Grade",
    x = "Color",
    y = "Price (USD)"
  )

#box plot showing the price of a gem against its clarity
ggplot(diamondsClean, aes(x = clarity, y = price, fill = clarity)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Diamond Price by Clarity Grade",
    x = "Clarity",
    y = "Price (USD)"
  )

#final graph showing each carat weighting and cut quality against the price of the gem
ggplot(diamondsClean, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.15) +
  facet_wrap(~ cut) +
  theme_minimal() +
  labs(
    title = "Carat vs Price by Cut Quality",
    x = "Carat",
    y = "Price (USD)"
  )

#linear model for predicting prices (taken from my experience in Predictive analytics/text mining)
model <- lm(price ~ carat + cut + color + clarity, data = diamondsClean)
summary(model)
