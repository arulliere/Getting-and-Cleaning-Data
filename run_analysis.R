## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each 
##measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with 
##the average of each variable for each activity and each subject.

run_analysis <- function() {
        ## set working directory
        setwd("~/GitHub/Getting-and-Cleaning-Data/")
        
        ## PART-1: Merges the training and the test sets to create one tidy data set.
                ## read the features
                features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "label"))
                features_labels <- features[["label"]]
        
                ## read the activities
                activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "label"))
                activity <- activities[, "label"]
                
                ## read the training data and extract only the mean and standard deviation for each measurment.
                subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
                X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features_labels)
                X_train_mean <- X_train[ ,grep(".mean.", colnames(X_train), fixed = TRUE)]
                X_train_std <- X_train[ ,grep(".std.", colnames(X_train), fixed = TRUE)]
                X_train <- cbind(X_train_mean, X_train_std)
                y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
        
                ## loop on y data to replace key with actual activity label
                n <- as.numeric(nrow(y_train))
                y_train_activity <- c(NULL)
                for (i in 1:n) {
                        y_train_activity <- rbind(y_train_activity, as.character(activity[y_train[i,]]))
                } 
        
                ## read the test data and extract only the mean and standard deviation for each measurment.
                subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
                X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features_labels)
                X_test_mean <- X_test[ ,grep(".mean.", colnames(X_test), fixed = TRUE)]
                X_test_std <- X_test[ ,grep(".std.", colnames(X_test), fixed = TRUE)]
                X_test <- cbind(X_test_mean, X_test_std)
                y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
        
                ## loop on y data to replace key with actual activity label
                n <- as.numeric(nrow(y_test))
                y_test_activity <- c(NULL)
                for (i in 1:n) {
                        y_test_activity <- rbind(y_test_activity, as.character(activity[y_test[i,]]))
                }
                
                ## merge the training and test sets into one data frame
                subject <- rbind(subject_train, subject_test)
                X <- rbind(X_train, X_test)
                y <- rbind(y_train_activity, y_test_activity)
                df <- data.frame(Subject = subject, Activity = y, X)
        
        ## PART-2: create a second, independent tidy data set with the average of each variable 
        ##for each activity and each subject.
        
                ## Load the DPLYR library
                library(dplyr)
                ## Group data by Subject first and Activity second
                df_grouped <- group_by(df, Subject, Activity)
                
                ## Create variables vector to capture the variable columns and pass to the summarise function
                variables <- c(3:68) ## we need to apply mean to columns 3 to 68 only
                
                ## Use summarise_each to apply mean function to all the variables
                df_summarised <- summarise_each(df_grouped, funs(mean), variables)
                
                ## store averaged data into TXT file
                write.table(df_summarised, "tidy_data.txt", row.name = FALSE)
}