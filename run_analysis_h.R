

library(plyr)
library(reshape2)

# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# must be unzipped in the workindirectory,  so directory UCI HAR Dataset  mut exsist in wrkdir

#begin#### project def
##################################################################################################################
# R script called run_analysis.R that does the following. 
# create two  files:
#
####file one : 
####   Workflow: Merge from the UCI HAR Dataset:  
#   trainingdata  and the  test data  , only  measurements with std or mean in the name from 561 in the source files,
#     identifying columms  "ObsnrSubjectType",SubjectType","Subject","ActivityNumber","ActivityName"    
#   using subject (person number) actvity, and sourceset (test or train) indication
#    ###@ testsets
#    ###UCI HAR Dataset\test\X_test.txt  data   with subjectnumbers  for rows in the data in  UCI HAR Dataset\test\subject_test.txt
#                                               with activitynumbers for rows in the data in  UCI HAR Dataset\test\y_test.txt
#    ###@ train sets
#    ###The same set of 4, for train directories and files ar available
#   definition measurements 561 columns             in UCI HAR Dataset\features.txt  and features_info.txt
#   definition activity labels (number and name) 7, in UCI HAR Dataset\test\activity_labels.txt
#### RESULT (in work dir)
#    samsung_activity.txt  data inorkdir
#
#####file two :
####   Workflow calculates average of the measuements on "Subject", "ActivityName" in file one
#
##################################################################################################################

#end#### project def

#begin# FeatureMeta
##################################################################################################################
# get  column positions and names for mean and std columns,for later data selections
##   FeatureMeta  wil contain  columnumber to select and the std and mean columns out of feature data
# colpos      : field postion  
# colname     : old fieldname 
# colnameNew  : tidy name for use in de ouput
##################################################################################################################

# read columnames and column positions
FeatCol_base <- read.csv("UCI HAR Dataset/features.txt"
                         ,sep=" ",header=F,strip.white=T,blank.lines.skip=T,stringsAsFactors=F)

#select only columns/fields with std and mean values
FeatureMeta <- FeatCol_base[which(grepl("[mM]ean|[Ss]td",FeatCol_base[,2])),]
# names to the columns
names(FeatureMeta) <- c("colpos","colname")

# create new columnnames via initcap words and removal of
#   _ - ( ) and comma's 
#
FeatureMeta$colnameNew <- gsub( "-mean\\(\\)(-|)","Mean",FeatureMeta$colname)     # -mean() or -mean()- to Mean 
FeatureMeta$colnameNew <- gsub( "-std\\(\\)(-|)","Std",FeatureMeta$colnameNew)    # -std() or -std()- to Std 
FeatureMeta$colnameNew <- gsub( "-meanFreq\\(\\)(-|)","MeanFreq",FeatureMeta$colnameNew) #  -meanFreq() or -meanFreq()- to MeanFreq 
FeatureMeta$colnameNew <- gsub( "angle\\(","angleOf",FeatureMeta$colnameNew)             # angle(  to angleOf
FeatureMeta$colnameNew <- gsub( "\\)","",FeatureMeta$colnameNew)                         #  )  gone
FeatureMeta$colnameNew <- gsub( "\\,","And",FeatureMeta$colnameNew)                      #  ,  gone
#FeatureMeta
#
##################################################################################################################
#end# FeatureMeta 

#begin# FeatureActivityLabel
##################################################################################################################
# geting the lookup/mergetable for activities
# FeatureActivityLabel with two columns:
#  ActivityNumber (1,2,3,5,6)
#  ActivityName   (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING ,STANDING,LAYIN)
# 
FeatureActivityLabel <- read.csv("UCI HAR Dataset/activity_labels.txt"
                                 ,sep=" ",header=F,strip.white=T,blank.lines.skip=T,stringsAsFactors=F)

names(FeatureActivityLabel) = c("ActivityNumber","ActivityName")
#FeatureActivityLabel

##################################################################################################################
#end# activity labels


#begin# featureRESULT creation
##################################################################################################################
# featureRESULT is the dataframe that becomes the resultfile one samsung_activity.txt
#   identifying columms  "ObsnrSubjectType    Observationnummer within the test or train set
#                         SubjectType         test or train
#                         Subject             number of  person
#                         ActivityNumber
#                         ActivityName

# featuredata read form file and select columns with FeatureMeta$colpos containng column to get

# LOOP with test entrain as parmeter
# the data for the trian and test is the same 
# looping with parameter test or train and appending the data is done

type <- c("train","test")     # values to loop through
firstLOOP <- TRUE             # switch inicator first loop run
## begin LOOP with test entrain as parmeter
#  selection of files test or train is done by gsub() in the read.table commands
for ( Ftype in type ) {
    # read data and select only std and mean via 
    Featuredata <- read.table(gsub("test",Ftype,"UCI HAR Dataset/test/X_test.txt")  # substitute test or train
                              ,sep="",header=F
                              ,strip.white=T
                              ,blank.lines.skip=T
                              ,stringsAsFactors=F)[,FeatureMeta$colpos]

    # prepared names 
    names(Featuredata) <- FeatureMeta$colnameNew
    
    # read the subjects list for the feature data obsevations and set column-name
    FeatureDataSubject <- read.table(gsub("test",Ftype,"UCI HAR Dataset/test/subject_test.txt")
                                     ,sep="",header=F
                                     ,strip.white=T,col.names=c("Subject")
                                     ,blank.lines.skip=T)
    
    # read the activities list for the feature data obsevations and set column-name
    FeatureDataActivity <- read.table(gsub("test",Ftype,"UCI HAR Dataset/test/y_test.txt")
                                      ,sep="",header=F
                                      ,strip.white=T,col.names=c("ActivityNumber")
                                      ,blank.lines.skip=T)
    
    # generate ObsnrSubjectType SubjectType Subject ActivityNumber ActivityName via cbind and join to activitylabel
    #ObsnrSubjectType SubjectType Subject ActivityNumber ActivityName
    #4572     1        test       1              5     STANDING
    #4573     2        test       1              5     STANDING
    compileFeature <- arrange( 
                               join(
                                    cbind(     # get all the identifying colums 
                                           ObsnrSubjectType=seq_along(FeatureDataSubject[,1])   # Original observationnr
                                          ,SubjectType=Ftype                         # subject type
                                          ,FeatureDataSubject                        # subject nr
                                          ,FeatureDataActivity                       # activity nr
                                    )
                                    ,FeatureActivityLabel                            # activitylabel to join (STANDING ....)
                              )
                              ,ActivityNumber                                        # join key
                      )
    # order is wrong (is on join values)
    # re-order on observation-number so the cbind wil be correct
    compileFeature <- compileFeature[order(compileFeature$ObsnrSubjectType),]
    #head(compileFeature,2)
    
    # add the featuredata measures
    compileFeature <- cbind(compileFeature,Featuredata)
    #head(compileFeature,2)
    
    # create in first loop run, append in furter run
    if ( firstLOOP == TRUE ) {
          featureRESULT <- compileFeature
          firstLOOP <- FALSE 
    } else {
        featureRESULT <- rbind(featureRESULT,compileFeature)
    }

 }

write.table(featureRESULT, file = "samsung_activity.csv", append = FALSE, quote = F, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = F,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")


#head(featureRESULT,1)
#tail(featureRESULT,1)
#names(featureRESULT)

##wendel hopeCOMMUNITY TA# 7 days ago Posted in Clarification on instructions
##Easiest way to clarify ...
##
##Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement. 
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names. <<< This is the end of activities with the first table
##                                                                   .  Do not turn that one in.
##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##     <<< This is the second table. It is created by summarizing the data in the first. 
##         Submit this one on the course Project page (upload, not cut&paste).


## aggregate via de melt and dcat methods in reshape2 package

# melt to id and rest of the columns(measure.vars)
reshapeRESULT <- melt(featureRESULT
                       ,id=c("Subject", "ActivityName")
                       ,measure.vars=FeatureMeta$colnameNew
                 ) 
# mean on Subject+ActivityName for al Subject+ActivityName
meanRESULT    <- dcast(reshapeRESULT,Subject+ActivityName ~variable,mean)

# wrtie on filesystem
write.table(meanRESULT, file = "samsungAvgMeanStdOnSubjectActivity.csv", append = FALSE, quote = F, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = F,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

# end

