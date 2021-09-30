GetAndCleanFinalWork CodeBook
=============================

The purpose of this project is to to build two datasets extracted from the analysis 
["Human Activity Recognition Using 
Smartphones Dataset"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

________________________________________________________________________________
## The imported data
Imported raw data are saved in the archive file :

* `data/external/HumanActivityRecognitionUsingSmartphones.zip`

This file must be unzipped in `data/external`. Then the raw data are in `data/external/UCI HAR Dataset`.

The raw data of the HAR project are described in :

* `data/external/UCI HAR Dataset/README.txt` : the HAR project and how are organized the data
* `data/external/UCI HAR Dataset/features_info.txt` : the different available measurements

For our studies, we use those HAR data :

* `data/external/UCI HAR Dataset/activity_labels.txt` : the list of the 6 different 
activities used during the experiments
* `data/external/UCI HAR Dataset/features.txt` : the list of all the features mezsured 
during an experiment. For each feature, the corresponding column number in the 
measurements datasets is given
* `data/external/UCI HAR Dataset/test/X_test.txt` : the list of the features for the 
experiments. Each row corresponds to an experiment
* `data/external/UCI HAR Dataset/test/y_test.txt` : the list of the activities for 
the experiments. each row gives the id of activity and corresponds to a row in the 
`X_test.txt`
* `data/external/UCI HAR Dataset/train/subject_test.txt` : the list of the subject doing
the exepriment. Each row correponds to a row of `X_test.txt`
* `data/external/UCI HAR Dataset/train/X_train.txt` : the list of the features for the 
experiments. Each row corresponds to an experiment
* `data/external/UCI HAR Dataset/train/y_train.txt` : the list of the activities for 
the experiments. each row gives the id of activity and corresponds to a row in the 
`X_train.txt`
* `data/external/UCI HAR Dataset/test/subject_train.txt` : the list of the subject doing
the experiment. Each row correponds to a row of `X_train.txt`

The train and test directories have also an `Inertial Signals` sub directory containing
more measurments, but they are out of the scope of the project since they don't 
contain mean and std values.

________________________________________________________________________________
## The processed data

### The measurements dataframe
The features columns are described in `features.txt`. Those data are processed 
into a clean dataframe, with only the columns of interests for the project, and 
with a proper name for each column :  
1. the columns are renamed in feat_id (the column number) and feat_name (the feature name)  
2. the columns are filtered : only the feature with a name containg "-mean()" or 
"-std()" are kept  
3. the "()" at the end of the column's name is removed  
4. the column's names are lowered  

The activities are described in `activity_labels.txt`. Those data are processed into
a clean daframe. The columns of this dataframe are renamed in "activity_id" and 
"activity_label".  

The measurements are split in two different places : test and train. each of them 
are processed to give two cleaned dataframes :  
1. The features are filtered using the dataframe containing the features description  
2. The activities described in `y_test.txt` (or `y_train.txt`) are added to the measurements  
3. The subjects described in `subject_test.txt` (or `subject_train.txt`) are added 
to the measurements  
4. This new dataframe is merged with the "activity labels dataframe" previously 
processed  
5. The column "activity_id" is removed  
6. the column "activity_label" is renamed in "activity"  
7. the column describing the suject is renamed in "subject"  
8. the measurement's columns are renamed with their proper name found in the 
feature dataframe  

Finally the test and train dataframes are row bound and eventual rows with NA values 
are removed, so we get the final measurements dataframe, saved in `data/results/measurements.csv`.

### The mean by activity and subject dataframe
The measurements dataframe previously built is used to process the mean by activity
and subject dataframe. A groupby is done by activity and subject, and a summary using 
mean method is applied.

The mean by activity and subject dataframe is saved in `data/results/means_by_activity_subject.csv`.

________________________________________________________________________________
## Description of the data - measurements.csv
### Columns 1 to 66
The table is organized :

* Column number : the number of the column in the dataset  
* Column Name : the name of the column in the dataset  
* Feature : the corresponding feature in the measurement  
* Orig. col. nbr : the column number in the original measurement datasets  

| Column number   | Column Name               | Feature                     | Orig. col. nbr |
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

### Column 67
The table is organized :

* Column number : the number of the column in the dataset  
* Column Name : the name of the column in the dataset  
* Description : the description of the feature  

| Column number   | Column Name               | Description                                  |
|:---------------:|:--------------------------|:---------------------------------------------|
| 68              | subject                   | The id of the subject for the measurement    |

### Column 68
The table is organized :

* Column number : the number of the column in the dataset  
* Column Name : the name of the column in the dataset  
* Description : the description of the feature  

| Column number   | Column Name               | Description                                  |
|:---------------:|:--------------------------|:---------------------------------------------|
| 67              | activity                  | The name of the activity for the measurement |

________________________________________________________________________________
## Description of the data - means_by_activity_subject.csv
### Column 1
The table is organized :

* Column number : the number of the column in the dataset  
* Column Name : the name of the column in the dataset  
* Description : the description of the feature  

| Column number   | Column Name               | Description                                  |
|:---------------:|:--------------------------|:---------------------------------------------|
| 1               | activity                  | The name of the activity for the measurement |

### Column 2
The table is organized :

* Column number : the number of the column in the dataset  
* Column Name : the name of the column in the dataset  
* Description : the description of the feature  

| Column number   | Column Name               | Description                                  |
|:---------------:|:--------------------------|:---------------------------------------------|
| 2               | subject                   | The id of the subject for the measurement    |

### Columns 3 to 68
The table is organized :

* Column number : the number of the column in the dataset  
* Column Name : the name of the column in the dataset  
* Feature : the corresponding feature in the measurement  

| Column number   | Column Name               | Feature                             |
|:---------------:|:--------------------------|:------------------------------------|
| 3               | tbodyacc-mean-x           | mean of tBodyAcc-mean()-X           |
| 4               | tbodyacc-mean-y           | mean of tBodyAcc-mean()-Y           |
| 5               | tbodyacc-mean-z           | mean of tBodyAcc-mean()-Z           |
| 6               | tbodyacc-std-x            | mean of tBodyAcc-std()-X            |
| 7               | tbodyacc-std-y            | mean of tBodyAcc-std()-Y            |
| 8               | tbodyacc-std-z            | mean of tBodyAcc-std()-Z            |
| 9               | tgravityacc-mean-x        | mean of tGravityAcc-mean()-X        |
| 10              | tgravityacc-mean-y        | mean of tGravityAcc-mean()-Y        |
| 11              | tgravityacc-mean-z        | mean of tGravityAcc-mean()-X        |
| 12              | tgravityacc-std-x         | mean of tGravityAcc-std()-X         |
| 13              | tgravityacc-std-y         | mean of tGravityAcc-std()-Y         |
| 14              | tgravityacc-std-z         | mean of tGravityAcc-std()-Z         |
| 15              | tbodyaccjerk-mean-x       | mean of tBodyAccJerk-mean()-X       |
| 16              | tbodyaccjerk-mean-y       | mean of tBodyAccJerk-mean()-Y       |
| 17              | tbodyaccjerk-mean-z       | mean of tBodyAccJerk-mean()-Z       |
| 18              | tbodyaccjerk-std-x        | mean of tBodyAccJerk-std()-X        |
| 19              | tbodyaccjerk-std-y        | mean of tBodyAccJerk-std()-Y        |
| 20              | tbodyaccjerk-std-z        | mean of tBodyAccJerk-std()-Z        |
| 21              | tbodygyro-mean-x          | mean of tBodyGyro-mean()-X          |
| 22              | tbodygyro-mean-y          | mean of tBodyGyro-mean()-Y          |
| 23              | tbodygyro-mean-z          | mean of tBodyGyro-mean()-Z          |
| 24              | tbodygyro-std-x           | mean of tBodyGyro-std()-X           |
| 25              | tbodygyro-std-y           | mean of tBodyGyro-std()-Y           |
| 26              | tbodygyro-std-z           | mean of tBodyGyro-std()-Z           |
| 27              | tbodygyrojerk-mean-x      | mean of tBodyGyroJerk-mean()-X      |
| 28              | tbodygyrojerk-mean-y      | mean of tBodyGyroJerk-mean()-Y      |
| 29              | tbodygyrojerk-mean-z      | mean of tBodyGyroJerk-mean()-Z      |
| 30              | tbodygyrojerk-std-x       | mean of tBodyGyroJerk-std()-X       |
| 31              | tbodygyrojerk-std-y       | mean of tBodyGyroJerk-std()-Y       |
| 32              | tbodygyrojerk-std-z       | mean of tBodyGyroJerk-std()-Z       |
| 33              | tbodyaccmag-mean          | mean of tBodyAccMag-mean()          |
| 34              | tbodyaccmag-std           | mean of tBodyAccMag-std()           |
| 35              | tgravityaccmag-mean       | mean of tGravityAccMag-mean()       |
| 36              | tgravityaccmag-std        | mean of tGravityAccMag-std()        |
| 37              | tbodyaccjerkmag-mean      | mean of tBodyAccJerkMag-mean()      |
| 38              | tbodyaccjerkmag-std       | mean of tBodyAccJerkMag-std()       |
| 39              | tbodygyromag-mean         | mean of tBodyGyroMag-mean()         |
| 40              | tbodygyromag-std          | mean of tBodyGyroMag-std()          |
| 41              | tbodygyrojerkmag-mean     | mean of tBodyGyroJerkMag-mean()     |
| 42              | tbodygyrojerkmag-std      | mean of tBodyGyroJerkMag-std()      |
| 43              | fbodyacc-mean-x           | mean of fBodyAcc-mean()-X           |
| 44              | fbodyacc-mean-y           | mean of fBodyAcc-mean()-Y           |
| 45              | fbodyacc-mean-z           | mean of fBodyAcc-mean()-Z           |
| 46              | fbodyacc-std-x            | mean of fBodyAcc-std()-X            |
| 47              | fbodyacc-std-y            | mean of fBodyAcc-std()-Y            |
| 48              | fbodyacc-std-z            | mean of fBodyAcc-std()-Z            |
| 49              | fbodyaccjerk-mean-x       | mean of fBodyAccJerk-mean()-X       |
| 50              | fbodyaccjerk-mean-y       | mean of fBodyAccJerk-mean()-Y       |
| 51              | fbodyaccjerk-mean-z       | mean of fBodyAccJerk-mean()-Z       |
| 52              | fbodyaccjerk-std-x        | mean of fBodyAccJerk-std()-X        |
| 53              | fbodyaccjerk-std-y        | mean of fBodyAccJerk-std()-Y        |
| 54              | fbodyaccjerk-std-z        | mean of fBodyAccJerk-std()-Z        |
| 55              | fbodygyro-mean-x          | mean of fBodyGyro-mean()-X          |
| 56              | fbodygyro-mean-y          | mean of fBodyGyro-mean()-Y          |
| 57              | fbodygyro-mean-z          | mean of fBodyGyro-mean()-Z          |
| 58              | fbodygyro-std-x           | mean of fBodyGyro-std()-X           |
| 59              | fbodygyro-std-y           | mean of fBodyGyro-std()-Y           |
| 60              | fbodygyro-std-z           | mean of fBodyGyro-std()-Z           |
| 61              | fbodyaccmag-mean          | mean of fBodyAccMag-mean()          |
| 62              | fbodyaccmag-std           | mean of fBodyAccMag-std()           |
| 63              | fbodybodyaccjerkmag-mean  | mean of fBodyBodyAccJerkMag-mean()  |
| 64              | fbodybodyaccjerkmag-std   | mean of fBodyBodyAccJerkMag-std()   |
| 65              | fbodybodygyromag-mean     | mean of fBodyBodyGyroMag-mean()     |
| 66              | fbodybodygyromag-std      | mean of fBodyBodyGyroMag-std()      |
| 67              | fbodybodygyrojerkmag-mean | mean of fBodyBodyGyroJerkMag-mean() |
| 68              | fbodybodygyrojerkmag-std  | mean of fBodyBodyGyroJerkMag-std()  |

________________________________________________________________________________

