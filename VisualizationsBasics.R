#1
print("Plotting Basics: Kachhwaha")
#2
#install.packages("FSA")
#install.packages("FSAdata")
#install.packages("magrittr")
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("moments")
#install.packages("plotrix")
#3
library("FSA")
library("FSAdata")
library("magrittr")
library("dplyr")
library("ggplot2")
library("moments")
library("plotrix")
#4
BullTroutRML2
head(BullTroutRML2 ,3)
tail(BullTroutRML2 ,3)
#5
BullTroutRML3 <- filter(BullTroutRML2 , lake == "Harrison")
BullTroutRML3
#6
head(BullTroutRML3 ,5)
tail(BullTroutRML3 ,5)
#7
str(BullTroutRML3)
#8
summary(BullTroutRML3)
#9
plot(BullTroutRML3$fl , BullTroutRML3$age , xlab = "Fork Length (mm)", ylab = "Age (yrs)", xlim = c(0,500), ylim = c(0,15), main = "Plot 1: Harrison Lake Trout",pch = 16)
#10
hist(BullTroutRML3$age ,xlab = "Age (yrs)", ylab = "Frequency" ,col.lab = "cadetblue", xlim = c(0,15), 
     ylim = c(0,15), main = "Plot 2: Harrison Fish Age Distribution", col.main ="cadetblue")

#11

plot(BullTroutRML3$age~BullTroutRML3$fl,     
     main = "Plot 3: Harrison Density Shaded by Era",
     xlim = c(0,500),
     ylim = c(0,15),
     xlab = "Fork Length (mm)",
     ylab = "Age(yrs)",
     col= c("#006600", "#00FF00"),
     pch = 19)
#12
tmp <- headtail(BullTroutRML3 ,3) 
tmp
#13
tmp[4]
select(tmp , era)
#14
pchs <- c('+','x')
pchs
#15
cols <- c('red','gray60')
cols
#16
as.numeric(tmp$era)
typeof(tmp$era)
#17
#cols <- append(cols, tmp$era , 0)
#cols
initialize(cols, tmp$era)
cols
#18
plot(BullTroutRML3$fl , BullTroutRML3$age , xlab = "Fork Length (mm)", ylab = "Age (yrs)", xlim = c(0,500), 
     ylim = c(0,15), main = "Plot 4: Symbol & Color by Era",pch = pchs , col = cols)
#19
relation <- lm(BullTroutRML3$age ~ BullTroutRML3$fl)
relation
plot(BullTroutRML3$fl , BullTroutRML3$age , xlab = "Fork Length (mm)", ylab = "Age (yrs)", xlim = c(0,500), 
     ylim = c(0,15), main = "Plot 5: Regression Overlay.",pch = pchs , col = cols)
abline(relation)
#20
plot(BullTroutRML3$fl , BullTroutRML3$age , xlab = "Fork Length (mm)", ylab = "Age (yrs)", xlim = c(0,500), 
     ylim = c(0,15), main = "Plot 6:Legend Overlay.",pch = pchs , col = cols)
abline(relation)
legend(50, 14, legend=c("1977-80" , "1997-01"), cex=0.8,title="Legend", text.font=4, bg='lightblue', col= c("red", "blue") , pch = pchs)

