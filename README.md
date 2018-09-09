# GettingAndCleaningData
GitHub repo for Final Project of Coursera Getting and Cleaning Data Course.

## Purpose
The purpose of the final assignment was to create a tidy dataset based on a predefined set of instructions from an untidy data set.  

## Untidy Data Set
The untidy data is found in a zip folder containing different documents pertaining to data collected by the accelerometers and gyroscopes 
from a set of test subjects each having a Samsung Galazy S smartphone.

Full Data Description: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data Files: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Assignment Instructions
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity 
and each subject.

## Other Notes
In order for the **run_analysis.R** script to work the working directory must contain the top level folder of the above folder titled 'UCI HAR Dataset'.
The final product of the **run_analysis.R** will be a tidy dataset with measurements summarized by subject and activity.
More specific information can be found in the **CodeBook.md**
