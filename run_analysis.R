training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

sve = rbind(training, testing)

aktivnosti = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

kara = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
kara[,2] = gsub('-mean', 'Mean', kara[,2])
kara[,2] = gsub('-std', 'SD', kara[,2])
kara[,2] = gsub('[-()]', '', kara[,2])

izbor <- grep('.*Mean.*|.*SD.*', kara[,2])
kara <- kara[izbor,]
izbor <- c(izbor,562,563)
sve <- sve[,izbor]

colnames(sve) <- c(kara$V2, "Activity", "Subject")
colnames(sve) <- tolower(colnames(sve))

aktivnost = 1
for (aktivnostLabel in aktivnosti$V2) {
  sve$activity <- gsub(aktivnost, aktivnostLabel, sve$activity)
  aktivnost <- aktivnost + 1
}

sve$activity <- as.factor(sve$activity)
sve$subject <- as.factor(sve$subject)

tidy = aggregate(sve, by=list(subject=sve$subject, activity = sve$activity), mean)
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy_data_set.txt", sep="\t")
