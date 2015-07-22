Code Book
============================================================================================================================
This document describes the code inside run_analysis.R.

The code has 2 main parts:
============================================================================================================================
- Part 1: reading and merging the data into one clean data.frame
- Part 2: manipulating the tidy data to group it by first by Subject and then by Activity, and give the mean values for each variables

Variables
============================================================================================================================
features: stores the raw data from UCI HAR Dataset/activity_labels.txt
features_labels: captures the "label" column from features
activities: stores the raw data from UCI HAR Dataset/activity_labels.txt
activity: captures the "label" column from activities
subject_train: stores the raw data from UCI HAR Dataset/train/subject_train.txt
X_train: stores the raw data from UCI HAR Dataset/train/X_train.txt
X_train_mean: extracts only the measurements of mean
X_train_std: extracts only the measurements of standard deviation
y_train: stores the raw data from UCI HAR Dataset/train/y_train.txt
n: integer storing the size of the data set for the loop purposes
subject_test: stores the raw data from UCI HAR Dataset/test/subject_test.txt
X_test: stores the raw data from UCI HAR Dataset/test/X_test.txt
X_test_mean: extracts only the measurements of mean
X_test_std: extracts only the measurements of standard deviation
y_test: stores the raw data from UCI HAR Dataset/test/y_test.txt
subject: merging the train and test subject data into one set using rbind
X: merging the train and test X data into one set using rbind
y: merging the train and test y data into one set using rbind
df: building data frame with the tidy data: Subject, Activity and mean standard deviation measurements
df_grouped: transforming the data frame to group the data by subject and by activity
variables: vector of number from 3 to 68 that will be used to apply the mean function to all the measurements at once
df_summarised: final tidy data, grouped by subject and activity and returning the mean of all the measurements for each

Data
============================================================================================================================

Transformation work
============================================================================================================================
