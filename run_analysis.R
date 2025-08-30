run_analysis <- function () {
  
# This function will: 
# Merges the training and the test sets to create one data set.
#   Extract only the measurements on the mean and standard deviation for each measurement. 
#   Use descriptive activity names to name the activities in the data set
#   Appropriately labels the data set with descriptive variable names. 
#   Then, it wil
#     creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  ##fix limited max.print default in R version
  options("max.print" = 9999999)
 
   
 #load library
  library(dplyr)
    

   
#download the files, then unzip to present working directory for R Studio under UCIHARDataset 
    
    
# import name files
    activitylabels <- read.table("UCIHARDataset\\activity_labels.txt", header = FALSE, col.names = c("activityid", "activity"))
    features <- read.table("UCIHARDataset\\features.txt",header = FALSE, col.names = c("n", "functions")) 
   
# import train files  
    subjecttrain <- read.table("UCIHARDataset\\train\\subject_train.txt", col.names = "subject") # vector of subject ID, 7352 rows
    ytrain <- read.table("UCIHARDataset\\train\\Y_train.txt", col.names = "activityid") # 1x7353 dataset, indicates activity ID
    xtrain <- read.table("UCIHARDataset\\train\\X_train.txt", col.names = features$functions) # 562x7354 dataset, headers = Features
 
          #merge training data into one data frame
          trainingdata <- cbind(c(subjecttrain, ytrain, xtrain))
 
      
# import test files
   subjecttest <- read.table("UCIHARDataset\\test\\subject_test.txt", col.names = "subject") # vector of subject ID, 2947 rows
   ytest <- read.table("UCIHARDataset\\test\\Y_test.txt", col.names = "activityid") # 1x2947 dataset, indicates activity ID
   xtest <- read.table("UCIHARDataset\\test\\X_test.txt", col.names = features$functions) # 562x2947 dataset, headers = Features


        #merge test data into one data frame
         testingdata <- cbind(c(subjecttest, ytest, xtest))

         
# Question 4 - Ensure that variable names are descriptive, which I interpret as removing extraneous features 
# and adding names to new columns
         
         cleancolumns <- gsub("\\(\\)","",features$functions)
         cleancolumns <- gsub("-","",cleancolumns)
         watchcolnames <- c("subject","activityid", cleancolumns)
       
         
# Question 1 
# merge data into one file          
  
            watchdata <- rbind(trainingdata,testingdata)
            names(watchdata) <- watchcolnames
            
          
# Question 2  
# Extract the mean and standard deviation data for each measurement
     
     meansitems <- grep("mean",watchcolnames)
     stditems <- grep("std",watchcolnames)
     colofinterest <- c(meansitems,stditems)
     interestcolumns <- sort(c(1,2,colofinterest))
     meansdevwatchdata <- watchdata[interestcolumns,]
     write.csv(meansdevwatchdata,file = "meansdevwatchdata.csv")
  

  # Question 3  
  # change values in Variable "activity" to activity names rather than data codes
     

    activitydata <- merge(meansdevwatchdata, activitylabels, by = "activityid") %>%
        relocate(activityid, .after = activityid)
  
  
# Question 5, create a tidy data set with the average          
# for each activity for each subject 
  
 
    watchsummarydata <- activitydata %>% 
      group_by(subject, activity) %>%
      summarise_all(mean)
    
  write.csv(watchsummarydata,file = "watchsummarydata.csv") 
  
  
}