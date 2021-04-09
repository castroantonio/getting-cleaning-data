The files from UCI HAR Dataset are used as input by the "run_analysis.R" file.

It is a script that performs the following steps:

Takes columns names from "UCI HAR Dataset/features.txt".

Train data from "UCI HAR Dataset/train/" directory, files "X_train.txt", "subject_train.txt", and "y_train.txt" are joined.

Test data from "UCI HAR Dataset/test/" directory, files "X_test.txt", "subject_test.txt", and "y_test.txt" are joined.

So the trains and test data are merged.

Then the measurements on the mean and standard deviation for each measurement are extracted.

Subtitute the activity indexex for descriptive activity names from the "UCI HAR Dataset/activity_labels.txt" file.

Appropriately label the data set with descriptive variable names. Short names are replace for descriptive ones:
"^t" = "time"
"^f" = "frequency"
"Acc" = "Acceleration"
"Mag" = "Magnitude"
"Gyro" = "Gyroscope"
"mean()" = "Mean"
"std()" = "StandardDeviation"
"mad()" = "Median"
"max()" = "Largest"
"sma()" = "SignalMagnitudeArea"
"energy()" = "Energy"
"iqr()" = "InterquartileRange"
"entropy()" = "Entropy"
"arCoeff()" = "AutorregresionCoefficients"
"maxInds()" = "LargestMagnitudeIndex"
"meanFreq()" = "WeightedAverageFrequency"
"skewness()" = "FrequencySkewness"
"kurtosis()" = "FrequencyKurtosis"
"bandsEnergy()" = "EnergyFrequencyInterval"
"angle()" = "Angle"

And finally created an independent tidy data set with the average of each variable for each activity and each subject,  "tidy_dataset.txt".

