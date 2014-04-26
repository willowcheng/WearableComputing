Genaral ideas of each stage
=================
----------------------------------------
- **step 1** *Merges the training and the test sets to create one data set*

    1. Set current working directory as `"./UCI HAR Dataset/"`
    2. I load files needed in step 1
    3. Then, I merge them by using `cbind` and `rbind` functions
    4. The result of step 1 is called `dataset.merge`
- **step 2** *Extracts only the measurements on the mean and standard deviation for each measurement*
    1. Load `feature.txt`
    2. I use `grep` function to get the columns which is needed
    3. Order the result after applying `sort` since I use two variables called `features.mean` and `features.std`
    4. Use this vector to select columns in `dataset.merge`
    5. The result in this step is `dataset.extract`
- **step 3** *Uses descriptive activity names to name the activities in the data set*
    1. Simply replace the names of `dataset.extract` by using names in `features.txt`
    2. The result in this step is `dataset.descrip`
- **step 4** *Appropriately labels the data set with descriptive activity names*
    1. Load `activity_labels.txt`
    2. In order to replace numbers by names, I use the library of `plyr`
    3. `revalue` function is used to replace and some temp variables are made
    4. The result in this step is `dataset.labels`
- **step 5** *Creates a second, independent tidy data set with the average of each variable for each activity and each subject*
    1. Initialize a new dataframe called `dataset2`
    2. I use a `for` loop to `cbind` every single variablegenerated by using `tapply` function
    3. Row names are not needed so that I set `dataset2`'s row names to `NULL`
    4. The resuilt in this step is `dataset2`
    5. Finally, I use `write.table` as well as `write.csv` to write output file

----------------------------------
**willowChan**
*Getting and Cleaning Data Course Project.*
