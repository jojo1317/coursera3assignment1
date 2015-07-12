=============================================================================================
Information about the original dataset
=============================================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

=============================================================================================
Information about the analysis files submitted
=============================================================================================
The tidy data set comes with three files:

- run_analysis.R: script for performing the analysis.
- CodeBook.md: code book that describes the variables, the data, and any transformations or work that were performed to clean up the data.
- README.md: This file that explains what the analysis files did. 

=============================================================================================
Information about the analysis steps in "run_analysis.R" 
=============================================================================================
(This information is also available together with r code in "run_analysis.R")

1.Merges the training and the test sets to create one data set.

- Read in subject/X/y from the training set.
- Read in subject/X/y from the test set.
- Combine the training and test data frames into 1 data frame called "CompleteTable".

2.Extracts only the measurements on the mean and standard deviation for each measurement. 

- Read in the names of the selected features.
- Select only measurements from "CompleteTable" on the mean and standard deviation; subtract these measurements to generate a new data frame called "sub.mean.std" ('Subject' and 'Activity' are not included in "sub.mean.std").

3.Uses descriptive activity names to name the activities in the data set.

- Read in the activity number and names.
- Join the measurement table with label table, and use actual names to replace the numbers for activities.
- Add the columns "Activity" and "Subject" back and create a new data set "MeanStdTbl".

4.Appropriately labels the data set with descriptive variable names. 

- Rename the added columns, name them consistent with the previous columns.
- Create a new data frame "NewVarList" with newly-added column numbers and expected names.
- Combine the new data frame with old one.
- Create a new integer vector "VarUsed" that includes the column numbers of the selected features, activity,and subject number.
- Rename the table "MeanStdTbl" with new column names from "NewVarList".
- Legalize the column names.

5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

- Group by the table "MeanStdTbl" by columns "activity" and "subject"
- Calculate the mean under each combination of "activity" and "subject"
- Write the table in the form of .txt.


