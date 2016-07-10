## Code Book

This document describes the variables, the data, and any transformations or work performed by the R script called run_analysis.R to clean up the “Human Activity Recognition Using Smartphones Dataset”.

## Requirements
The R script run_analysis.R requires:
1. R packages: dplyr and reshape2
2. Download “Human Activity Recognition Using Smartphones Dataset” from the following URL, and unzip the downloaded file in the same directory where you run R script “run_analysis.R”:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## RawData: “Human Activity Recognition Using Smartphones Dataset”

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist­mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The R script run_analysis.R reads the following files from the “UCI HAR Dataset” directory created when unzipping the downloaded file:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## R script Output
The R script run_analysis.R creates the following datasets:
1. uci_har dataset (uci_har.csv file): Dataset created by merging the training and the test sets, and contains only the measurements on the mean and standard deviation for each measurement, i.e, feature names (from features.txt) that matches the patterns "-mean()" or "-std()". In order to uses descriptive activity names to name the activities in the data set (from 'activity_labels.txt'), the variable activity_name was created.

# uci_har dataset variables
 [1] "subject_id"
 [2] "activity_id"
 [3] "activity_name"    
 [4] "tBodyAcc-mean()-X"
 [5] "tBodyAcc-mean()-Y"
 [6] "tBodyAcc-mean()-Z"     
 [7] "tBodyAcc-std()-X"
 [8] "tBodyAcc-std()-Y"
 [9] "tBodyAcc-std()-Z"      
[10] "tGravityAcc-mean()-X"
[11] "tGravityAcc-mean()-Y"
[12] "tGravityAcc-mean()-Z"  
[13] "tGravityAcc-std()-X"
[14] "tGravityAcc-std()-Y"
[15] "tGravityAcc-std()-Z"   
[16] "tBodyAccJerk-mean()-X"
[17] "tBodyAccJerk-mean()-Y"
[18] "tBodyAccJerk-mean()-Z" 
[19] "tBodyAccJerk-std()-X"
[20] "tBodyAccJerk-std()-Y"
[21] "tBodyAccJerk-std()-Z"  
[22] "tBodyGyro-mean()-X"
[23] "tBodyGyro-mean()-Y"
[24] "tBodyGyro-mean()-Z"    
[25] "tBodyGyro-std()-X"
[26] "tBodyGyro-std()-Y"
[27] "tBodyGyro-std()-Z"     
[28] "tBodyGyroJerk-mean()-X"
[29] "tBodyGyroJerk-mean()-Y"
[30] "tBodyGyroJerk-mean()-Z"
[31] "tBodyGyroJerk-std()-X"
[32] "tBodyGyroJerk-std()-Y"
[33] "tBodyGyroJerk-std()-Z" 
[34] "fBodyAcc-mean()-X"
[35] "fBodyAcc-mean()-Y"
[36] "fBodyAcc-mean()-Z"     
[37] "fBodyAcc-std()-X"
[38] "fBodyAcc-std()-Y"
[39] "fBodyAcc-std()-Z"      
[40] "fBodyAccJerk-mean()-X"
[41] "fBodyAccJerk-mean()-Y"
[42] "fBodyAccJerk-mean()-Z" 
[43] "fBodyAccJerk-std()-X"
[44] "fBodyAccJerk-std()-Y"
[45] "fBodyAccJerk-std()-Z"  
[46] "fBodyGyro-mean()-X"
[47] "fBodyGyro-mean()-Y"
[48] "fBodyGyro-mean()-Z"    
[49] "fBodyGyro-std()-X"
[50] "fBodyGyro-std()-Y"
[51] "fBodyGyro-std()-Z"  

2. uci_har_mean dataset (uci_har_mean.csv): data set created from uci_har dataset with the average of each variable for each activity and each subject.
