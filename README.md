README

This project is intended to import, summarize, and compile the data from the 
"Human Activities Recognition Using Smartphone Dataset"
Version 1.0

These data were compiled by Reyes-Ortiz et al. at www.smartlab.ws

The orginal datafiles
  
These data were recorded on subjects wearing a Samsung Galaxy S II watch via its accelerometer and gyroscope.
  
The program "run_analysis.R" imports the data on six activities, then merges the training and the test sets to:
-Extract only the measurements on the mean and standard deviation for each measurement. 
-Use descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names. 
-Then, it will creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
For each record:
triaxial acceleration in x, y, and z are noted in
triaxial angular velocity is noted in a 561 feature vector with time and frequency domain variables is 
activity labels are denoted in the "activity_labels.txt" file a vector of features were obtained by 
calculating variables from time and frequency domains "features._info.txt"
  
  These activities include:
1  WALKING
2  WALKING_UPSTAIRS
3  WALKING_DOWNSTAIRS
4  SITTING
5  STANDING
6  LAYING

This program extracts and makes a large tidy data set with the information included in both the training and testing data sets
with descriptive variable names.

- each data file is extracted and appropriate labels are added to create a merged datafile, watchdata

- meansdevwatchdata (csv) file is produced, this file includes only the columns that pertain to the mean or standard deviation

- the variable names are simplified to eliminate the parentheses and hyphens.  The overall names were retained, they are identified at the 
archive in the features file.

-  measndevwatchdata is modified to add the named activities as coded by the activityid

finally, this produces a smaller tidy data set, watchsummarydata file (csv), with the averages of each variable for each subject and each activity.
