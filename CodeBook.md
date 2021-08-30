GetAndCleanFinalWork CodeBook
=============================




| Column number   | Name                      | Feature                     | Orig. col. nbr |
|:---------------:|:--------------------------|:----------------------------|:--------------:|
| 1               | tbodyacc-mean-x           | tBodyAcc-mean()-X           | 1              |
| 2               | tbodyacc-mean-y           | tBodyAcc-mean()-Y           | 2              |
| 3               | tbodyacc-mean-z           | tBodyAcc-mean()-Z           | 3              |
| 4               | tbodyacc-std-x            | tBodyAcc-std()-X            | 4              |
| 5               | tbodyacc-std-y            | tBodyAcc-std()-Y            | 5              |
| 6               | tbodyacc-std-z            | tBodyAcc-std()-Z            | 6              |
| 7               | tgravityacc-mean-x        | tGravityAcc-mean()-X        | 41             |
| 8               | tgravityacc-mean-y        | tGravityAcc-mean()-Y        | 42             |
| 9               | tgravityacc-mean-z        | tGravityAcc-mean()-X        | 43             |
| 10              | tgravityacc-std-x         | tGravityAcc-std()-X         | 44             |
| 11              | tgravityacc-std-y         | tGravityAcc-std()-Y         | 45             |
| 12              | tgravityacc-std-z         | tGravityAcc-std()-Z         | 46             |
| 13              | tbodyaccjerk-mean-x       | tBodyAccJerk-mean()-X       | 81             |
| 14              | tbodyaccjerk-mean-y       | tBodyAccJerk-mean()-Y       | 82             |
| 15              | tbodyaccjerk-mean-z       | tBodyAccJerk-mean()-Z       | 83             |
| 16              | tbodyaccjerk-std-x        | tBodyAccJerk-std()-X        | 84             |
| 17              | tbodyaccjerk-std-y        | tBodyAccJerk-std()-Y        | 85             |
| 18              | tbodyaccjerk-std-z        | tBodyAccJerk-std()-Z        | 86             |
| 19              | tbodygyro-mean-x          | tBodyGyro-mean()-X          | 121            |
| 20              | tbodygyro-mean-y          | tBodyGyro-mean()-Y          | 122            |
| 21              | tbodygyro-mean-z          | tBodyGyro-mean()-Z          | 123            |
| 22              | tbodygyro-std-x           | tBodyGyro-std()-X           | 124            |
| 23              | tbodygyro-std-y           | tBodyGyro-std()-Y           | 125            |
| 24              | tbodygyro-std-z           | tBodyGyro-std()-Z           | 126            |
| 25              | tbodygyrojerk-mean-x      | tBodyGyroJerk-mean()-X      | 161            |
| 26              | tbodygyrojerk-mean-y      | tBodyGyroJerk-mean()-Y      | 162            |
| 27              | tbodygyrojerk-mean-z      | tBodyGyroJerk-mean()-Z      | 163            |
| 28              | tbodygyrojerk-std-x       | tBodyGyroJerk-std()-X       | 164            |
| 29              | tbodygyrojerk-std-y       | tBodyGyroJerk-std()-Y       | 165            |
| 30              | tbodygyrojerk-std-z       | tBodyGyroJerk-std()-Z       | 166            |
| 31              | tbodyaccmag-mean          | tBodyAccMag-mean()          | 201            |
| 32              | tbodyaccmag-std           | tBodyAccMag-std()           | 202            |
| 33              | tgravityaccmag-mean       | tGravityAccMag-mean()       | 214            |
| 34              | tgravityaccmag-std        | tGravityAccMag-std()        | 215            |
| 35              | tbodyaccjerkmag-mean      | tBodyAccJerkMag-mean()      | 227            |
| 36              | tbodyaccjerkmag-std       | tBodyAccJerkMag-std()       | 228            |
| 37              | tbodygyromag-mean         | tBodyGyroMag-mean()         | 240            |
| 38              | tbodygyromag-std          | tBodyGyroMag-std()          | 241            |
| 39              | tbodygyrojerkmag-mean     | tBodyGyroJerkMag-mean()     | 253            |
| 40              | tbodygyrojerkmag-std      | tBodyGyroJerkMag-std()      | 254            |
| 41              | fbodyacc-mean-x           | fBodyAcc-mean()-X           | 266            |
| 42              | fbodyacc-mean-y           | fBodyAcc-mean()-Y           | 267            |
| 43              | fbodyacc-mean-z           | fBodyAcc-mean()-Z           | 268            |
| 44              | fbodyacc-std-x            | fBodyAcc-std()-X            | 269            |
| 45              | fbodyacc-std-y            | fBodyAcc-std()-Y            | 270            |
| 46              | fbodyacc-std-z            | fBodyAcc-std()-Z            | 271            |
| 47              | fbodyaccjerk-mean-x       | fBodyAccJerk-mean()-X       | 345            |
| 48              | fbodyaccjerk-mean-y       | fBodyAccJerk-mean()-Y       | 346            |
| 49              | fbodyaccjerk-mean-z       | fBodyAccJerk-mean()-Z       | 347            |
| 50              | fbodyaccjerk-std-x        | fBodyAccJerk-std()-X        | 348            |
| 51              | fbodyaccjerk-std-y        | fBodyAccJerk-std()-Y        | 349            |
| 52              | fbodyaccjerk-std-z        | fBodyAccJerk-std()-Z        | 350            |
| 53              | fbodygyro-mean-x          | fBodyGyro-mean()-X          | 424            |
| 54              | fbodygyro-mean-y          | fBodyGyro-mean()-Y          | 425            |
| 55              | fbodygyro-mean-z          | fBodyGyro-mean()-Z          | 426            |
| 56              | fbodygyro-std-x           | fBodyGyro-std()-X           | 427            |
| 57              | fbodygyro-std-y           | fBodyGyro-std()-Y           | 428            |
| 58              | fbodygyro-std-z           | fBodyGyro-std()-Z           | 429            |
| 59              | fbodyaccmag-mean          | fBodyAccMag-mean()          | 503            |
| 60              | fbodyaccmag-std           | fBodyAccMag-std()           | 504            |
| 61              | fbodybodyaccjerkmag-mean  | fBodyBodyAccJerkMag-mean()  | 516            |
| 62              | fbodybodyaccjerkmag-std   | fBodyBodyAccJerkMag-std()   | 517            |
| 63              | fbodybodygyromag-mean     | fBodyBodyGyroMag-mean()     | 529            |
| 64              | fbodybodygyromag-std      | fBodyBodyGyroMag-std()      | 530            |
| 65              | fbodybodygyrojerkmag-mean | fBodyBodyGyroJerkMag-mean() | 542            |
| 66              | fbodybodygyrojerkmag-std  | fBodyBodyGyroJerkMag-std()  | 543            |
| 67 | activity |    $1 |
| 68 | subject |    $1 |

