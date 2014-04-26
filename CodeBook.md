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
> | `activity.labels`      |File loaded from `"./activity_labels.txt"`    |
> | `labels.name`      |Extract names in `activity.labels`    |
> | `labels.name.character`      |Cast `labels.name` to character in order to replace activity numbers    |
> | `library(plyr)`      |`plyr` library is loaded to use `revalue` function    |
> | `dataset.descrip$Activity`      |Use `revalue` to modify values of `dataset.descrip$Activity`    |
> | `dataset.labels`      |`dataset.descrip` is renamed as `dataset.labels` for better comprehension    |
> | `dataset2`      |Initialize `dataset2` as `data.frame` with first column of `Activity`    |
> | `for` loop      |Since first column is initialized, decrementing length by 1    |
> | `temp`      |`temp` is used to store subset `data.frame` and change its name    |
> | `write.table`      |File saved to `"./dataset2.txt"` (result)    |
> | `write.csv`      |File saved to `"./dataset2.csv"` (additional)    |




------------------------------------------------
**willowchan**

*Getting and Cleaning Data Course Project.*