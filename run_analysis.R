# Download file
if (!file.exists("./data"))(dir.create("./data"))
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"./data/data.zip")
unzip(zipfile = "./data/data.zip", exdir="./data")

# Read tables
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

features <- read.table('./data/UCI HAR Dataset/features.txt')
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Labels the data set with descriptive variable names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(activityLabels) <- c('activityID','activityType')

# Merges the training and the test sets to create one data set
TrainingSet <- cbind(y_train, subject_train, x_train)
TestingSet <- cbind(y_test, subject_test, x_test)
TrainingTesting <- rbind(TrainingSet, TestingSet)

# Extracts only the measurements on the mean and standard deviation for each measurement
col_MeanSTD <- (grepl("mean", colnames(TrainingTesting)) | grepl("std", colnames(TrainingTesting)) )
MeanStdSet <- cbind( TrainingTesting[,1:2], TrainingTesting[,col_MeanSTD == TRUE])

# Use descriptive activity names to name the activities in the data set
MeanStdSet <- merge( MeanStdSet, activityLabels, by="activityID", all.x=TRUE)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
TidyData <- aggregate(. ~subjectID + activityID, MeanStdSet, mean)
TidyData <- merge( TidyData, activityLabels, by= "activityID", all.x=TRUE)
TidyData <- TidyData[order(TidyData$subjectID, TidyData$activityID),]

write.table(TidyData, file="TidyData.txt", row.name = FALSE)


