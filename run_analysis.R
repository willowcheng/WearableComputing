        # Step 1: Merges the training and the test sets to create one data set
        # working directory "./UCI HAR Dataset/" 
        # load files used for merging
        X_train <- read.table("./train/X_train.txt")
        y_train <- read.table("./train/y_train.txt")
        X_test <- read.table("./test/X_test.txt")
        y_test <- read.table("./test/y_test.txt")
        # merge training dataframe and test dataframe
        data.train <- cbind(X_train, y_train)
        data.test <- cbind(X_test, y_test)
        # merge two dataframes into one data set
        dataset.merge <- rbind(data.train, data.test)
        
        
        ## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
        # load features.txt
        features <- read.table("./features.txt")
        # I use print(head(feature)) to know the name which support the characters
        # of features
        features.mean <- grep("mean\\(\\)", features$V2)
        features.std <- grep("std\\(\\)", features$V2)
        # order the selected columns
        features.col <- sort(c(features.mean, features.std))
        # select columns in dataset.merge and remain last column (label column)
        dataset.extract <- dataset.merge[,c(features.col,length(dataset.merge))]
        
        
        ## Step 3: Uses descriptive activity names to name the activities in the data set
        # replace the activities' names in features
        # in addition, labels' name is defined as "Activity"
        names(dataset.extract) <- c(as.character(features[features.col, "V2"]), "Activity")
        dataset.descrip <- dataset.extract
        
        ## Step 4: Appropriately labels the data set with descriptive activity names. 
        # load activity_labels.txt
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
        
        
        ## Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
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
        

