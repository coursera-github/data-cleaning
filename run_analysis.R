# Init
libs <- c("dplyr")
invisible(sapply(libs, require, character.only = TRUE))

# Get Data
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
tmp <- tempfile()
download.file(url, tmp)
unzip(tmp, exdir = ".")
unlink(tmp)

# File paths
file_features <- 'UCI HAR Dataset/features.txt'
file_activity_labels <- 'UCI HAR Dataset/activity_labels.txt'
file_Xtrain <- 'UCI HAR Dataset/train/X_train.txt'
file_ytrain <- 'UCI HAR Dataset/train/y_train.txt'
file_Xtest <- 'UCI HAR Dataset/test/X_test.txt'
file_ytest <- 'UCI HAR Dataset/test/y_test.txt'
file_subject_train <- 'UCI HAR Dataset/train/subject_train.txt'
file_subject_test <- 'UCI HAR Dataset/test/subject_test.txt'

# Read the data
read.func <- function(file) read.table(file, sep="", header=FALSE, stringsAsFactors=FALSE)
feature_labels <- read.func(file_features)[, 2]
Xtrain <- read.func(file_Xtrain)
ytrain <- read.func(file_ytrain)
Xtest <- read.func(file_Xtest)
ytest <- read.func(file_ytest)

# 1. Merge the training and the test sets to create one data set.
X <- rbind(Xtrain, Xtest)
y <- rbind(ytrain, ytest)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
mean_std <- grepl("mean\\(\\)|std()", feature_labels)
X <- X[ , mean_std]

# 3. Use descriptive activity names to name the activities in the data set
activity_labels <- read.func(file_activity_labels)
y <- activity_labels[y[ , ], 2, drop=FALSE]

# 4. Appropriately label the data set with descriptive variable names.
names(X) <- feature_labels[mean_std]
names(y) <- "activity"

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
subject_train <- read.func(file_subject_train)
subject_test <- read.func(file_subject_test)
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"

df_tidy <-
  cbind(X, y, subject) %>%
  group_by(activity, subject) %>%
  summarize_all(mean)

# Output the tidy dataset
write.table(df_tidy, file = "tidy_dataset.txt", row.name=FALSE)
