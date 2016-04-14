# Software Carpentry 2016
# Umi lesson 1 4/14/16

#changing directory
setwd("~/Desktop/software-carpentry-2016/data-files/r-lesson/data")
list.files()
read.csv('inflammation-01.csv', header = F)

#Saving values as variables
#this would be useful to do with allometric data!
weight <- 55
weight
weight_kg <- 55
weight_kg
weight_kg*2.2
weight_kg <- 57.5
weight_kg

#save calculated value as variable
weight_lb <- weight_kg*2.2
weight_lb

dat <- read.csv('inflammation-01.csv', header = F)
dat
class(dat)
dim(dat)
 #returns rows then columns

dat[1,1]
dat[30,20]

#can also return several or a range of values
dat[1:4, 1:10]
dat[c(3,8,37,56), c(10,14,29)]

#can also return a specific row or column
dat[5,]
dat[,16]

#can save some values as new data frame, and use to querry data
raptor_1 <- dat[1,]

max(raptor_1)
min(raptor_1)

#could querry original data without saving under a different name
max(dat[1,])
