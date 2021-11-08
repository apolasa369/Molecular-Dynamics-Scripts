# Working directory 
setwd("/Users/apolasa/Desktop/Peptides/Analysis/BOND")

#install.packages('TSP', dependencies = TRUE)
#install.packages('seriation', dependencies = TRUE)
#install.packages('corrgram', dependencies = TRUE)
# Libraries
library(ggplot2)
library(Rmisc)
library(lattice)
library(plyr)
library(gclus)
library(TSP)
library(cluster)
library(seriation)
library(corrgram)
library(grid)
library(reshape2)
library(RColorBrewer)
library(GGally)

Data <- read.table("YLALW.txt", header = FALSE)
attach(Data)
colnames(Data) <- c("YLALW")

BOND_YLALW <- ggplot(Data, aes(qy=YLALW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,1000) + ylim(0,3) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YLALW.pdf", width=8.27, height=5.83)
plot(BOND_YLALW)
dev.off()





Data <- read.csv("YLALW.txt", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PO", "MEAN_PW")


BOND_YLALW <- ggplot(Data, aes(x=MEAN_PO, y=MEAN_PW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,200) + ylim(0,500) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YLALW.pdf", width=8.27, height=5.83)
plot(BOND_YLALW)
dev.off()

Data <- read.csv("YLKLW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PO", "MEAN_PW")


BOND_YLKLW <- ggplot(Data, aes(x=MEAN_PO, y=MEAN_PW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,200) + ylim(0,500) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YLKLW.pdf", width=8.27, height=5.83)
plot(BOND_YLKLW)
dev.off()

Data <- read.csv("YLFLW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PO", "MEAN_PW")


BOND_YLFLW <- ggplot(Data, aes(x=MEAN_PO, y=MEAN_PW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,200) + ylim(0,500) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YLFLW.pdf", width=8.27, height=5.83)
plot(BOND_YLFLW)
dev.off()

Data <- read.csv("YLLLW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PO", "MEAN_PW")


BOND_YLLLW <- ggplot(Data, aes(x=MEAN_PO, y=MEAN_PW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,200) + ylim(0,500) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YLLLW.pdf", width=8.27, height=5.83)
plot(BOND_YLLLW)
dev.off()


Data <- read.csv("YSASW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PO", "MEAN_PW")


BOND_YSASW <- ggplot(Data, aes(x=MEAN_PO, y=MEAN_PW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,200) + ylim(0,500) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YSASW.pdf", width=8.27, height=5.83)
plot(BOND_YSASW)
dev.off()


Data <- read.csv("YSFSW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PO", "MEAN_PW")


BOND_YSFSW <- ggplot(Data, aes(x=MEAN_PO, y=MEAN_PW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,200) + ylim(0,500) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YSFSW.pdf", width=8.27, height=5.83)
plot(BOND_YSFSW)
dev.off()

Data <- read.csv("YSKSW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PO", "MEAN_PW")


BOND_YSKSW <- ggplot(Data, aes(x=MEAN_PO, y=MEAN_PW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,200) + ylim(0,500) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YSKSW.pdf", width=8.27, height=5.83)
plot(BOND_YSKSW)
dev.off()


Data <- read.csv("YSLSW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PO", "MEAN_PW")


BOND_YSLSW <- ggplot(Data, aes(x=MEAN_PO, y=MEAN_PW)) + theme_bw() + geom_point() + labs(x="", y="") + xlim(0,200) + ylim(0,500) + theme(axis.text=element_text(size=20))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/BOND/BOND_YSLSW.pdf", width=8.27, height=5.83)
plot(BOND_YSLSW)
dev.off()


