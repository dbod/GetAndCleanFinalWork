library(dplyr)
library(tidyr)
source("final_work_utils.R")

#-------------------------------------------------------------------------------
# Create the training an test data sets from transform_set
#   - The test set is defined in /data/external/UCI HAR Dataset/test
#     - X_test.txt : contains the features
#     - y_test.txt : contains the activities
#     - subject_test.txt : contains the subjects
#   - The training set is /data/external/UCI HAR Dataset/test
#     - X_train.txt : contains the features
#     - y_train.txt : contains the activities
#     - subject_train.txt : contains the subjects
#-------------------------------------------------------------------------------
df_test <- transform_set("data/external/UCI HAR Dataset/test/subject_test.txt", 
                              "data/external/UCI HAR Dataset/test/y_test.txt", 
                              "data/external/UCI HAR Dataset/test/X_test.txt")
df_train <- transform_set("data/external/UCI HAR Dataset/train/subject_train.txt", 
                         "data/external/UCI HAR Dataset/train/y_train.txt", 
                         "data/external/UCI HAR Dataset/train/X_train.txt")

#-------------------------------------------------------------------------------
# Merge the training and the test sets (df_test an df_train) to get all the 
# measurements of the experiments.
#
# df_train and df_test are removed from the environment after the merge.
#-------------------------------------------------------------------------------
df_measurements <- df_train %>% bind_rows(df_test) %>% drop_na()
rm(list = c("df_test", "df_train"))


#-------------------------------------------------------------------------------
# Group the measurements by activity and subject, and compute the mean for all 
# the features.
#-------------------------------------------------------------------------------
df_measurements_means <- df_measurements %>% group_by(activity, subject) %>% summarise_all(mean)

#-------------------------------------------------------------------------------
# Save the two resulting datasets in data/results :
#   - measurements.csv
#   - means_by_activity_subject.csv
#-------------------------------------------------------------------------------
write.csv(df_measurements, "data/results/measurements.csv", row.names = FALSE)
write.csv(df_measurements_means, "data/results/means_by_activity_subject.csv", row.names = FALSE)


