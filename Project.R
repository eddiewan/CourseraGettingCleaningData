##### INITIALIZING #####
##load libraries
library(dplyr)

##### Retrieve data #####

## Download the zip file containing the data, if it has not been downloaded yet.

urlZip          <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileZip         <- "UCI HAR Dataset.zip"

if(!file.exists(fileZip)) {
        download.file(urlZip, fileZip, mode = "wb")
}

dataFolder <- "UCI HAR Dataset"

if(!file.exists(dataFolder)) {
        unzip(fileZip)
}


##### STEP 1: READ DATA - merge train and test data #####
## read training data
trainSubjects           <- read.table(paste0(dataFolder, "/train/", "subject_train.txt"), header = FALSE)
trainFeatureValues      <- read.table(paste0(dataFolder, "/train/", "X_train.txt"), header = FALSE)
trainTarget             <- read.table(paste0(dataFolder, "/train/", "y_train.txt"), header = FALSE)


## read test data
testSubjects            <- read.table(paste0(dataFolder, "/test/", "subject_test.txt"), header = FALSE)
testFeatureValues       <- read.table(paste0(dataFolder, "/test/", "X_test.txt"), header = FALSE)
testTarget              <- read.table(paste0(dataFolder, "/test/", "y_test.txt"), header = FALSE)

##### MERGE TRAIN AND TEST DATA SET #####
dataSubjects            <- rbind(trainSubjects, testSubjects)
dataFeatureValues       <- rbind(trainFeatureValues, testFeatureValues)
dataTarget              <- rbind(trainTarget, testTarget)

## Assign names to the tables subject and Target
names(dataSubjects) <- "subjectId"
names(dataTarget) <- "activityId"

## read feature labels
features                <- read.table(paste0(dataFolder, "/features.txt"), as.is = TRUE)
colnames(features)      <- c("featureId","featureLabel")
features[,2]            <- as.character(features[,2])

## assign feature labels to the feature values table
names(dataFeatureValues) <- features[,2]

## create one dataset
dataset <- cbind(dataFeatureValues,dataSubjects, dataTarget)



##### STEP 2 DETERMINE FEATURES TO KEEP ######

#only keep features that have 'mean' or 'std' in their name.
#features with mean or std in combination with 'FREQ' in their name are not included
#select features
selectedNames <- c("subjectId", "activityId", features[grep("mean\\(\\)|std\\(\\)", features[,2] ),2])
dataset_subset <- dataset[,selectedNames]

##### STEP 3 USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET #####
activities              <- read.table(paste0(dataFolder, "/activity_labels.txt"), header = FALSE)
colnames(activities)    <- c("activityId", "activityLabel")
activities[,2]          <- as.character(activities[,2])

#convert to dataframe in order to merge lists
activities_df           <- as.data.frame(activities)
dataset_subset_df       <- as.data.frame(dataset_subset)


merged_df <- merge(dataset_subset_df, activities_df, by = "activityId")

##### STEP 4 APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES #####
#change labels of the table to retrieve descriptive labels.
#replace -mean by Mean, -std by StandardDeviation, remove -()
names(merged_df) <- gsub('-mean', 'Mean', names(merged_df))
names(merged_df) <- gsub('-std', 'StandardDeviation', names(merged_df))
names(merged_df) <- gsub('[-()]', '', names(merged_df))

# reorder dataframe to have subjectid and activitylabel in front and remove activityid
feature_names <- names(merged_df)
first_features <- c("subjectId", "activityLabel")
remaining_features <- feature_names[!(feature_names %in% c(first_features,"activityId"))]

# cleaned dataset
cleaned_dataset <- merged_df[c(first_features, remaining_features)]


##### STEP 5 CREATE SECOND INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT #####
mean_cleaned_dataset <- aggregate(.~subjectId+activityLabel, cleaned_dataset, mean)

