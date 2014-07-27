# requierd packages
# Packages plyr and rehape2 should beinstalled
# library(plyr)
# library(reshape2)

# a work directory to write in should be set

# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# must be unzipped in the workindirectory,  so directory UCI HAR Dataset  mut exsist:  <wrkdir>/UCI HAR Dataset/



# run_analysis.R 
##################################################################################################################
# R script called run_analysis.R that does the following. 
# reads the files in <workdir>\UCI HAR Dataset\
# create two  files in the working dir:
# samsungAvgMeanStdOnSubjectActivity.csv  	
# samsung_activity.csv 					
#

#### Workflow: Merges from the UCI HAR Datasets training data  and the  test data :  
#     only  measurements with std or mean in the name from 561 in the source files are selected
##   dataframe FeatureMeta  (dataframe for later colum selection and names)
#        UCI HAR Dataset\features.txt  wil be changed in  dataframe FeatureMeta  to select only the std and mean columns en containing the new colomnamenames
##   dataframe FeatureActivityLabel  (activity label look up) (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING ,STANDING,LAYIN)
#        UCI HAR Dataset\test\activity_labels.txt wil be changed in dataframe FeatureActivityLabel  to be a join tabel to get  activty names

####  test and train flow
####  FOR TEST-subjects (for training is the same and wil be done with a loop, test is used as example )
##   dataframe Featuredata (selected data)
#        UCI HAR Dataset\test\X_test.tx is the data with selected columns via FeatureMeta a dframe Featuredata is made
##   dataframe FeatureDataSubject  (subject column for the data: for every row of data one subject row)
#        UCI HAR Dataset\test\subject_test.txt read into df FeatureDataSubject
##   dataframe FeatureDataActivity (sActivitynumber column for the data: for every row of data one ssActivitynumber row  contains(1:6))
#        UCI HAR Dataset\test\y_test.tx 
##  dataframe compileFeature  is made out of al the above. via cbind and a join

### final result of loop through test and train
##  featureRESULT   is  result of the append of the test en train data and witten to <workdr>/samsung_activity.csv 

##  second  dataset:
##  featureRESULT is grouped on Subject,ActivityName, and a avarage is calculated for the measures  in df meanRESULT
##  file written to <workdir>/samsungAvgMeanStdOnSubjectActivity.csv
##
##  for both files you use the same CodeBook







