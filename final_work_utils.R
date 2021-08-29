

#-------------------------------------------------------------------------------
# create_df_variables_desc :
#   Read features.txt which contains the description of the features given in 
#   the test and training sets.
#
#   The features contains two columns : 
#     - V1 : the column number of the feature in the training and test sets
#     - V2 : the name of the feature
#   V1 and V2 are renamed in feat_id and feat_name respectively.
#
#   For this project we are only interested with the mean and std measures so 
#   we filter the values, keeping only features with "-mean()" or "-std()" in 
#   their name.
#
#   The name of the resulting features is cleaned :
#     - the string "()" is removed from the name
#     - the name is translated to lower case
#-------------------------------------------------------------------------------
create_df_variables_desc <- function() {
  tbl_df(read.table("data/external/UCI HAR Dataset/features.txt")) %>%
    rename(feat_id = V1, feat_name = V2) %>%
    filter(grepl("(-mean|-std)\\(\\)", feat_name)) %>% 
    mutate(feat_name = gsub("\\(\\)", "", feat_name)) %>%
    mutate(feat_name = tolower(feat_name))
}
# create a constant with all the features 
DF_FEATURES <- create_df_variables_desc()

#-------------------------------------------------------------------------------
# create_df_activity_labels :
#   Read activity_labels.txt which contains the codes of the different activities
#   and their corresponding labels.
#
#   The features contains two columns : 
#     - V1 : the column number of the feature in the training and test sets
#     - V2 : the name of the feature
#   V1 and V2 are renamed in feat_id and feat_name respectively.
#
#   For this project we are only interested with the mean and std measures so 
#   we filter the values, keeping only features with "-mean()" or "-std()" in 
#   their name.
#
#   The name of the resulting features is cleaned :
#     - the string "()" is removed from the name
#     - the name is translated to lower case
#-------------------------------------------------------------------------------
create_df_activity_labels <- function() {
  tbl_df(read.table("data/external/UCI HAR Dataset/activity_labels.txt")) %>%
    rename(activity_id = V1, activity_label = V2)
}
# create a constant describing the list of activities and their label
DF_ACTIVITIES <- create_df_activity_labels()


#-------------------------------------------------------------------------------
# transform_set :
# Create a data set from three files :
#   - varriable_file contains the measurements (one line per measurement)
#   - activity_file contains the activity for each measurement
#   - subject_file contains the subject for each measurement
#
# The varaible file is filtered : only the features contained in DF_FEATURES
# are kept.
# The activity and the subject is added to the varaible set, and the activity id
# is replaced by its label (using a merge with DF_ACTIVITIES).
#
# finally, the names of the columns are replaced by a better description.
#
# The resulting data set is returned by the function
#-------------------------------------------------------------------------------
transform_set <- function(subject_file, activity_file, variable_file) {
  df_subjects <- tbl_df(read.table(subject_file)) %>%
    rename(subject = V1)

  df_activity <- tbl_df(read.table(activity_file)) %>%
    rename(activity_id = V1)
  
  df_var <- tbl_df(read.table(variable_file)) %>% 
    select(paste0("V", DF_FEATURES$feat_id)) %>%
    bind_cols(df_activity, df_subjects)

  merge(df_var, DF_ACTIVITIES, by = "activity_id") %>%
    rename(activity = activity_label) %>% 
    select(-activity_id)
  
  names(df_var) <- c(DF_FEATURES$feat_name, "activity", "subject")
  
  df_var
}

