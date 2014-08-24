##Getting and Cleaning Data Project
##Training Dataset.......

train1<-read.table("./UCI HAR Dataset/train/X_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
measurement_type<-features$V2
colnames(train1)<-measurement_type
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train)<-"subject_id"
training_labels<-read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(training_labels)<-"activity_type"
train_set1<-cbind(training_labels,train1)
train_set2<-cbind(subject_train,train_set1)

## Test Dataset
test1<-read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(test1)<-measurement_type
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test)<-"subject_id"
testing_labels<-read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(testing_labels)<-"activity_type"
test_set1<-cbind(testing_labels,test1)
test_set2<-cbind(subject_test,test_set1)

##Merged Dataset
merged_data<-rbind(train_set2,test_set2)
cols_of_int_means<-grep("mean",colnames(merged_data))
cols_of_int_sd<-grep("std",colnames(merged_data))
cols_of_int<-c(1,2,cols_of_int_means,cols_of_int_sd)
merged_data_subset<-merged_data[,cols_of_int]
library(reshape2)
merged_data_subset_melt<-melt(merged_data_subset,id=c("subject_id","activity_type"))
dataset_mean_of_vars<-dcast(merged_data_subset_melt,subject_id+activity_type~variable,mean)

## Renaming "Mean" variables
mean_varnames<-colnames(dataset_mean_of_vars)[3:81]
mean_label<-rep("Mean",79)
mean_col_labels<-paste(mean_label,mean_varnames)
colnames(dataset_mean_of_vars)<-c(c("subject_id","activity_type"),mean_col_labels)
ordered_final_output<-dataset_mean_of_vars[order(dataset_mean_of_vars$subject_id,dataset_mean_of_vars$activity_type),]
##Exporting the "Tidy Data" text file
tidy_data<-write.table(ordered_final_output,file="TidyData.txt",row.name=FALSE)