GettingCleaningDataProject
==========================
My project code and documentation for my Coursera class: Getting &amp; Cleaning data
For the codebook, please refer to Codebook.md

The R code file 'run_analyis.R' has code organized in the following logical steps.

 Step 0 - Setup packages /n
 Step 1 - Read all Test data 
 Step 2 - Read all Training data
 Step 3 - Combine all Test data into 1 dataframe
 Step 4 - Combine all Training data into 1 dataframe
 Step 5 - Combine Test and Training data into 1 dataframe (all_data)
 Step 6 - Read all descriptions of the 561 features

 Step 7 - In addition to the features, add the 'Subject ID' and 'Activity ID' to the feature descriptions
 Now we have a dataframe with all the observations with Subject ID, Activity ID and 561 features for each observation features <- c("Subject ID", "Activity ID", features)

 Step 8 - Assign the descriptive column names to our complete dataset
 Step 9 - Get only the features which have mean and std deviation measures
 Step 10 - Make the tidy dataset with the average of each variable for a SubjectID, ActivityID
 Step 11 - Make the text file with the Tidy dataset! Voila! Done!


