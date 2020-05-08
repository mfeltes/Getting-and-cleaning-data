# 0. load required packages
library(dplyr)

# 1. Download and unzip files
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataURL, "./data")
unzip("./data")

# 2. Create vector containing feature names with parentheses removed and "." subbed for "-"
features <- read.table("./UCI HAR Dataset/features.txt")
feature.names <- as.vector(features$V2) %>%
    gsub(pattern = "\\(", replacement = "") %>%
    gsub(pattern = "\\)", replacement = "") %>%
    gsub(pattern = "-", replacement = ".")

# 3. Construct test and train data sets
    # gather test data and create dataframe (dim = 2947 x 563)
    test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
    test.activity <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
    test.data <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = feature.names)
    test.df <- cbind(test.subject, test.activity, test.data)

    # gather train data and create dataframe (dim = 7352 x 563)
    train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject") 
    train.activity <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
    train.data <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = feature.names)
    train.df <- cbind(train.subject, train.activity, train.data)

# 4. Merge test and train dataframes (dim = 10299 x 563)
all.data <- merge(test.df, train.df, all = TRUE)

# 5. Subset data from all.data containing only mean and std features, decode activity column (dim = 10299 x 81)
some.data <- select(all.data, c(1:3, grep("mean|std", names(all.data)))) %>%
    mutate(activity = factor(all.data$activity, labels = c("walking", 
                                                          "walking_upstairs", 
                                                          "walking_downstairs", 
                                                          "sitting", 
                                                          "standing", 
                                                          "laying")))

# 6. Summarize some.data by taking the mean of each feature, for each subject, for each activity (dim = 180 x 81)
summary.data <- group_by(some.data, subject, activity) %>%
    summarize_all(mean)
