#### Getting and Cleaning Data Course Project

This repositiry contains the project for the Coursera Getting and Cleaning Data course with referenced files.

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.

The goal is to prepare tidy data that can be used for later analysis.

The script run_analysis.R details the work to create the tidy_dataset.txt and the second_independent_tidy_dataset.txt from the original files from the UCI HAR Dataset.

The steps taken:
<ol>
  <li>Merge the training and the test sets to create one data set.</li>
  <li>Extract only the measurements on the mean and standard deviation for each measurement.</li>
  <li>Uses descriptive activity names to name the activities in the data set.</li>
  <li>Appropriately label the data set with descriptive variable names. </li>
  <li>Creates an independent tidy data set with the average of each variable for each activity and each subject.</li>
<ol>

Files: 
 - CodeBook.md - describes the variables, the data, and any transformations or work performed to clean up the data.
 - run_analysis.R - R script for performing the analysis.
 - tidy_dataset.txt - Merges the training and the test sets, without the mean and standard deviation for each measurement, uses descriptive activity names to name the activities in the data set and appropriately labels the data set with descriptive variable names. 
