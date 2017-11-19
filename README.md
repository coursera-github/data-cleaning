# Getting and Cleaning Data Course Project

This repo contains code to clean the UCI Machine Learning Repository Human Activity Recognition Using Smartphones Data Set (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

# Overview

The `run_analysis.R` file contains the data retrieval and tidying code, based on the instructions from the coursera course.

The requirements were to:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Usage

After cloning the github repo, execute `run_analysis.R` using R. Ensure your working directory is set to the same directory as the analysis code.

## Source

The `run_analysis.R` file downloads the original dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, which is the link provided in the coursera instructions.
Unzipping of the data is handled in code, so the file can be run as is.

## Output

The code outputs a file `tidy_dataset.txt`, which is the resulting tidy dataset as per the above methodology.
