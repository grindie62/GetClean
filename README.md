GetClean
========

Getting &amp; Cleaning Data Project

Codebook:TidyData.txt
Columns Description:Total of 81 columns
Column1 : "subject_id" : Ranges from 1 to  30 and identifies the subject whose activities were measured
Column 2: "activity_type":Ranges from 1 to 6 and corresponds to the six types of activites carried out by each subject id
Columns 3 to 81: "Mean tBodyAcc-mean()-X"  onwards:The mean of the measurement for each subject for each activity performed by the subject
Rows Description: Total of 160 rows
Rows 1:6 corresponds to activities 1 to 6 for subject 1
Rows2:12 corresponds to activities 1 to 6 for subject 2
Remaining rows follow the same pattern as described above

Script Description:
1)Training Dataset:The subject id from the subject test data file and the subject activity from the subject train data set are merged with the measurement dataset from the X_Train file
2) Test Dataset:Similar procedure was followed with the Test data files
3) The Training dataset and Test dataset were merged using the column bind approacj
4) The Merged dataset was identified for the "Mean' and "STD" variables and only these variables were extracted using the "grep" function .The means for each of the measurements was calculated using the  "dcast" function of the reshape2 package. 
5) The file consisting of 180 rows and 81 columns was exported as a txt file.
