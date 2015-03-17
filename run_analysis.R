# ============================================================================================
# Objective
# ============================================================================================
# Data was obtained from the following url:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# The objective was to create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# ============================================================================================
# Some info about the files use in the script
# ============================================================================================
# 1 'features.txt':             List of all features.
# 2 'activity_labels.txt':      Links the class labels with their activity name.
# 3 'train/X_train.txt':        Training set.
# 4 'train/y_train.txt':        Training labels.
# 5 'test/X_test.txt':          Test set.
# 6 'test/y_test.txt':          Test labels.
# 7 'train/subject_train.txt':  Each row identifies the subject who performed the activity for 
#                               each window sample. 
# 8 'train/subject_test.txt':   Each row identifies the subject who performed the activity for 
#                               each window sample. 

# ============================================================================================
# STEP 1
# Read all the raw data that will be used in the remainder of the script
# to create the tidy data set
# ============================================================================================
setwd("C:\\Users\\212410226\\Python & R\\R_workingDirectory\\2. Getting and Cleaning Data\\CourseProject")
features             <- read.table(".\\UCI HAR Dataset\\features.txt", stringsAsFactors = FALSE)
activity_labels      <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
X_train              <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y_train              <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
X_test               <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_test               <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject_train        <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")                        
subject_test         <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

# ============================================================================================
# STEP 2
# Merge the training and the test sets to create one data set
# and appropriately label the data set with preliminary descriptive variable names
# ============================================================================================
Merged_data          <- rbind(cbind(subject_test,  y_test,  X_test),
                              cbind(subject_train, y_train, X_train))
names(Merged_data)   <- c("Subject","Activity",features[,2])

# ============================================================================================
# STEP 3
# Uses descriptive activity names to name the activities in the data set... 
# This is done by converting the Activity numerical entries to factor
# variables and changing the levels to the descriptive activities  
# ============================================================================================
Merged_data$Activity  <- factor(Merged_data$Activity)
levels(Merged_data$Activity) <- activity_labels[,2]

# ============================================================================================
# STEP 4
# Extract only the measurements on the mean and standard deviation for each measurement..... 
# This is done by identifying which columns names contains mean or std using grepl and
# selecting only those columns together with the Subject and Activity columns
# ============================================================================================
Mean_std_cols           <- (grepl("mean", names(Merged_data))|    
                            grepl("std",  names(Merged_data)))
Mean_std_cols[1:2]      <- TRUE
Merged_data             <- Merged_data[,Mean_std_cols]

# ============================================================================================
# STEP 5
# Create independent tidy data set with the average of 
# each variable for each activity and each subject...
# This was done using th aggregate function
# The names where also cleaned by removing () and capitlazing M and S in Mean and Std using gsub
# ============================================================================================
tidy_data               <- aggregate(Merged_data[,3:dim(Merged_data)[2]], by=list(Merged_data$Subject, Merged_data$Activity), FUN=mean)
names(tidy_data)[1:2]   <- c("Subject","Activity")
names(tidy_data) <- gsub("\\(\\)", "", names(tidy_data))   
names(tidy_data) <- gsub("mean", "Mean", names(tidy_data))
names(tidy_data) <- gsub("std", "Std", names(tidy_data)) 
names(tidy_data) <- gsub("-", "_", names(tidy_data))   

# ============================================================================================
# STEP 6
# Export the tidy data set to a text file
# ============================================================================================
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)

