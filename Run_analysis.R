#Reading the data from the test subjects.
TestWhichPer <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
TestData <- read.table("UCI HAR Dataset/test/x_test.txt",header=FALSE)
TestActivity <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
TestLabels <- read.table("UCI HAR Dataset/features.txt", header=FALSE)

#Reading the data from the train subjects
TrainWhichPer <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
TrainData <- read.table("UCI HAR Dataset/train/x_train.txt",header=FALSE)
TrainActivity <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)

#Bind the data from the test subjects together and put labels in for column 1 and 2.
data2 <- cbind(TestWhichPer,TestActivity)
colnames(data2) <- c("Subject", "Activity")
data3 <- cbind(data2, TestData)

#Put labels in for the other columns from data features.txt.
x <- sapply(TestLabels[,2], as.character)
names(data3)[3:563] <- x

#Bind and labbeling the train data set.
data4 <- cbind(TrainWhichPer,TrainActivity)
colnames(data4) <- c("Subject", "Activity")
data5 <- cbind(data4, TrainData)

x <- sapply(TestLabels[,2], as.character)
names(data5)[3:563] <- x

#Bind train data and test data together.
FinalData <- rbind(data3,data5)

Final <- FinalData[order(FinalData$Subject),]

#Put activity labels in the column
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
A_Labels <- sapply(ActivityLabels[,2], as.character)
z <- Final[,2]
for(i in 1:6){
	z <- replace(z, z==i, A_Labels[i])
}

#Gets only the columns with std and mean in the name
Final[,2] <- z
std <- grep("std",names(Final))
mean <- grep("mean", names(Final))
group <- c(1,2,std,mean)
Final2 <- Final[,group]

#Calculate the mean of each activity from each subject.
FinalMean <- aggregate(Final2[,3:81], list(Subject=Final2$Subject,Activity=Final2$Activity),mean)
