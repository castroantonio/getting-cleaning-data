#### **** Getting and Cleaning Data Course Project **** ####

### Create one R script that does the following:

## 1. Merges the training and the test sets to create one data set.
x_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
label <- read.table(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "", col.names = "label")
x_train <- cbind(x_train, label)

x_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
label <- read.table(file = "UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "", col.names = "label")
x_test <- cbind(x_test, label)

result_1 <- rbind(x_train, x_test)  # 1. done!!!


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# I understand "Extracts" as remove from the dataset
# A tidy dataset wouldn't have calculated values
features <- read.table(file = "UCI HAR Dataset/features.txt", header = FALSE, sep = "", stringsAsFactors = FALSE)
index <- grep(pattern = "std()|mean()", x = features$V2, ignore.case = TRUE )

result_2 <- result_1[ , -index]  # 2. done!!!


## 3. Uses descriptive activity names to name the activities in the data set
string_label <- read.table(file = "UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "", stringsAsFactors = FALSE)

result_3 <- merge(result_2, string_label, by.x = "label", by.y = "V1", all.x=TRUE)
result_3$label <- NULL # 3. done!!!


## 4. Appropriately labels the data set with descriptive variable names. 
features <- features[- index, ]
features <- rbind(features, c(nrow(features) + 1, "activity"))

features$V2 <- gsub("^t", "time", features$V2)
features$V2 <- gsub("^f", "frequency", features$V2)
features$V2 <- gsub("Acc", "Acceleration", features$V2)
features$V2 <- gsub("Mag", "Magnitude", features$V2)
features$V2 <- gsub("Gyro", "Gyroscope", features$V2)
features$V2 <- gsub("mad()", "Median", features$V2)
features$V2 <- gsub("max()", "Largest", features$V2)
features$V2 <- gsub("sma()", "SignalMagnitudeArea", features$V2)
features$V2 <- gsub("energy()", "Energy", features$V2)
features$V2 <- gsub("iqr()", "InterquartileRange", features$V2)
features$V2 <- gsub("entropy()", "Entropy", features$V2)
features$V2 <- gsub("arCoeff()", "AutorregresionCoefficients", features$V2)
features$V2 <- gsub("maxInds()", "LargestMagnitudeIndex", features$V2)
features$V2 <- gsub("meanFreq()", "WeightedAverageFrequency", features$V2)
features$V2 <- gsub("skewness()", "FrequencySkewness", features$V2)
features$V2 <- gsub("kurtosis()", "FrequencyKurtosis", features$V2)
features$V2 <- gsub("bandsEnergy()", "EnergyFrequencyInterval", features$V2)
features$V2 <- gsub("angle()", "Angle", features$V2)

result_4 <- result_3
colnames(result_4) <- features$V2 # 4. done!!!

write.table(result_4, "tidy_dataset.txt", row.name=FALSE)


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
result_5 <- aggregate(. ~activity, result_4, mean)

write.table(result_5, "second_independent_tidy_dataset.txt", row.name=FALSE) # 5. done!!!
