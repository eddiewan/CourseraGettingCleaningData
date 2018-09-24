## CourseraGettingCleaningData

# Introduction
This repository contains the codebook (run_analysis.R) for the coursera course 'Getting and Cleaning Data'.
This codebook has been created for the course project.
Below the steps will contain a deep-dive from the comments in the codebook.

# Configuration
This project uses one library, the dplyr library.
After loading the library, the zip file, containing the data and the descriptions, is downloaded (if not yet downloaded).
After downloading the zip file, it is unzipped, after which it is read by the program.

# Step 1: merging train- and test data
Now that the data has been downloaded and unzipped, the train and test data is separately loaded.
For each dataset, the subjects, feature values and the target values are read in into three different tables.

Then, the subjects are merged, the feature values are merged and the target values are merged.

The columns do not have a good name yet, so we start by renaming the subject and target tables.
The feature table requires additional work, as we need to read the feature file.
The feature table contains of a id and a label. The labels are used as names for the feature value table.
This can be done easily as there are no duplicate columns.

After renaming all of the columns, the three tabels are combined by using the 'cbind' function of R.

# Step 2: Determine the features to keep
Based on the names of the features, only the features relating to the mean or the standard deviation should remain.
By using the grep-function the features with 'mean'  or 'std' followed by a '(' are selected. The decision has been made to not include the 'FREQ' features.

# Step 3: Use descriptive names for the activities
First, we read in the activity labels file as a list.
by renaming the columns to 'activityId' and 'activityLabel' the meaning is clear.
In order to easily merge the dataset with the activity labels, the lists are converted to data frames.
By using the 'merge' function we merge the two dataframes based on the 'activityId'. This is needed as the dataset contains duplicate activityId's.

# Step 4: Use appropriate names for the variables
There are a number of columns which do not have a nice name, therefore the following has been adjusted:
- '-mean' to 'Mean' 
- '-std' to 'StandardDeviation'
- '-()'  removed
The remaining column names are easier to use when making calculations.
Finally, to create a nice tiny dataframe, the columns are re-ordered and the activityId column is removed as it is now redundant.

# Step 5: Second tiny data set with contains the average per subject id and per activity id
using the aggreagate function, we can easily determine the average of all columns per group. This group contains the subject id and the activity id.
The remaining dataset contains per subject, per activity one row of data containing the average of the 'mean' and 'standard deviation' columns

The result of the final step is displayed in the file 'tiny_dataset.txt'
