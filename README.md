Getting and Cleaning Data Final Work - 1.0
==========================================

This project has been created for as a final work of "getting and cleaning data" 
JHU course on coursera.

The purpose of this project is to create two clean dataset from measurements described
in ["Human Activity Recognition Using 
Smartphones Dataset"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Installation

Unzip **data/external/HumanActivityRecognitionUsingSmartphones.zip**, directly in the 
data/external directory. This zip file contains all the raw data needed for the 
project. The data are from "Human Activity Recognition Using 
Smartphones Dataset" project (HAR).  

The result should be a directory **data/external/UCI HAR Dataset/** containing all
the measurements and more specially :
* data/external/UCI HAR Dataset/README.txt describes the HAR project and how are 
organized the data
* data/external/UCI HAR Dataset/features_info.txt describes the different available 
measurements

## Usage

To start the project, simply execute **run_analysis.R**. This script will create two 
cleaned datasets in **data/results/** :
* measurements.csv
* means_by_activity_subject.csv

Those two resulting files are described in **CodeBook.md**.

## Development

### Structure of the project

The root (or base or main directory) directory contains 4 files :
* README.md (the actual file) explains everything needed to use the project
* CodeBook.md explains the two resulting datasets
* final_work_utils.R contaons some helpers used by run_analysis.R
* run_analysis.R is the main R script to excute to create the resulting datasets

The data are saved in data directory :
* data/external/ is used to store the raw data from HAR imported project
* data/results/ is used to store the resulting datasets

### R scripts

The project contains two scripts : 
* final_work_utils.R
* run_analysis.R.

**run_analysis.R** is the main script file. It creates two resulting dataset following
this process :   
* creation of two transformed datasets from the training and testing raw data. For that 
operation, the function final_work_utils::transform_set is used  
* the training and the test datasets are then binded into a final measurements dataset  
* a group by is then applied on the measurement dataset to obtain the means of the 
measurements grouped by activity and subject  
* finally the two datatsets are saved in csv files  

**final_work_utils.R** contains some helpers and constants used by run_analysis.R.  
By sourcing the script, two constants are created and saved into the environment :  
* DF_FEATURES is created and saved in the environment. It is a dataframe containing 
all the features of the of the measurements needed for the project. Each row of the
dataframe gives the column's number in the raw measurements files analysed. The features 
are filtered : only the -mean() and -std() features are kept  
* DF_ACTIVITIES is created and saved in the environment. It is a dataframe describing
the activities. Each row gives the id the activity and its corresponding label  

The main function of final_work_utils.R is "transform_set". It is called by the main 
script (run_analysis.R) to build a cleaned datafarme from three files :
* X_???.txt (??? being "test" or "train") : each row decsribes one experiment  
* subject_???.txt (??? being "test" or "train") : each row describes the id of 
the user for the corresponding row in X_???.txt  
* y_???.txt (??? being "test" or "train") : each row describes the id the activity 
for the corresponding row in X_???.txt  



________________________________________________________________________________


### where to write that : codebook ? 

>Inertial signals : the imported files contain some "inertial signals" measurements.
Our study is only interested in the -mean() and -std() features. We didn't use 
the intertial signals. 


