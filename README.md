# Run_analysis

This is a readme for the R file Run_analysis.
The script returns a tidy data set from the data in the next URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The next steps show how the script changes the data into tidy data:
1. The script reads the data from the directory in R. (X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, activity_labels.txt,
    features.txt)
2. The test and train sets are merged to create one data set.
3.  Renames the column names to appropriate column names from features.txt.
4.  Use descriptive activity names to name the activities in the data set.
5.  Extracts only the measurements on the mean and std for each measurement.
6.  The last step creates a data set with the average of each variable for each activity and each subject.
1. The raw data.
The variable names( column names etc) and explanation are added in the codebook.
