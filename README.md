# Assignment of course Getting and Cleaning Data 
Repo for the course project assignment of Getting and Cleaning Data course on Coursera.

## Overview

This project aims to implement getting and cleaning data techniques learned in the course to get tidy data from a data set, preparing for other analysis. 

## Descriptions  
### Section 1. Merge the training and the test sets to create one data set. Data used are:
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt
### Section 2. Extract only the measurements on the mean and standard deviation for each measurement. 
    Use grepl to form a indicative vector to show which column names contains "mean" or "std". 
    Then choose these columns to form a new table, together with ID of activity and subject. 
### Section 3. Use descriptive activity names to name the activities in the data set
Assign descriptive column names for the tables.
### Section 4. Appropriately label the data set with descriptive activity names.
Merge data subset with the Label of activityType to get descriptive activity type name. 
### Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Aggregate and calculate the mean. Then sort.

You can find additional information about the variables, data and transformations in the CodeBook.MD file.
