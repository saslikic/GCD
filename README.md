# GCD
Both test and training set have 561 features which are unlabeled and can be found in the x_test.txt and x_train.txt.
The activity labels are in the y_test.txt and in the y.train.txt file while the test subjects are in the subject_test.txt and subject_train.txt file.
 
The script run_analysis.R merges the test and training sets together.
After merging, labels are added and only columns that have to do with mean and SD are kept.
For this the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset".

Finally, a tidy data set named tidy_data_set.txt can be found in this repository.
