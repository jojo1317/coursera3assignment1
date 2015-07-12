# Step1
test<-read.table("./test/X_test.txt")  #read in tables X_test, Y_test, subject_test
test.act<-read.table("./test/y_test.txt") 
test.sub<-read.table("./test/subject_test.txt")

train<-read.table("./train/x_train.txt") # read in tables x_train,y_train,subject_train
train.act<-read.table("./train/y_train.txt")
train.sub<-read.table("./train/subject_train.txt")

library(dplyr) # install and call package "dplyr" for the use of "%>%"
CompleteTest<-test%>%bind_cols(test.act)%>%bind_cols(test.sub) #combine test,test.act,test.sub by cols
CompleteTrain<-train%>%bind_cols(train.act)%>%bind_cols(train.sub) #
CompleteTable<-bind_rows(data.frame(CompleteTest),data.frame(CompleteTrain))
write.table(CompleteTable,"./CompleteTable.txt")

# Step2
VarList<-read.table("./features.txt") #read in variable list
VarUsed<-grep("mean|std", VarList[,2]) #find which ones in variable list include words like "mean" or "std"
sub.mean.std<-select(CompleteTable,num_range("V",VarUsed)) # select columns in table CompleteTable named V1, V2...V522


# Step3
label<-read.table("./activity_labels.txt") #Read in activity labels
CompleteTable<-left_join(CompleteTable,label,by=c('V1.1'='V1')) #join two tables CompleteTable and label by columns V1.1 and V1
MeanStdTbl<-bind_cols(sub.mean.std,CompleteTable[ ,-(1:562)] ) #add two cols  "subject", "activity" to the table after join

# Step 4
RenameCol<-rename(MeanStdTbl,V562=V1.2, V563=V2.y) #rename the columns 
NewVarList<-data.frame(V1=c(562:563), V2=c("Subject", "Activity")) #create new data set for new var names
NewVarList<-data.frame(bind_rows(data.frame(VarList),NewVarList)) # updata old var list

VarUsed<-c(VarUsed,562:563)
colnames(MeanStdTbl)<-NewVarList$V2[VarUsed] # rename the table MeanStdTbl with names from feature.txt and added colums
temp<-names(MeanStdTbl) #the following 3 steps: Make the col names readable and avoid redundant col for summary function in step 5

temp=gsub('^t','Time.',temp)  #legalize the feature names
temp=gsub('Body','Body.',temp)
temp=gsub('Acc','Acceleration.',temp)
temp=gsub('Gravity','Gravity.',temp)
temp=gsub('Jerk','Jerk.',temp)
temp=gsub('Gyro','Gyroscope.',temp)
temp=gsub('Mag','Magnitude.',temp)
temp=gsub('mean\\(\\)','Mean.',temp)
temp=gsub('std\\(\\)','STD.',temp)
temp=gsub('^f','Frequency.',temp)
temp=gsub('[-\\(\\)]','',temp)
temp=gsub('\\.$','',temp)
temp=gsub('Body.Body','Body',temp)

names(MeanStdTbl)<-temp #update the column names of MeanStdTbl

# Step 5
GroupTbl<-group_by(MeanStdTbl,Activity,Subject) # Group CompleteTable by vars activity.num and subject (names have been standardized)
SumTbl<-summarise_each(GroupTbl,funs(mean)) #summarize the table by mean

write.table(SumTbl,"./AverageOfEachVar.txt",row.name=F) # write the summary table as .txt
