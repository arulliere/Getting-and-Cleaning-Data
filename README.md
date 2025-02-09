================================================================================================================
Getting and Cleaning Data Course Project
================================================================================================================
Author: Antoine Rulliere

The purpose of this project is as follows:
================================================================================================================
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 I created one R script called run_analysis.R that does the following.
1- Merges the training and the test sets to create one data set.
2- Extracts only the measurements on the mean and standard deviation for each measurement. 
3- Uses descriptive activity names to name the activities in the data set
4- Appropriately labels the data set with descriptive variable names. 
5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The project folder includes the following files:
=================================================================================================================
- A codebook file (Codebook.md) which describes the variables, the data, and any transformations or work that is performed to clean up the data
- A R file (run_analysis.R) that has the code to pull the raw data and transform it into the required tidy data
- A text file (tidy_data.TXT) that contains the final tidy data returned by the R application
