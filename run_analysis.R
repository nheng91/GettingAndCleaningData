
## First check to see if working directory is the correct folder that contains the necessary folders and data.

if(!file.exists("UCI HAR Dataset")) {
  stop("Make sure 'UCI HAR Dataset' file is in working directory")
}

## The following code reads in and combines the datasets in the test folder.  It also adds the names found 
## in the features.txt file to the final combined dataset as column names.

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", sep = "")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",sep = "")
features <-  read.table("UCI HAR Dataset/features.txt",sep = "")
names(x_test) <- features$V2
names(y_test) <- "activity"
names(subject_test) <- "subject.id"
test_df <- cbind(subject_test,y_test,x_test)

## The following code reads in and combines the datasets in the train folder.  It also adds the names found 
## in the features.txt file to the final combined dataset as column names.

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", sep = "")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",sep = "")
names(x_train) <- features$V2
names(y_train) <- "activity"
names(subject_train) <- "subject.id"
train_df <- cbind(subject_train,y_train,x_train)

##This step combines the test and train datasets.

merged_df <- rbind(train_df,test_df)

##The following selects only the columns that have mean or standard deviation measurements as well as the
##subject and activity columns.

subj_index <- grep("subject.id",names(merged_df))
activity_index <- grep("activity",names(merged_df))
mean_index <- grep("mean",names(merged_df))
std_index <- grep("std",names(merged_df))
index_vect <- c(subj_index, activity_index, mean_index, std_index)
index_vect <- sort(index_vect)
merged_df <- merged_df[,index_vect]

#This step assigns the correct activity name to each observation in the merged dataset.

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "")
merged_df$activity <- activity_labels[match(merged_df$activity,activity_labels$V1),"V2"]

#The following code cleans up the variable names to be more readable.

names(merged_df) <- gsub("-",".",names(merged_df))
names(merged_df) <- gsub("mean()","Mean",names(merged_df))
names(merged_df) <- gsub("std()","StdDev",names(merged_df))
names(merged_df) <- sub("f","Freq",names(merged_df))
names_time_index <- grep("^t",names(merged_df))
names_df <- names(merged_df)
names_time <- sub("t","Time",names_df[names_time_index])
names_df[names_time_index] <- names_time
names(merged_df) <-  names_df

##The following code produces the final summarized data set with mean values grouped by subject and activity.

summary_df <- merged_df %>% group_by(subject.id, activity) %>% summarize_all(mean)
summary_names <- names(summary_df)
summary_names[-(1:2)] <- paste0("Avg.of.",summary_names[-(1:2)])
names(summary_df) <- summary_names
View(summary_df)

