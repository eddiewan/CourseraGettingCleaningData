## Codebook
This codebook describes the source of the data, a brief description of the run_analysis file and the variables used.

## Source
The data is about Human Activity Recognition using smartphones (from the Machine learning repository).
The data can be downloaded (zip file) using the link below: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This link is also included in the run_analysis file (if not yet downloaded).
More information about the project can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Description of run_analysis file
The run_analysis file contains the R code to perform the following 5 steps:
1. Merge training and test data set to create one data set
2. Extract only the measurements relating to the mean and the standard deviation
3. Use descriptive activity names and assign them to the data set
4. Provide appropriate labels to the data set (descriptive labels)
5. Using the data from step 4, create a tiny dataset containing the 'mean' for each activity and each subject


# Step 1
Step 1 contains of reading the training and test data set.
The data sets were split in three data sets: the features (train and test), the activities (train and test) and the subjects (train and test).
After reading the file, three datasets are created:
- dataSubjects: containing the train and test data of the subjects (10299 observations, 1 feature)
- dataFeatureValues: containing train and test data of all features (10299 observations, 561 features)
- dataTarget: containing train and test data of all activities (10299 observations, 1 feature)

After assigning descriptive labels, the three datasets are merged into 1 dataset: dataset

# Step 2
Step 2 is to determine the features to keep. These are the features related to 'mean' and 'standard deviation'
This resulted in the following set of features (66 features):
- "tBodyAcc-mean()-X"           
- "tBodyAcc-mean()-Y"          
- "tBodyAcc-mean()-Z"           
- "tBodyAcc-std()-X"           
- "tBodyAcc-std()-Y"            
- "tBodyAcc-std()-Z"           
- "tGravityAcc-mean()-X"        
- "tGravityAcc-mean()-Y"       
- "tGravityAcc-mean()-Z"        
- "tGravityAcc-std()-X"        
- "tGravityAcc-std()-Y"         
- "tGravityAcc-std()-Z"        
- "tBodyAccJerk-mean()-X"       
- "tBodyAccJerk-mean()-Y"      
- "tBodyAccJerk-mean()-Z"       
- "tBodyAccJerk-std()-X"       
- "tBodyAccJerk-std()-Y"        
- "tBodyAccJerk-std()-Z"       
- "tBodyGyro-mean()-X"          
- "tBodyGyro-mean()-Y"         
- "tBodyGyro-mean()-Z"          
- "tBodyGyro-std()-X"          
- "tBodyGyro-std()-Y"           
- "tBodyGyro-std()-Z"          
- "tBodyGyroJerk-mean()-X"      
- "tBodyGyroJerk-mean()-Y"     
- "tBodyGyroJerk-mean()-Z"      
- "tBodyGyroJerk-std()-X"      
- "tBodyGyroJerk-std()-Y"       
- "tBodyGyroJerk-std()-Z"      
- "tBodyAccMag-mean()"          
- "tBodyAccMag-std()"          
- "tGravityAccMag-mean()"       
- "tGravityAccMag-std()"       
- "tBodyAccJerkMag-mean()"      
- "tBodyAccJerkMag-std()"      
- "tBodyGyroMag-mean()"         
- "tBodyGyroMag-std()"         
- "tBodyGyroJerkMag-mean()"     
- "tBodyGyroJerkMag-std()"     
- "fBodyAcc-mean()-X"           
- "fBodyAcc-mean()-Y"          
- "fBodyAcc-mean()-Z"           
- "fBodyAcc-std()-X"           
- "fBodyAcc-std()-Y"            
- "fBodyAcc-std()-Z"           
- "fBodyAccJerk-mean()-X"       
- "fBodyAccJerk-mean()-Y"      
- "fBodyAccJerk-mean()-Z"       
- "fBodyAccJerk-std()-X"       
- "fBodyAccJerk-std()-Y"        
- "fBodyAccJerk-std()-Z"       
- "fBodyGyro-mean()-X"          
- "fBodyGyro-mean()-Y"         
- "fBodyGyro-mean()-Z"          
- "fBodyGyro-std()-X"          
- "fBodyGyro-std()-Y"           
- "fBodyGyro-std()-Z"          
- "fBodyAccMag-mean()"          
- "fBodyAccMag-std()"          
- "fBodyBodyAccJerkMag-mean()"  
- "fBodyBodyAccJerkMag-std()"  
- "fBodyBodyGyroMag-mean()"     
- "fBodyBodyGyroMag-std()"     
- "fBodyBodyGyroJerkMag-mean()" 
- "fBodyBodyGyroJerkMag-std()"

Including the subjectId and the activityId these features are stored in the variable 'dataset_subset'

# Step 3
In Step 3 we provide descriptive activity names to the activityId's
These are stored in the dataframe 'merged_df'. The activities are: Walking, Walking_upstairs, Walking_downstairs, Sitting, Standing and Laying

# Step 4
In Step 4 the other features are given an appropriate descriptive label.
The '-mean' are replaced by 'Mean'
The '-std' are replaced by 'StandardDeviation'
the '-()' are removed
The resulting dataset is stored in the variable 'cleaned_dataset'

# Step 5
The final tidy dataset is created by making an aggregate of the 'cleaned_dataset' and store it in the variable 'mean_cleaned_dataset'

## Variables used:
- dataSubjects
- dataFeatureValues
- dataTarget
- dataset
- dataset_subset
- merged_df
- cleaned_dataset
- mean_cleaned_dataset
