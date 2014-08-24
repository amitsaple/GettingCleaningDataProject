
# Step 1 - Read all Test data 
test_activity_data <- read.table("test/y_test.txt", sep=" ", header=FALSE)
test_subject_data <- read.table("test/subject_test.txt", sep=" ", header=FALSE)
test_feature_data <- read.delim("test/X_test.txt", sep="", header=FALSE)

# Step 2 - Read all Training data
train_activity_data <- read.table("train/y_train.txt", sep=" ", header=FALSE)
train_subject_data <- read.table("train/subject_train.txt", sep=" ", header=FALSE)
train_feature_data <- read.delim("train/X_train.txt", sep="", header=FALSE)

# Step 3 - Combine all Test data into 1 dataframe
test_data <- cbind(test_subject_data, test_activity_data, test_feature_data)

# Step 4 - Combine all Training data into 1 dataframe
train_data <- cbind(train_subject_data, train_activity_data, train_feature_data)

# Step 5 - Combine Test and Training data into 1 dataframe (all_data)
all_data <- rbind(test_data, train_data)

# Step 6 - Read all descriptions of the 561 features
features <- readLines("features.txt")

# Step 7 - In addition to the features, add the 'Subject ID' and 'Activity ID' to the feature descriptions
# Now we have a dataframe with all the observations with Subject ID, Activity ID and 561 features for each observation 
features <- c("Subject ID", "Activity ID", features)

# Step 8 - Assign the descriptive column names to our complete dataset
names(all_data) <- features

# Step 9 - Get only the features which have mean and std deviation measures
std_features <-  grep("std", features, value = TRUE)
mean_features <- grep("mean", features, value = TRUE)
required_features <- c("Subject ID", "Activity ID", std_features, mean_features)
required_data <- all_data[,required_features]

# Step 10 - Make the tidy dataset with the average of each variable for a SubjectID, ActivityID
tidy_data <- aggregate(required_data, list(required_data$"Subject ID", required_data$"Activity ID"), FUN=mean, na.rm=TRUE)
tidy_data[1] <- NULL # remove extra group field created by aggregate function - 1 of 2
tidy_data[1] <- NULL # remove extra group field created by aggregate function - 2 of 2

# Step 11 - Make the text file with the Tidy dataset! Voila! Done!
write.table(tidy_data, "tidy_data.txt", sep = ",", row.name=FALSE)
