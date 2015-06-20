# STUDY DESIGN

The tidydata.txt data set was created by Lowell Ricketts for use in the course project
required by the Getting and Cleaning Data Coursera class. The tidydata.txt dataset
was created with the run_analysis.R script using an original dataset provided by the UCI
Machine Learning Repository. The zip file which contains the original data can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

"The experiments have been carried out with a group of 30 volunteers within an age 
bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have 
been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters 
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated 
using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was 
used. From each window, a vector of features was obtained by calculating variables from the time 
and frequency domain."

# PROCESSING DESCRIPTION

The data was downloaded and read into R and the run_analysis.R script carries out all of the 
maniuplations to the original data to produce the final tidy dataset. The script reads in
y_train, x_train, and subject_train and appends the three data frames together before merging
with activity_labels by the activityCode. Likewise, the same process is used for the test
files. The subsequent two data frames are then appended row-wise to assemble the full dataset. 
Per project instructions only the variables which provide the mean and standard deviation of the 
raw signals are kept for further processing. The final independent tidy dataset is created (per 
project instructions) by calculating the mean of each variable by both subject and activity. 
This final dataset is then written to the tidydata.txt file and loaded to github.


# CODE BOOK

## ORIGINAL DATA

The variables selected for this database come from the accelerometer and gyroscope 3-axial 
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter 
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration 
signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a 
corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to 
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, 
tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

From the list of various functions applied to the original variables only the mean and 
standard deviation were included in the analysis run to create the tidydata.txt file.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## VARIABLES IN TIDY DATASET (68 TOTAL)

This tidy dataset was created by taking the mean of each variable by subject and 
activity. There were 30 subjects involved in the original experiment which yielded
the raw signals. Those subjects each performed six physical activities: laying, 
sitting, standing, walking, walking upstairs, and walking downstairs. NOTE: the 
mean by subject and activity was calculated using variables which already measured 
the mean and standard deviation of the raw signals. Aside from "subject" and "activity"
all other variables will have the same units as in the original data set. Subject is
a participant id (integer between 1 and 30) while activity is one of six character strings
(SITTING, LAYING, STANDING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS).

 [1] "subject"                    
 [2] "activity"                   
 [3] "tBodyAcc-mean()-X"          
 [4] "tBodyAcc-mean()-Y"          
 [5] "tBodyAcc-mean()-Z"          
 [6] "tGravityAcc-mean()-X"       
 [7] "tGravityAcc-mean()-Y"       
 [8] "tGravityAcc-mean()-Z"       
 [9] "tBodyAccJerk-mean()-X"      
[10] "tBodyAccJerk-mean()-Y"      
[11] "tBodyAccJerk-mean()-Z"      
[12] "tBodyGyro-mean()-X"         
[13] "tBodyGyro-mean()-Y"         
[14] "tBodyGyro-mean()-Z"         
[15] "tBodyGyroJerk-mean()-X"     
[16] "tBodyGyroJerk-mean()-Y"     
[17] "tBodyGyroJerk-mean()-Z"     
[18] "tBodyAccMag-mean()"         
[19] "tGravityAccMag-mean()"      
[20] "tBodyAccJerkMag-mean()"     
[21] "tBodyGyroMag-mean()"        
[22] "tBodyGyroJerkMag-mean()"    
[23] "fBodyAcc-mean()-X"          
[24] "fBodyAcc-mean()-Y"          
[25] "fBodyAcc-mean()-Z"          
[26] "fBodyAccJerk-mean()-X"      
[27] "fBodyAccJerk-mean()-Y"      
[28] "fBodyAccJerk-mean()-Z"      
[29] "fBodyGyro-mean()-X"         
[30] "fBodyGyro-mean()-Y"         
[31] "fBodyGyro-mean()-Z"         
[32] "fBodyAccMag-mean()"         
[33] "fBodyBodyAccJerkMag-mean()" 
[34] "fBodyBodyGyroMag-mean()"    
[35] "fBodyBodyGyroJerkMag-mean()"
[36] "tBodyAcc-std()-X"           
[37] "tBodyAcc-std()-Y"           
[38] "tBodyAcc-std()-Z"           
[39] "tGravityAcc-std()-X"        
[40] "tGravityAcc-std()-Y"        
[41] "tGravityAcc-std()-Z"        
[42] "tBodyAccJerk-std()-X"       
[43] "tBodyAccJerk-std()-Y"       
[44] "tBodyAccJerk-std()-Z"       
[45] "tBodyGyro-std()-X"          
[46] "tBodyGyro-std()-Y"          
[47] "tBodyGyro-std()-Z"          
[48] "tBodyGyroJerk-std()-X"      
[49] "tBodyGyroJerk-std()-Y"      
[50] "tBodyGyroJerk-std()-Z"      
[51] "tBodyAccMag-std()"          
[52] "tGravityAccMag-std()"       
[53] "tBodyAccJerkMag-std()"      
[54] "tBodyGyroMag-std()"         
[55] "tBodyGyroJerkMag-std()"     
[56] "fBodyAcc-std()-X"           
[57] "fBodyAcc-std()-Y"           
[58] "fBodyAcc-std()-Z"           
[59] "fBodyAccJerk-std()-X"       
[60] "fBodyAccJerk-std()-Y"       
[61] "fBodyAccJerk-std()-Z"       
[62] "fBodyGyro-std()-X"          
[63] "fBodyGyro-std()-Y"          
[64] "fBodyGyro-std()-Z"          
[65] "fBodyAccMag-std()"          
[66] "fBodyBodyAccJerkMag-std()"  
[67] "fBodyBodyGyroMag-std()"     
[68] "fBodyBodyGyroJerkMag-std()" 
