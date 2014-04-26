# CodeBook.md
--------------------------------------------

> | Variables & data     | Description|
> | -------------  |:-------------:|
> | `X_train`      |File loaded from `"./train/X_train.txt"`     |
> | `y_train`      |File loaded from `"./train/y_train.txt"`       |
> | `X_test`      |File loaded from `"./test/X_test.txt"`    |
> | `y_test`      |File loaded from `"./test/y_test.txt"`    |
> | `data.train`      |The result when binding `X_train` and `y_train`    |
> | `data.test`      |The result when binding `X_test` and `y_test`    |
> | `dataset.merge`      |Bind `data.train` and `data.test`    |
> | `features`      |File loaded from `"./features.txt"`    |
> | `features.mean`      |Applying `grep` function for `mean()`    |
> | `features.std`      |Applying `grep` function for `std()`    |
> | `features.col`      |Use `sort` function to sort `features.mean` and `features.std`    |
> | `dataset.extract`      |The result of extracting `dataset.merge`    |
> | `dataset.descrip`      |Rename the name of `dataset.extract` and call it `dataset.desctip`    |
> | `labels.name`      |File loaded from `"./activity_labels.txt"`    |
> | `X_train`      |    |
> | `X_train`      |    |
> | `X_train`      |    |
> | `X_train`      |    |

        
        activity.labels <- read.table("./activity_labels.txt")
        # use vector which contains the name of activity
        labels.name <- activity.labels$V2
        # convert it to character type
        labels.name.character <- as.character(labels.name)
        # load library plyr in order to use revalue function to replace
        # the numbers to names
        library(plyr)
        dataset.descrip$Activity <- as.factor(dataset.descrip$Activity)
        dataset.descrip$Activity <-
                revalue(dataset.descrip$Activity, c("1"=labels.name.character[1], 
                                                    "2"=labels.name.character[2], 
                                                    "3"=labels.name.character[3], 
                                                    "4"=labels.name.character[4], 
                                                    "5"=labels.name.character[5], 
                                                    "6"=labels.name.character[6]))
        dataset.labels <- dataset.descrip
        
        
        ## Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject 
        # initialize a new dataframe called "dataset2"
        dataset2 <- data.frame(Activity = labels.name)
        # each loop will generate new column which is binded to dataset2
        for(i in 1:(length(dataset.labels)-1) ) {
                temp <- as.data.frame(tapply(dataset.labels[,i], dataset.labels$Activity, mean))
                names(temp) <- names(dataset.labels[i])
                dataset2 <- cbind(dataset2,temp)
                # modify the name
                names(dataset2[i+1]) <- names(dataset.labels[i])
        }
        # clean the row names
        row.names(dataset2) <- NULL
        # output the result in text file
        write.table(dataset2, file="./dataset2.txt")
        # output the result in csv file
        write.csv(dataset2, file="./dataset2.csv")
        








------------------------------------------------
**willowchan**
*Getting and Cleaning Data Course Project.*