if(!file.exist("./Data")){dir.create("./Data")}
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="~/R/Data/A.zip")
unzip("~/R/Data/A.zip")
list.files("~/R/Data")

##Test Data
#Subjects
sub_test<-read.table("../Data/UCI HAR Dataset/test/subject_test.txt", col.names="SubjectNumber", sep=",", header=F)
head(sub_test)

#Read and Label training
y_test<-read.table("../Data/UCI HAR Dataset/test/Y_test.txt", sep=",", header=F)
head(y_test)

colnames(y_test)<-"Activity"
y_test$Activity<-as.factor(y_test$Activity)
acLab<-read.table("../Data/UCI HAR Dataset/activity_labels.txt", sep=",", header=F)

splitNames<-strsplit(as.character(acLab$V1)[1:6], " ")
str(splitNames)
secondEl<- function(x){x[2]}
acLab<-sapply(splitNames,secondEl)
acLab
library(plyr)
y_test$Activity<-mapvalues(y_test$Activity, from = c("1", "2", "3","4","5","6"), to = c(acLab[[1]], acLab[[2]], acLab[[3]], acLab[[4]], acLab[[5]],acLab[[6]]))

#Read and Label x_test
x_test<-read.table("../Data/UCI HAR Dataset/test/X_test.txt",header=F)
head(x_test)

featureT<-read.table("../Data/UCI HAR Dataset/features.txt", sep=".", header=F)
#featureT<-as.character(featureT$V1)
#str(featureT)
#featureT
splitNames2<-strsplit(as.character(featureT$V1)," ")
str(splitNames2)
featureT<-sapply(splitNames2,secondEl)
colnames(x_test)<- c(featureT)
names(x_test)

Indx1<-grep("-[m]ean[^F]()",names(x_test))
names(x_test)[Indx1]
Indx2<-grep("std()",names(x_test))
names(x_test)[Indx2]
Indx<-paste(Indx1,Indx2)
Indx
#x_test with variables mean() and sd()
x_test<-cbind(x_test[,Indx1], x_test[,Indx2])

TEST<-cbind(sub_test,y_test,x_test)

## train data

#Subjects
sub_train<-read.table("../Data/UCI HAR Dataset/train/subject_train.txt", col.names="SubjectNumber", sep=",", header=F)
head(sub_train)

#Read and Label training
y_train<-read.table("../Data/UCI HAR Dataset/train/Y_train.txt", sep=",", header=F)
head(y_train)

colnames(y_train)<-"Activity"
y_train$Activity<-as.factor(y_train$Activity)
acLab<-read.table("../Data/UCI HAR Dataset/activity_labels.txt", sep=",", header=F)
splitNames<-strsplit(as.character(acLab$V1)[1:6], " ")
str(splitNames)
secondEl<- function(x){x[2]}
acLab<-sapply(splitNames,secondEl)
acLab
library(plyr)
y_train$Activity<-mapvalues(y_train$Activity, from = c("1", "2", "3","4","5","6"), to = c(acLab[[1]], acLab[[2]], acLab[[3]], acLab[[4]], acLab[[5]],acLab[[6]]))

#Read and Label x_Train
x_train<-read.table("../Data/UCI HAR Dataset/train/X_train.txt",header=F)
head(x_train)

colnames(x_train)<- c(featureT)
names(x_train)

Indx3<-grep("-[m]ean[^F]()",names(x_train))
names(x_train)[Indx3]
Indx4<-grep("std()",names(x_train))
names(x_train)[Indx4]
Indx<-paste(Indx3,Indx4)
Indx
#x_train with variables mean() and sd()
x_train<-cbind(x_train[,Indx3], x_train[,Indx4])


TRAIN<-cbind(sub_train,y_train, x_train)


# merge two cleaned data sets
CleanedData<- merge(TEST,TRAIN, all=TRUE)
intersect(names(TEST), names(TRAIN))


# Tidy data set with the average of each variable for each activity and each subject
variables<-tail(names(CleanedData), -2)
CleanedDataAve<- aggregate(CleanedData[,variables], list(CleanedData$SubjectNumber,CleanedData$TrainingLabels), mean)
names(CleanedDataAve)<-c("SubjectNumber","Activity", names(CleanedDataAve)[3:68])
head(CleanedDataAve)

write.csv(CleanedData,"~/R/Data/CleanData.txt")
write.csv(CleanedDataAve,"~/R/Data/CleanedDataAve.txt")

# END; BM