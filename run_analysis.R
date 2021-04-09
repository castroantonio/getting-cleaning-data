#### **** Getting and Cleaning Data Course Project **** ####

### Create one R script that does the following:

## 1. Merges the training and the test sets to create one data set.

# columns names
features <- read.table(file = "UCI HAR Dataset/features.txt", header = FALSE, sep = "", stringsAsFactors = FALSE)

# train data
x_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
colnames(x_train) <- features$V2
temp <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "", col.names = "subject")
x_train <- cbind(x_train, temp)
temp <- read.table(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "", col.names = "label")
x_train <- cbind(x_train, temp)

#test data
x_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
colnames(x_test) <- features$V2
temp <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "", col.names = "subject")
x_test <- cbind(x_test, temp)
temp <- read.table(file = "UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "", col.names = "label")
x_test <- cbind(x_test, temp)

#merge train and test data
result_1 <- rbind(x_train, x_test)  



## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
index <- grep(pattern = "std|mean", x = features$V2, ignore.case = TRUE )  ## keeps only mean and standar deviation

columns <- ncol(result_1)
result_2 <- result_1[ , c(index, columns-1, columns)]  ## keeps also subject and label attributes



## 3. Uses descriptive activity names to name the activities in the data set
string_label <- read.table(file = "UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "", stringsAsFactors = FALSE, col.names = c("V1", "activity"))

result_3 <- merge(result_2, string_label, by.x = "label", by.y = "V1", all.x=TRUE)
result_3$label <- NULL  ## removes activity labels index (y_)



## 4. Appropriately labels the data set with descriptive variable names. 
result_4 <- result_3

column_names <- colnames(result_4)
column_names <- gsub("^t", "time", column_names)
column_names <- gsub("^f", "frequency", column_names)
column_names <- gsub("Acc", "Acceleration", column_names)
column_names <- gsub("Mag", "Magnitude", column_names)
column_names <- gsub("Gyro", "Gyroscope", column_names)
column_names <- gsub("mean()", "Mean", column_names)
column_names <- gsub("std()", "StandardDeviation", column_names)
column_names <- gsub("mad()", "Median", column_names)
column_names <- gsub("max()", "Largest", column_names)
column_names <- gsub("sma()", "SignalMagnitudeArea", column_names)
column_names <- gsub("energy()", "Energy", column_names)
column_names <- gsub("iqr()", "InterquartileRange", column_names)
column_names <- gsub("entropy()", "Entropy", column_names)
column_names <- gsub("arCoeff()", "AutorregresionCoefficients", column_names)
column_names <- gsub("maxInds()", "LargestMagnitudeIndex", column_names)
column_names <- gsub("meanFreq()", "WeightedAverageFrequency", column_names)
column_names <- gsub("skewness()", "FrequencySkewness", column_names)
column_names <- gsub("kurtosis()", "FrequencyKurtosis", column_names)
column_names <- gsub("bandsEnergy()", "EnergyFrequencyInterval", column_names)
column_names <- gsub("angle()", "Angle", column_names)
column_names <- gsub("()", "", column_names)

colnames(result_4) <- column_names



## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
result_5 <- aggregate(. ~activity + subject, result_4, mean)

write.table(result_5, "tidy_dataset.txt", row.name=FALSE, col.names = TRUE)
