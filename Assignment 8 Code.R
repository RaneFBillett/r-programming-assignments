library(readr)
library(plyr)

Assignment8Dataset <- read_csv("Assignment8Dataset.csv")

StudentAverage <- ddply(Assignment8Dataset, "Sex",
                        transform, Grade.Average = mean(Grade))

sex <- Assignment8Dataset$Sex

write.table(StudentAverage, "Students_Gendered_Mean.txt", sep = ",")

i_students <- subset(Assignment8Dataset, grepl("i", Name, ignore.case = TRUE))

write.table(i_students, "DataSubset.csv", sep = ",")