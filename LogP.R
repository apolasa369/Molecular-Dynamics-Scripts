setwd("/Users/apolasa/Desktop/Peptides/Analysis/FEP")

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

Data <- read.csv("YLALW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PW", "STD_PW", "MEAN_PO", "STD_PO")

octanol_logp_YLALW = (Data$MEAN_PW-Data$MEAN_PO)/(2.303*0.6)
octanol_logp_YLALW 


Data <- read.csv("YLKLW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PW", "STD_PW", "MEAN_PO", "STD_PO")

octanol_logp_YLKLW = (Data$MEAN_PW-Data$MEAN_PO)/(2.303*0.6)
octanol_logp_YLKLW 


Data <- read.csv("YLFLW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PW", "STD_PW", "MEAN_PO", "STD_PO")

octanol_logp_YLFLW = (Data$MEAN_PW-Data$MEAN_PO)/(2.303*0.6)
octanol_logp_YLFLW 

Data <- read.csv("YLLLW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PW", "STD_PW", "MEAN_PO", "STD_PO")

octanol_logp_YLLLW = (Data$MEAN_PW-Data$MEAN_PO)/(2.303*0.6)
octanol_logp_YLLLW 
 


Data <- read.csv("YSASW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PW", "STD_PW", "MEAN_PO", "STD_PO")

octanol_logp_YSASW = (Data$MEAN_PW-Data$MEAN_PO)/(2.303*0.6)
octanol_logp_YSASW

Data <- read.csv("YSKSW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PW", "STD_PW", "MEAN_PO", "STD_PO")

octanol_logp_YSKSW = (Data$MEAN_PW-Data$MEAN_PO)/(2.303*0.6)
octanol_logp_YSKSW


Data <- read.csv("YSFSW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PW", "STD_PW", "MEAN_PO", "STD_PO")

octanol_logp_YSFSW = (Data$MEAN_PW-Data$MEAN_PO)/(2.303*0.6)
octanol_logp_YSFSW

Data <- read.csv("YSLSW_2.cvs", header=FALSE)
attach(Data)
colnames(Data) <- c("MEAN_PW", "STD_PW", "MEAN_PO", "STD_PO")

octanol_logp_YSLSW = (Data$MEAN_PW-Data$MEAN_PO)/(2.303*0.6)
octanol_logp_YSLSW


octanol_logp_YLALW 
octanol_logp_YLKLW 
octanol_logp_YLFLW 
octanol_logp_YLLLW 

octanol_logp_YSASW
octanol_logp_YSKSW
octanol_logp_YSFSW
octanol_logp_YSLSW


library(ggplot2)
library(readxl)
Logp <- read_excel("Logp.xlsx")
attach(Logp)
colnames(Logp) <- c("Peptide", "logp")

LOG_P <- ggplot(data = Logp , aes(name, -logp, color = name)) +
  geom_bar(stat="identity", width=0.5) + theme_bw() + labs(x="Peptide", y="LogP_octanol") + ylim(-6,12) + theme(axis.text=element_text(size=20)) +
  scale_color_manual(values = c("YLALW" = "red", "YLKLW" = "blue", "YLLLW" = "green", "YSASW" = "brown", "YSKSW" = "black", "YSLSW" = "magenta"))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/FEP/LOGP.pdf", width=8.27, height=5.83)
plot(LOG_P)
dev.off()




Logp <- read_excel("logp_2.xls")
attach(Logp)
colnames(Logp) <- c("Peptide", "logp")

LOG_P <- ggplot(data = Logp , aes(name, logp, color = name)) +
  geom_bar(stat="identity", width=0.5) + theme_bw() + labs(x="Peptide", y="LogP_octanol") + ylim(-2,2) + theme(axis.text=element_text(size=20)) +
  scale_color_manual(values = c("YLALW" = "red", "YLKLW" = "blue", "YLLLW" = "green", "YSASW" = "brown", "YSKSW" = "black", "YSLSW" = "magenta"))
pdf(file="/Users/apolasa/Desktop/Peptides/Analysis/FEP/logp_2.pdf", width=8.27, height=5.83)
plot(LOG_P)
dev.off()

