Variable List in CleandedData file
=========================================
1. Subject Number:  1:30 [volunteers within an age bracket of 19-48 years] - An    identifier of the subject who carried out the experiment
2. Activity:  1 WALKING
              2 WALKING_UPSTAIRS
              3 WALKING_DOWNSTAIRS
              4 SITTING
              5 STANDING
              6 LAYING
  - It is just activity labels          
3. 3 to 66. are variables (vector with time and frequency domain variables) with following descriptisson:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

      mean(): Mean value, variables from 3:36
      std(): Standard deviation, variables from 36:66
      

Row Data set includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 




How the data was prepared:
=========================================

1. Raw data were downloaded and unzip 
2. Important tables were read into R
3. In y_test and y_train file I changed category names to names from file activity_labels.txt
I have also cut off the numbers that begin every label "1 WALKING"
4. Using data from features.txt i changed the names of columns in x_test and x_train files.
5. I have also here cut off the numbers that begin every variable name
6. Using Regular expresion and grep function i found variables which shows means() and std() and index this x_train and x_test data sets to have only this varriables
7. I was not sure if i should use Inertial Signals data, so i wrote code as an option
   to download this data, label it and add to the final cleaned Data set
8. I merged separately Test data set and Train data set (same column names)
9. Using aggregate function i prepare secound clean data sets which shows the average of each variable for each activity and each subject.
10. Activity column and subject column were also rename
11. I wrote final clean sets into hardrive in R directory
