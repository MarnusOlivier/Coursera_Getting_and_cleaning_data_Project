### Background
An experiment was carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities 

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

The features selected for the database came from the accelerometer and gyroscope which generated 3-axial raw signals using a Samsung Galaxy S smart-phone worn by the volunteers.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data and files
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
Various variables/features were estimated from these signals but only the mean and standard deviation was used for the purpose of this assignment.

The files used from the data base included the following:

* features.txt:             List of all features.
* activity_labels.txt:      Links the class labels with their activity name.
* train/X_train.txt:        Train input features.
* train/y_train.txt:        Train activity.
* test/X_test.txt:          Test input features.
* test/y_test.txt:          Test activity.
* train/subject_train.txt:  Subject who performed the activity. 
* train/subject_test.txt:   Subject who performed the activity.

### Objective
The objective was to create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Script approach
The script was divided into 6 steps which were used to reach the end goal. This is outlined using various comments in run_analysis.R.

##### STEP 1
Read all the raw data that will be used in the remainder of the script
to create the tidy data set. All the above files were read using read.table()

##### STEP 2
Merge the training and the test sets to create one data set and appropriately label the data set with descriptive variable names. Merging all the data frames was performed using the cbind and rbind functions. The features file was used to assign the preliminary names. 

##### STEP 3
Uses descriptive activity names to name the activities in the data set... 

This is done by converting the Activity numerical entries to factor variables and changing the levels to the descriptive activities.   

##### STEP 4
Extract only the measurements on the mean and standard deviation for each measurement...

This is done by identifying which columns names contains mean or std using grepl and
selecting only those columns together with the Subject and Activity columns

##### STEP 5
Create independent tidy data set with the average of each variable for each activity and each subject...

This was done using the aggregate function
The names were also cleaned by removing "()", capitlazing M and S in Mean and Std etc.

##### STEP 6
Finally the tidy data set was exported using write.table()

### Tidy_data.txt variable description
Running the following code (make sure the tidy_data.txt file is in your working directory) in your console will output all the variable names:

1. tidy <- read.table("tidy_data.txt", header = TRUE)
2. names(tidy).

The resulting variable names take on the following form (Excluding Subject and Activity which is self-explanatory):

* tBodyAcc_Mean_X

The prefix t stands for time-domain (f is used for frequency domain), BodyAcc is the field, Mean the derived variable and X the axial direction

 [1] "Subject"                      
 [2] "Activity"                     
 [3] "tBodyAcc_Mean_X"              
 [4] "tBodyAcc_Mean_Y"              
 [5] "tBodyAcc_Mean_Z"              
 [6] "tBodyAcc_Std_X"               
 [7] "tBodyAcc_Std_Y"               
 [8] "tBodyAcc_Std_Z"               
 [9] "tGravityAcc_Mean_X"           
[10] "tGravityAcc_Mean_Y"           
[11] "tGravityAcc_Mean_Z"           
[12] "tGravityAcc_Std_X"            
[13] "tGravityAcc_Std_Y"            
[14] "tGravityAcc_Std_Z"            
[15] "tBodyAccJerk_Mean_X"          
[16] "tBodyAccJerk_Mean_Y"          
[17] "tBodyAccJerk_Mean_Z"          
[18] "tBodyAccJerk_Std_X"           
[19] "tBodyAccJerk_Std_Y"           
[20] "tBodyAccJerk_Std_Z"           
[21] "tBodyGyro_Mean_X"             
[22] "tBodyGyro_Mean_Y"             
[23] "tBodyGyro_Mean_Z"             
[24] "tBodyGyro_Std_X"              
[25] "tBodyGyro_Std_Y"              
[26] "tBodyGyro_Std_Z"              
[27] "tBodyGyroJerk_Mean_X"         
[28] "tBodyGyroJerk_Mean_Y"         
[29] "tBodyGyroJerk_Mean_Z"         
[30] "tBodyGyroJerk_Std_X"          
[31] "tBodyGyroJerk_Std_Y"          
[32] "tBodyGyroJerk_Std_Z"          
[33] "tBodyAccMag_Mean"             
[34] "tBodyAccMag_Std"              
[35] "tGravityAccMag_Mean"          
[36] "tGravityAccMag_Std"           
[37] "tBodyAccJerkMag_Mean"         
[38] "tBodyAccJerkMag_Std"          
[39] "tBodyGyroMag_Mean"            
[40] "tBodyGyroMag_Std"             
[41] "tBodyGyroJerkMag_Mean"        
[42] "tBodyGyroJerkMag_Std"         
[43] "fBodyAcc_Mean_X"              
[44] "fBodyAcc_Mean_Y"              
[45] "fBodyAcc_Mean_Z"              
[46] "fBodyAcc_Std_X"               
[47] "fBodyAcc_Std_Y"               
[48] "fBodyAcc_Std_Z"               
[49] "fBodyAcc_MeanFreq_X"          
[50] "fBodyAcc_MeanFreq_Y"          
[51] "fBodyAcc_MeanFreq_Z"          
[52] "fBodyAccJerk_Mean_X"          
[53] "fBodyAccJerk_Mean_Y"          
[54] "fBodyAccJerk_Mean_Z"          
[55] "fBodyAccJerk_Std_X"           
[56] "fBodyAccJerk_Std_Y"           
[57] "fBodyAccJerk_Std_Z"           
[58] "fBodyAccJerk_MeanFreq_X"      
[59] "fBodyAccJerk_MeanFreq_Y"      
[60] "fBodyAccJerk_MeanFreq_Z"      
[61] "fBodyGyro_Mean_X"             
[62] "fBodyGyro_Mean_Y"             
[63] "fBodyGyro_Mean_Z"             
[64] "fBodyGyro_Std_X"              
[65] "fBodyGyro_Std_Y"              
[66] "fBodyGyro_Std_Z"              
[67] "fBodyGyro_MeanFreq_X"         
[68] "fBodyGyro_MeanFreq_Y"         
[69] "fBodyGyro_MeanFreq_Z"         
[70] "fBodyAccMag_Mean"             
[71] "fBodyAccMag_Std"              
[72] "fBodyAccMag_MeanFreq"         
[73] "fBodyBodyAccJerkMag_Mean"     
[74] "fBodyBodyAccJerkMag_Std"      
[75] "fBodyBodyAccJerkMag_MeanFreq" 
[76] "fBodyBodyGyroMag_Mean"        
[77] "fBodyBodyGyroMag_Std"         
[78] "fBodyBodyGyroMag_MeanFreq"    
[79] "fBodyBodyGyroJerkMag_Mean"    
[80] "fBodyBodyGyroJerkMag_Std"     
[81] "fBodyBodyGyroJerkMag_MeanFreq"
