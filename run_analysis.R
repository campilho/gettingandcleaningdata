library(dplyr)
library(reshape2)

# You will be required to submit:
# 1) a tidy data set as described below,
# 2) a link to a Github repository with your script for performing the analysis, and
# 3) a code book that describes the variables, the data, and any transformations or
# work that you performed to clean up the data called CodeBook.md.
# You should also include a README.md in the repo with your scripts.
# This repo explains how all of the scripts work and how they are connected.

# Here are the data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# You should create one R script called run_analysis.R that does the following.

# 1.	Merges the training and the test sets to create one data set.

# Reading activity and features labels
ActivityLabelsFile <- "./UCI HAR Dataset/activity_labels.txt"
FeaturesLabelsFile <- "./UCI HAR Dataset/features.txt"

activity_labels <- read.table(ActivityLabelsFile)
features_labels <- read.table(FeaturesLabelsFile)

# Reading test data
TestSubjectFile <- "./UCI HAR Dataset/test/subject_test.txt"
TestXFile <- "./UCI HAR Dataset/test/X_test.txt"
TestYFile <- "./UCI HAR Dataset/test/y_test.txt"

subject_test <- read.table(TestSubjectFile)
features_test <- read.table(TestXFile)
activity_test <- read.table(TestYFile)

# Reading training data
TrainSubjectFile <- "./UCI HAR Dataset/train/subject_train.txt"
TrainXFile <- "./UCI HAR Dataset/train/X_train.txt"
TrainYFile <- "./UCI HAR Dataset/train/y_train.txt"

subject_train <- read.table(TrainSubjectFile)
features_train <- read.table(TrainXFile)
activity_train <- read.table(TrainYFile)

# Merging test and training data
subject_data <- rbind(subject_test,subject_train)
features_data <- rbind(features_test,features_train)
activity_data <- rbind(activity_test,activity_train)

# 2.	Extracts only the measurements on the mean and standard deviation for each measurement.

# Changing features_data labels with features_labels
names(features_data) <- features_labels[,2]

# Extracting only the measurements on the mean and standard deviation for each measurement
# mean(): Mean value
# std(): Standard deviation
filtered_features <- grepl("mean\\(\\)-|std\\(\\)-",names(features_data))
features_data <- features_data[,filtered_features]

# 3.	Uses descriptive activity names to name the activities in the data set
activity_data[,2] <- activity_labels[activity_data[,1],2]
names(activity_data) <- c("activity_id", "activity_name")
names(subject_data) <- c("subject_id")
  
# 4.	Appropriately labels the data set with descriptive variable names.
uci_har <- cbind(subject_data,activity_data,features_data)

# Create CSV File called "uci_har.csv"
write.csv(uci_har, file = "uci_har.csv",row.names=FALSE)

# 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
uci_har_melt <- melt(uci_har, id = c("subject_id","activity_name"), measure.vars = colnames(uci_har[,-(1:3)]))
uci_har_mean <- dcast(uci_har_melt, subject_id + activity_name ~ variable, mean)

# Create CSV File called "uci_har_mean.csv"
write.csv(uci_har_mean, file = "uci_har_mean.csv",row.names=FALSE)
