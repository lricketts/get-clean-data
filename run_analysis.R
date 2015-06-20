# Download zip file containing project data
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, destfile = "./Coursera/data/HAR.zip")

library(data.table)
library(plyr)
library(dplyr)
library(reshape2)

#setwd("./Coursera/data/UCI HAR Dataset")

features <- read.table("features.txt") #Read time and freq. domain variables
labels <- read.table("activity_labels.txt", header = FALSE) #Read activity labels
names(labels)[names(labels) == "V1"] <- "activityCode"
names(labels)[names(labels) == "V2"] <- "activity"

y_train <- read.table("./train/y_train.txt", header = FALSE) #Read training labels
names(y_train)[names(y_train) == "V1"] <- "activityCode"
X_train <- read.table("./train/X_train.txt", header = FALSE) #Read training set
names(X_train) <- features[ ,2] #Assign variable labels
subject_train <- read.table("./train/subject_train.txt") #Read training subjects
names(subject_train)[names(subject_train) == "V1"] <- "subject"
train <- cbind(subject_train, y_train, X_train) #Combine training data frames
train <- merge(labels, train, by = "activityCode") #Assign activity labels


y_test <- read.table("./test/y_test.txt", header = FALSE) #Read test labels
names(y_test)[names(y_test) == "V1"] <- "activityCode"
X_test <- read.table("./test/X_test.txt", header = FALSE) #Read test set
names(X_test) <- features[ ,2] #Assign variable labels
subject_test <- read.table("./test/subject_test.txt") #Read test subjects
names(subject_test)[names(subject_test) == "V1"] <- "subject"
test <- cbind(subject_test, y_test, X_test) #Combine test data frames
test <- merge(labels, test, by = "activityCode") #Assign activity labels

rm(list = c("y_test", "X_test", "subject_test", "y_train", "X_train", 
            "subject_train", "features", "labels")) #Clear unused objects

allobs <- rbind(test, train) #Combine test and training data frames

rm(list = c("test", "train")) #Clear unused objects

ids <- allobs[ ,2:3]
means <- allobs[ ,grep("-mean()", names(allobs))] #Isolate variables of mean
drops <- grep("Freq", names(means)) #Identify columns with meanFreq
means <- subset(means, select = -drops) #Remove meanFreq variables

stds <- allobs[ ,grep("-std()", names(allobs))] #Isolate variables with std

meanstd <- cbind(ids, means, stds) #Combine variables with mean and std

# Check that subjects did all activities
if (all(table(meanstd$subject, meanstd$activity) > 0) == FALSE) {
        stop("Check data processing steps, missing data for subjects")
}
# Aggregate data by calculating mean of variables by subject and activity
tidydata <- aggregate(meanstd[ , 3:68], by=list(subject, activity), FUN = mean,
                     na.rm = TRUE)
tidydata <- rename(tidydata, subject = Group.1, activity = Group.2)

# Output tidy data set as a text file
write.table(tidydata, file= "./tidydata.txt", row.names = FALSE)
