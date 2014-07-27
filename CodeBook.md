==================================================================
Human Activity Recognition Using Smartphones Dataset

THIS CodeBook is a SUBSET/compilation  on the  datasets from

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

files where the fields are available are
 samsungAvgMeanStdOnSubjectActivity.csv  :   mean on measures on Subject and ActivityName on file samsung_activity.csv
 samsung_activity.csv :

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and 
then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. 

From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:
======================================


- In Record five identifying variables
----------------------------------------
-- 

1. ObsnrSubjectType...........Obsrvation number within the original set ( test or train)
1. ...........................(not in samsungAvgMeanStdOnSubjectActivity.csv)
1. SubjectType................test or  train  
1. ..........................(not in samsungAvgMeanStdOnSubjectActivity.csv)
1. Subject....................number of the person  (1 to 30)
1. ActivityNumber.............1 to 6 is the number to de activity name 
1. ...........................(not in samsungAvgMeanStdOnSubjectActivity.csv)
1. ActivityName...............WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING ,STANDING,LAYIN)

-  In Record  measures/features:
--------------------------------
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated 
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
 fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
 (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

 in this selection are only te mean and std vaiables

 

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
angle(): Angle between to vectors.


-  In Record 86 fields:
------------------------

1. tBodyAccMeanX
1. tBodyAccMeanY
1. tBodyAccMeanZ
1. tBodyAccStdX
1. tBodyAccStdY
1. tBodyAccStdZ
1. tGravityAccMeanX
1. tGravityAccMeanY
1. tGravityAccMeanZ
1. tGravityAccStdX
1. tGravityAccStdY
1. tGravityAccStdZ
1. tBodyAccJerkMeanX
1. tBodyAccJerkMeanY
1. tBodyAccJerkMeanZ
1. tBodyAccJerkStdX
1. tBodyAccJerkStdY
1. tBodyAccJerkStdZ
1. tBodyGyroMeanX
1. tBodyGyroMeanY
1. tBodyGyroMeanZ
1. tBodyGyroStdX
1. tBodyGyroStdY
1. tBodyGyroStdZ
1. tBodyGyroJerkMeanX
1. tBodyGyroJerkMeanY
1. tBodyGyroJerkMeanZ
1. tBodyGyroJerkStdX
1. tBodyGyroJerkStdY
1. tBodyGyroJerkStdZ
1. tBodyAccMagMean
1. tBodyAccMagStd
1. tGravityAccMagMean
1. tGravityAccMagStd
1. tBodyAccJerkMagMean
1. tBodyAccJerkMagStd
1. tBodyGyroMagMean
1. tBodyGyroMagStd
1. tBodyGyroJerkMagMean
1. tBodyGyroJerkMagStd
1. fBodyAccMeanX
1. fBodyAccMeanY
1. fBodyAccMeanZ
1. fBodyAccStdX
1. fBodyAccStdY
1. fBodyAccStdZ
1. fBodyAccMeanFreqX
1. fBodyAccMeanFreqY
1. fBodyAccMeanFreqZ
1. fBodyAccJerkMeanX
1. fBodyAccJerkMeanY
1. fBodyAccJerkMeanZ
1. fBodyAccJerkStdX
1. fBodyAccJerkStdY
1. fBodyAccJerkStdZ
1. fBodyAccJerkMeanFreqX
1. fBodyAccJerkMeanFreqY
1. fBodyAccJerkMeanFreqZ
1. fBodyGyroMeanX
1. fBodyGyroMeanY
1. fBodyGyroMeanZ
1. fBodyGyroStdX
1. fBodyGyroStdY
1. fBodyGyroStdZ
1. fBodyGyroMeanFreqX
1. fBodyGyroMeanFreqY
1. fBodyGyroMeanFreqZ
1. fBodyAccMagMean
1. fBodyAccMagStd
1. fBodyAccMagMeanFreq
1. fBodyBodyAccJerkMagMean
1. fBodyBodyAccJerkMagStd
1. fBodyBodyAccJerkMagMeanFreq
1. fBodyBodyGyroMagMean
1. fBodyBodyGyroMagStd
1. fBodyBodyGyroMagMeanFreq
1. fBodyBodyGyroJerkMagMean
1. fBodyBodyGyroJerkMagStd
1. fBodyBodyGyroJerkMagMeanFreq
1. angleOftBodyAccMeanAndgravity
1. angleOftBodyAccJerkMeanAndgravityMean
1. angleOftBodyGyroMeanAndgravityMean
1. angleOftBodyGyroJerkMeanAndgravityMean
1. angleOfXAndgravityMean
1. angleOfYAndgravityMean
1. angleOfZAndgravityMean
