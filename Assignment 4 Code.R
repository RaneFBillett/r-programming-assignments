Frequency <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2)
BP <- c(103,87,32,42,59,109,78,205,135,176)
First <- c(1,1,1,1,0,0,0,0,NA,1)
Second <- c(0,0,1,1,0,0,1,1,1,1)
FinalDecision <- c(0,1,0,1,0,1,0,1,1,1) 

hospitalInformation <- data.frame(Frequency, BP, First, Second, FinalDecision)

par(mfrow=c(1,2))
boxplot(hospitalInformation$BP, main = "Boxplot of Blood Pressure")
hist(hospitalInformation$BP, main = "Histogram of Blood Pressure", xlab="BP")
