GetAndCleanFinalWork
====================

This is the final work of "getting and cleaning data" JHU course.

This work is analysis of the data from ["Human Activity Recognition Using 
Smartphones Dataset"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Structure of the project
The structure of the project is organized in :  
- a "data" directory containing the imported files to analyse and the results. 
"data/external" contains the imported files, "data/results" contains the results.  
- the R scripts are directly under the main directory.   
- some helpers : "README.md" and "CodeBook.md".    

### Imported files
Imported files are saved in **data/external**. We have downloaded and added the 
files contained in a zip : HumanActivityRecognitionUsingSmartphones.zip.  
Unzipping this file will add the directory "UCI HAR Dataset" containing all the 
imported files for the project.  

>To be usable by the scripts, the HumanActivityRecognitionUsingSmartphones.zip
must be unzipped in data/external.

### R Scripts
The project contains two scripts final_work_utils.R and run_analysis.R.

**final_work_utils.R** contains some functions and constants used by the main 
run_analysis.R script :  
- create_df_variables_desc : creates a dataset containing all the features of the 
of the measurements needed for our study. For each row of the dataset, we have 
the corresponding column's number in the measurements files. The features are 
filtered : only the -mean() and -std() features are kept.  
- DF_FEATURES is the result of create_df_variables_desc(). This constant is 
saved in the environment.  
- create_df_activity_labels : creates a dataset containing all the activities of
the measurements. For each row o f the dataset we have the id of the activity and 
its label.  
- DF_ACTIVITIES is the result create_df_activity_labels(). This constant is saved 
in the environment.  
- transform_set : creates a dataset from three files  
  - X_???.txt (??? being "test" or "train") : each row decsribes one experiment  
  - subject_???.txt (??? being "test" or "train") : each row describes the id of 
  the user for the corresponding row in X_???.txt.  
  - y_???.txt (??? being "test" or "train") : each row describes the id the activity 
  for the corresponding row in X_???.txt  

>Inertial signals : the imported files contain some "inertial signals" measurements.
Our study is only interested in the -mean() and -std() features. We didn't use 
the intertial signals. 

**run_analysis.R** is the main script file. It creates two datasets, one for the 
training measurements and one for the test measurements and bind them in a final 
resulting dataset : df_measurements.  
From df_measurements, it then creates df_measurements_means which contains the mean 
of all the features of df_measurements grouped by activity and subject.  
Finally, two two resulting datasets are saved (see below).

### Results
Two resulting datasets are saved in the **data/results** directory :  
- measurements.csv for df_measurements  
- means_by_activity_subject.csv for df_measurements_means  

### Helpers
The project contaons two more files :  
- README.md (the file you are reading now) describes the project organization  
- CodeBook.md describes the datasets created by run_analysis.R  

## How to use the project
First unzip HumanActivityRecognitionUsingSmartphones.zip in data/external.  
Second source/run the script run_analysis.R.

You will find the results in data/results.

