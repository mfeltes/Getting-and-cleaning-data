CodeBook for run_analysis.R

Original data links:
- Description of data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Link to data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Outline of script:
    0. Load required packaages
    1. Download and unzip files
    2. Create vector containing feature names with parentheses removed and "." subbed for "-" (feature.names)
    3. Construct test and train data sets (test.df and train.df, respectively)
    4. Merge test and train data sets (all.data)
    5. Subset data from all.data containing only mean and std features, decode activity column (some.data)
    6. Summarize some.data by taking the mean of each feature, for each subuct, for each activity (summary.data)
    
Variables and dataframes:
- Raw data:
    - features - table of feature names
    - feature.names - vector of feature names
    
    - tables collected for both test and train data sets, respectively
        .subject - table of subject ID's
        .activity - table of activity codes (1-5 corresponding to walking, walking_upstairs, walking_downstairs, sitting, standing and laying)
        .data - table of features

- Constructed data frames:
    - test.df - dataframe containing subject ID, activity ID, and feature data for each test subject
    - train.df - dataframe containing subject ID, activity ID, and feature data for each test subject
    - all.data - merging of test.df and train.df
    
    - some.data - subset of all.data for only mean and std features. Activity feature is decoded.
    - summary.data - mean of some.data features, calculated for each subject for each activity

Features in some.data and summary.data: 
    1  subject                      
    2  activity                     
    3  tBodyAcc.mean.X              
    4  tBodyAcc.mean.Y              
    5  tBodyAcc.mean.Z              
    6  tBodyAcc.std.X               
    7  tBodyAcc.std.Y               
    8  tBodyAcc.std.Z               
    9  tGravityAcc.mean.X           
    10 tGravityAcc.mean.Y           
    11 tGravityAcc.mean.Z           
    12 tGravityAcc.std.X            
    13 tGravityAcc.std.Y            
    14 tGravityAcc.std.Z            
    15 tBodyAccJerk.mean.X          
    16 tBodyAccJerk.mean.Y          
    17 tBodyAccJerk.mean.Z          
    18 tBodyAccJerk.std.X           
    19 tBodyAccJerk.std.Y           
    20 tBodyAccJerk.std.Z           
    21 tBodyGyro.mean.X             
    22 tBodyGyro.mean.Y             
    23 tBodyGyro.mean.Z             
    24 tBodyGyro.std.X              
    25 tBodyGyro.std.Y              
    26 tBodyGyro.std.Z              
    27 tBodyGyroJerk.mean.X         
    28 tBodyGyroJerk.mean.Y         
    29 tBodyGyroJerk.mean.Z         
    30 tBodyGyroJerk.std.X          
    31 tBodyGyroJerk.std.Y          
    32 tBodyGyroJerk.std.Z          
    33 tBodyAccMag.mean             
    34 tBodyAccMag.std              
    35 tGravityAccMag.mean          
    36 tGravityAccMag.std           
    37 tBodyAccJerkMag.mean         
    38 tBodyAccJerkMag.std          
    39 tBodyGyroMag.mean            
    40 tBodyGyroMag.std             
    41 tBodyGyroJerkMag.mean        
    42 tBodyGyroJerkMag.std         
    43 fBodyAcc.mean.X              
    44 fBodyAcc.mean.Y              
    45 fBodyAcc.mean.Z              
    46 fBodyAcc.std.X               
    47 fBodyAcc.std.Y               
    48 fBodyAcc.std.Z               
    49 fBodyAcc.meanFreq.X          
    50 fBodyAcc.meanFreq.Y          
    51 fBodyAcc.meanFreq.Z          
    52 fBodyAccJerk.mean.X          
    53 fBodyAccJerk.mean.Y          
    54 fBodyAccJerk.mean.Z          
    55 fBodyAccJerk.std.X           
    56 fBodyAccJerk.std.Y           
    57 fBodyAccJerk.std.Z           
    58 fBodyAccJerk.meanFreq.X      
    59 fBodyAccJerk.meanFreq.Y      
    60 fBodyAccJerk.meanFreq.Z      
    61 fBodyGyro.mean.X             
    62 fBodyGyro.mean.Y             
    63 fBodyGyro.mean.Z             
    64 fBodyGyro.std.X              
    65 fBodyGyro.std.Y              
    66 fBodyGyro.std.Z              
    67 fBodyGyro.meanFreq.X         
    68 fBodyGyro.meanFreq.Y         
    69 fBodyGyro.meanFreq.Z         
    70 fBodyAccMag.mean             
    71 fBodyAccMag.std              
    72 fBodyAccMag.meanFreq         
    73 fBodyBodyAccJerkMag.mean     
    74 fBodyBodyAccJerkMag.std      
    75 fBodyBodyAccJerkMag.meanFreq 
    76 fBodyBodyGyroMag.mean        
    77 fBodyBodyGyroMag.std         
    78 fBodyBodyGyroMag.meanFreq    
    79 fBodyBodyGyroJerkMag.mean    
    80 fBodyBodyGyroJerkMag.std     
    81 fBodyBodyGyroJerkMag.meanFreq
