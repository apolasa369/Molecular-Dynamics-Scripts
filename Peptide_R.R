setwd("/Users/apolasa/Desktop/Peptides/Analysis/Linear_R")
#install.packages("Peptides", dependencies=TRUE)
#install.packages("devtools", dependencies = TRUE)
library(devtools)
#install_github("dosorio/Peptides")
library(Peptides)
library(tidyverse)
aaCheck <- function(seq){
  if(!any(lengths(seq) > 1)){
    seq <- toupper(seq)
    seq <- gsub(pattern = "[[:space:]]+",replacement = "",x = seq)
    seq <- strsplit(x = seq,split = "")
  } else {
    seq <- lapply(seq,toupper)
  }
  check <- unlist(lapply(seq,function(sequence){
    !all(sequence%in%c("A" ,"C" ,"D" ,"E" ,"F" ,"G" ,"H" ,"I" ,"K" ,"L" ,"M" ,"N" ,"P" ,"Q" ,"R" ,"S" ,"T" ,"V" ,"W" ,"Y", "-"))
  }))
  if(sum(check) > 0){
    sapply(which(check == TRUE),function(sequence){warning(paste0("Sequence ",sequence," has unrecognized amino acid types. Output value might be wrong calculated"),call. = FALSE)})
  }
  return(seq)
}
aaComp<-function(seq){
  # Remove space characters: tab, newline, vertical tab, form feed, carriage return, space and possibly other locale-dependent characters.
  seq <- aaCheck(seq)
  # Make a frequencies table
  seq <- lapply(seq, function(seq){table(unlist(seq))})
  # Applying composition function
  aacomp <- lapply(seq, function(seq){
    # Create data matrix output
    AA<-matrix(ncol = 1,nrow = 9)
    rownames(AA)<-c("Tiny","Small","Aliphatic","Aromatic","NonPolar","Polar","Charged","Basic","Acidic")
    colnames(AA)<-c("Number")
    # Classify amino acids in a particular class and sum the absolute frequencies
    AA[1,1]<-sum(seq[c("A","C","G","S","T")],na.rm = TRUE)
    AA[2,1]<-sum(seq[c("A","B","C","D","G","N","P","S","T","V")],na.rm = TRUE)
    AA[3,1]<-sum(seq[c("A","I","L","V")],na.rm = TRUE)
    AA[4,1]<-sum(seq[c("F","H","W","Y")],na.rm = TRUE)
    AA[5,1]<-sum(seq[c("A","C","F","G","I","L","M","P","V","W","Y")],na.rm = TRUE)
    AA[6,1]<-sum(seq[c("D","E","H","K","N","Q","R","S","T","Z")],na.rm = TRUE)
    AA[7,1]<-sum(seq[c("B","D","E","H","K","R","Z")],na.rm = TRUE)
    AA[8,1]<-sum(seq[c("H","K","R")],na.rm = TRUE)
    AA[9,1]<-sum(seq[c("B","D","E","Z")],na.rm = TRUE)
    # Compute the relative frequencies for each class in percentage
    return(round(AA,3))
  })
  # Return output matrix rounded to 3 decimals
  return(aacomp)
}
#seq <- (c("YLALW"))
seq <- (c("YLALW","YLKLW","YLLLW","YSASW","YSKSW","YSLSW"))
ratio_seq <- aaComp(seq)
write.table(ratio_seq, file = "ratio_seq.csv", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ",", row.names = TRUE,
            col.names = FALSE, qmethod = c("escape", "double"))
data <- read.table("ratio_seq.csv",sep="",header=FALSE, col.names = c("Variable", "YLALW","YLKLW","YLLLW","YSASW","YSKSW","YSLSW"))

write.table(data, file = "ratio_seq.csv", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ",", row.names = TRUE,
            col.names = NA, qmethod = c("escape", "double"))
m1 <- t(data)
d2 <- data.frame(r1= row.names(m1), m1, row.names=NULL)
m1

write.table(m1, file = "Sequence_ana.txt", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ",", row.names = TRUE,
            col.names = TRUE, qmethod = c("escape", "double"))


YLALW <- read.table("YLALW.txt", header=F)
colnames(YLALW) <- c("YLALW")
df1 <- data_frame(YLALW)

YLALW

YLKLW <- read.table("YLKLW.txt", header=F)
colnames(YLKLW) <- c("YLKLW")
df2 <- data_frame(YLKLW)

YLLLW <- read.table("YLLLW.txt", header=F)
colnames(YLLLW) <- c("YLLLW")
df3 <- data_frame(YLLLW)

YSASW <- read.table("YSASW.txt", header=F)
colnames(YSASW) <- c("YSASW")
df4 <- data_frame(YSASW)

YSKSW <- read.table("YSKSW.txt", header=F)
colnames(YSKSW) <- c("YSKSW")
df5 <- data_frame(YSKSW)

YSLSW <- read.table("YSLSW.txt", header=F)
colnames(YSLSW) <- c("YSLSW")
df6 <- data_frame(YSLSW)

data_table <- cbind(df1[1:11,],df2[1:11,],df3[1:11,],df4[1:11,],df5[1:11,],df6[1:11,])
data_table

write.table(data_table, file = "Partition_COF.txt", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ",", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"))


mydata <- read.table('Partition_COF.txt', header = TRUE)
mydata
mydata1 <- read.table('ratio_seq.csv', header = TRUE, sep = "")
mydata1



