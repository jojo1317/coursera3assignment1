=============================================================================================
Information about the features selected
=============================================================================================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Time.Acceleration.XYZ (tAcc-XYZ) and Time.Gyroscope.XYZ (tGyro-XYZ). These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time.Body.Acceleration.XYZ and time.Gravity.Acceleration.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time.Body.Acceleration.Jerk.XYZ and Time.Body.Gyroscope.Jerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time.Body.Acceleration.Magnitude, Time.Gravity.Acceleration.Magnitude, Time.Body.Acceleration.Jerk.Magnitude, Time.Body.Gyroscope.Magnitude, Time.Body.Gyroscope.Jerk.Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Frequency.Body.Acceleration.XYZ, Frequency.Body.Acceleration.Jerk.XYZ, Frequency.Body.Gyroscope.XYZ, Frequency.Body.Acceleration.Jerk.Magnitude, Frequency.Body.Gyroscope.Magnitude, Frequency.Body.Gyroscope.Jerk.Magnitude. 

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- Time.Body.Acceleration.XYZ
- Time.Gravity.Acceleration.XYZ
- Time.Body.Acceleration.Jerk.XYZ
- Time.Body.Gyroscope.XYZ
- Time.Body.Gyroscope.Jerk.XYZ
- Time.Body.Acceleration.Magnitude
- Time.Gravity.Acceleration.Magnitude
- Time.Body.Acceleration.Jerk.Magnitude
- Time.Body.Gyroscope.Magnitude
- Time.Body.Gyroscope.Jerk.Magnitude
- Frequency.Body.Acceleration.XYZ
- Frequency.Body.Acceleration.Jerk.XYZ
- Frequency.Body.Gyroscope.XYZ
- Frequency.Body.Acceleration.Magnitude
- Frequency.Body.Acceleration.Jerk.Magnitude
- Frequency.Body.Gyroscope.Magnitude
- Frequency.Body.Gyroscope.Jerk.Magnitude

=============================================================================================
Information about variables that were estimated from these signals
=============================================================================================
The set of variables that were estimated from these signals are: 

- Mean(): Mean value
- STD(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- Gravity.Mean
- time.Body.Acceleration.Mean
- time.Body.Acceleration.Jerk.Mean
- time.Body.Gyroscope.Mean
- time.Body.Gyroscope.Jerk.Mean

However, we currently use only **Mean** and **STD** (Standard deviation) for the tidy data set.

=============================================================================================
Information about transformations performed to clean up the data
=============================================================================================
1. The training and the test sets were merged to create one data set.
2. Only measurements on the mean and standard deviation were extracted.
3. Descriptive activity names were used to name the activities in the data set
4. Descriptive variable names were used to label the data set. 
5. An independent tidy data set with the average of each variable for each activity and each subjectCreates were created and submitted.

For details of each step, please read "README.md" or comments in "run_analysis.R".

=============================================================================================
Notes
=============================================================================================
Features are normalized and bounded within [-1,1]. So there are no units for these values.

